import 'dart:convert';
import 'dart:math' as math;
// ignore: avoid_web_libraries_in_flutter, unused_import
import 'dart:html';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import '../components/custom_marker.dart';
import '../components/robot_marker.dart';
import '../constrants/endpoints.dart';
import '../controllers/robot_controller.dart';
import '../models/all_restaurants.dart';
import '../models/robots_ip.dart';

class MainMap extends StatefulWidget {
  const MainMap({Key? key}) : super(key: key);

  @override
  State<MainMap> createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  List<AllRestaurants> restaurantList = [];
  List<Marker> _markersRobot1 = <Marker>[];
  List<Marker> _markersRobot2 = <Marker>[];
  List robotNames = [];
  List robotTypes = [];
  Map robotType = {};
  String robot1Icons = "display image robot 1 ";
  String robot2Icon = "display image robot 2";

  final List<Marker> _markersRestaurants = <Marker>[];
  List<IpCode> ipCodeList = [];
  Future<List<AllRestaurants>> generateAllRestaurantsList() async {
    String uri = getAllRestaurants;

    var response = await http.get(Uri.parse(uri),
        headers: {"Content-Type": "application/json", "accept": "*/*"});
    var list = json.decode(response.body);
    restaurantList = await list
        .map<AllRestaurants>((json) => AllRestaurants.fromJson(json))
        .toList();

    for (int i = 0; i < restaurantList.length; i++) {
      _markersRestaurants.add(Marker(
        width: 50,
        height: 50,
        point:
            LatLng(restaurantList[i].latitude!, restaurantList[i].longitude!),
        builder: (ctx) => CustomMarker(
          restaurantName: restaurantList[i].name,
          restaurantImage: restaurantList[i].logo,
          restaurantCity: restaurantList[i].city,
          restaurantState: restaurantList[i].state,
          restaurantZip: restaurantList[i].zip,
          restaurantPhone: restaurantList[i].phone,
          restaurantAddress: restaurantList[i].address1,
          restaurantLat: restaurantList[i].latitude.toString(),
          restaurantLong: restaurantList[i].longitude.toString(),
        ),
      ));
    }

    return restaurantList;
  }

  Future<List<IpCode>> generateIpList() async {
    String uri = robotIpAddress;

    var response = await http.get(Uri.parse(uri));
    var list = json.decode(response.body).cast<Map<String, dynamic>>();
    ipCodeList =
        await list.map<IpCode>((json) => IpCode.fromJson(json)).toList();
    return ipCodeList;
  }

  Future constructMap() async {
    var mapGenerated = await generateIpList();
    for (var i = 0; i < mapGenerated.length; i++) {
      var mapKey = mapGenerated[i].name;
      var mapValue = mapGenerated[i].type;

      robotNames.add(mapKey!.toLowerCase());
      robotTypes.add(mapValue!.toLowerCase());
    }
    robotType = Map.fromIterables(robotNames, robotTypes);
    print(robotType);

    return robotType;
  }

  late final MapController mapController;

  @override
  void initState() {
    super.initState();
    generateAllRestaurantsList();
    constructMap();
    initiateRequestRobots();

    mapController = MapController();
  }

  void initiateRequestRobots() async {
    var channel = Get.find<RobotController>().channel;
    var isWsRunning = Get.find<RobotController>().isWebsocketRunning;
    var retryLimit = Get.find<RobotController>().retryLimit;

    if (isWsRunning) return;

    channel!.onMessage.listen((msg) {
      var event = json.decode(msg.data);
      var robotName = event["data"]["skippy"].toString();

      var lat = event["data"]["gps"]["lat"].toString();

      var long = event["data"]["gps"]["lng"].toString();

      var angle = event["data"]["gps"]["angle"].toString();

      LatLng latlng = LatLng(double.parse(lat), double.parse(long));

      if (robotName == "robot1") {
        setState(() {
          _markersRobot1 = <Marker>[];
          print("{$latlng}+ {$robotName} + {$angle} ");
          _addMarkersRobot(
              _markersRobot1,
              robotName,
              latlng,
              double.parse(angle),
              robotType[robotName] == "robot1" ? robot1Icons : robot2Icon,
              robotType[robotName] == "robot1" ? robot1Icons : robot2Icon);
        });
      }

      if (robotName == "robot2") {
        setState(() {
          _markersRobot2 = <Marker>[];

          print("{$latlng}+ {$robotName} + {$angle} ");
          _addMarkersRobot(
              _markersRobot2,
              robotName,
              latlng,
              double.parse(angle),
              robotType[robotName] == "robot1" ? robot1Icons : robot2Icon,
              robotType[robotName] == "robot1" ? robot1Icons : robot2Icon);
        });
      }
    }, onError: (error) {
      print(error);
      isWsRunning = false;
      if (retryLimit > 0) {
        retryLimit--;
        Get.find<RobotController>().startStream();
      }
    }, onDone: () {
      print('-----Done');
      channel.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: LatLng(45.00076796865061, -93.27039033565887),
        zoom: 16,
        minZoom: 3.0,
        maxZoom: 18.25,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: AdaptiveTheme.of(context).mode.isDark
              ? "your darkmode token from map box"
              : "your Lightmode token from map box",
          additionalOptions: {
            'accessToken': 'Your access token',
            'id': 'your map id'
          },
        ),
        MarkerLayerOptions(markers: _markersRobot1),
        MarkerLayerOptions(markers: _markersRobot2),
        MarkerLayerOptions(markers: _markersRestaurants),
      ],
    );
  }

  void _addMarkersRobot(List<Marker> marker, String name, LatLng latlng,
      double angel, String img, String actualImage) {
    marker.add(
      Marker(
        width: 50,
        height: 50,
        point: latlng,
        builder: (ctx) => Transform.rotate(
            angle: angel * math.pi / 180,
            child: RobotMarker(
              skippyName: name,
              skippyImage: img,
              actualMarkerImage: actualImage,
            )),
      ),
    );
  }

  @override
  void dispose() {
    initiateRequestRobots();
    Get.find<RobotController>().closeWebsocketStream();
    super.dispose();
  }
}
