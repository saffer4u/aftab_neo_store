import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../enums.dart';



// * Not in user but can be used if there are icon and text in a grid.
class HomeGridItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  final Position iconPosition;
  final Position titlePosition;
   double? edgeSpacing;
   HomeGridItem({
    this.edgeSpacing,
    required this.iconPosition,
    required this.titlePosition,
    required this.title,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    edgeSpacing = edgeSpacing ?? 15;
    return Container(
      color: RED_COLOR800,
      child: Stack(
        children: [
          Builder(
            builder: (context) {
              switch (iconPosition) {
                case Position.topRight:
                  return Positioned(
                    top: edgeSpacing,
                    right: edgeSpacing,
                    child: Icon(icon, color: WHITE_COLOR, size: 70),
                  );
                case Position.topLeft:
                  return Positioned(
                    top: edgeSpacing,
                    left: edgeSpacing,
                    child: Icon(icon, color: WHITE_COLOR, size: 70),
                  );
                case Position.bottomLeft:
                  return Positioned(
                    bottom: edgeSpacing,
                    left: edgeSpacing,
                    child: Icon(icon, color: WHITE_COLOR, size: 70),
                  );
                case Position.bottomRight:
                  return Positioned(
                    bottom: edgeSpacing,
                    right: edgeSpacing,
                    child: Icon(icon, color: WHITE_COLOR, size: 70),
                  );
                default:
                  return Positioned(
                    top: edgeSpacing,
                    right: edgeSpacing,
                    child: Icon(icon, color: WHITE_COLOR, size: 70),
                  );
              }
            },
          ),
          Builder(
            builder: (context) {
              switch (titlePosition) {
                case Position.topRight:
                  return Positioned(
                    top: edgeSpacing,
                    right: edgeSpacing,
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: WHITE_COLOR,
                        fontFamily: Font.Gotham,
                        fontSize: 23,
                      ),
                    ),
                  );
                case Position.topLeft:
                  return Positioned(
                    top: edgeSpacing,
                    left: edgeSpacing,
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: WHITE_COLOR,
                        fontFamily: Font.Gotham,
                        fontSize: 23,
                      ),
                    ),
                  );
                case Position.bottomLeft:
                  return Positioned(
                    bottom: edgeSpacing,
                    left: edgeSpacing,
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: WHITE_COLOR,
                        fontFamily: Font.Gotham,
                        fontSize: 23,
                      ),
                    ),
                  );
                case Position.bottomRight:
                  return Positioned(
                    bottom: edgeSpacing,
                    right: edgeSpacing,
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: WHITE_COLOR,
                        fontFamily: Font.Gotham,
                        fontSize: 23,
                      ),
                    ),
                  );

                default:
                  return Positioned(
                    bottom: edgeSpacing,
                    left: edgeSpacing,
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: WHITE_COLOR,
                        fontFamily: "Gotham",
                        fontSize: 23,
                      ),
                    ),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
