import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RobotMarker extends StatefulWidget {
  final String skippyName;
  final String skippyImage;

  final String actualMarkerImage;

  const RobotMarker({
    Key? key,
    required this.skippyName,
    required this.skippyImage,
    required this.actualMarkerImage,
  }) : super(key: key);

  @override
  State<RobotMarker> createState() => _RobotMarkerState();
}

class _RobotMarkerState extends State<RobotMarker> {
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
        message: widget.skippyName,
        child: GestureDetector(
          onTap: () {
            Get.defaultDialog(
              title: "robot Details",
              content: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          widget.skippyImage,
                        ),
                      ),
                      SelectableText(widget.skippyName)
                    ],
                  ),
                ],
              ),
            );
          },
          child: Container(
            child: Image(
              image: AssetImage(widget.actualMarkerImage),
            ),
          ),
        ),
      ),
    );
  }
}
