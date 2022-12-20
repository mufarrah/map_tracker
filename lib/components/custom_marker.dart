// import 'package:admin/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter/gestures.dart';

class CustomMarker extends StatefulWidget {
  final String? restaurantName;
  final String? restaurantImage;
  final String? restaurantCity;
  final String? restaurantState;
  final String? restaurantZip;
  final String? restaurantPhone;
  final String? restaurantAddress;
  final String? restaurantLat;
  final String? restaurantLong;
  const CustomMarker(
      {Key? key,
      this.restaurantName,
      this.restaurantImage,
      this.restaurantCity,
      this.restaurantState,
      this.restaurantZip,
      this.restaurantPhone,
      this.restaurantAddress,
      this.restaurantLat,
      this.restaurantLong})
      : super(key: key);

  @override
  State<CustomMarker> createState() => _CustomMarkerState();
}

class _CustomMarkerState extends State<CustomMarker> {
  bool amIHovering = false;
  Offset exitFrom = const Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEvent details) {
        setState(() {
          amIHovering = true;
        });
      },
      onExit: (PointerEvent details) {
        setState(() {
          amIHovering = false;
          // storing the exit position
          exitFrom = details
              .localPosition; // You can use details.position if you are interested in the global position of your pointer.
        });
      },
      child: Tooltip(
        height: 20,
        message: widget.restaurantName!,
        child: GestureDetector(
          onTap: () {
            Get.defaultDialog(
                cancel: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.cancel),
                    alignment: Alignment.topRight,
                  ),
                ),
                title: "Restaurant Details",
                content: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                            backgroundImage: widget.restaurantImage == ""
                                ? const AssetImage(
                                    "defualt restaurant image",
                                  ) as ImageProvider
                                : NetworkImage(widget.restaurantImage!),
                            backgroundColor: Colors.white),
                        SelectableText(widget.restaurantName!)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        SelectableText("Address:",
                            style: TextStyle(
                              color:
                                  Theme.of(context).chipTheme.backgroundColor,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        SelectableText(
                          "${widget.restaurantAddress}",
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        SelectableText(
                          "${widget.restaurantCity}, ${widget.restaurantState}, ${widget.restaurantZip}",
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        SelectableText("Phone:",
                            style: TextStyle(
                              color:
                                  Theme.of(context).chipTheme.backgroundColor,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        SelectableText(
                          widget.restaurantPhone!,
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        SelectableText("Lat:",
                            style: TextStyle(
                              color:
                                  Theme.of(context).chipTheme.backgroundColor,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        SelectableText(
                          widget.restaurantLat!,
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        SelectableText("Long:",
                            style: TextStyle(
                              color:
                                  Theme.of(context).chipTheme.backgroundColor,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        SelectableText(widget.restaurantLong!,
                            style: const TextStyle(fontStyle: FontStyle.italic))
                      ],
                    ),
                  ],
                ));
          },
          child: Container(
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/ma.png",
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
                Positioned(
                  width: 40,
                  height: 40,
                  left: 5,
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: CircleAvatar(
                        backgroundImage: widget.restaurantImage == ""
                            ? const AssetImage(
                                "defualt restaurant image",
                              ) as ImageProvider
                            : NetworkImage(widget.restaurantImage!),
                        backgroundColor: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
