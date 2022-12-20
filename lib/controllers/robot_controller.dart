// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:get/get.dart';
import '../constrants/endpoints.dart';

class RobotController extends GetxController {
  WebSocket? channel; // initialize a websocket channel
  bool isWebsocketRunning = false; // status of websocket
  int retryLimit = 3;

  void startStream() async {
    if (isWebsocketRunning) return; //check if its already runnign

    channel = WebSocket(wsUrl);
    //connect to the websocket

    channel!.addEventListener('open', (event) {
      print('----Connection Open for $wsUrl');
    });
  }

  void closeWebsocketStream() {
    channel!.close();
    isWebsocketRunning = false;
  }
}
