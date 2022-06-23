import 'package:flutter/material.dart';

import '../../constants/paths.dart';

class BackgroundImage extends StatelessWidget {
  final Widget? child;
  const BackgroundImage({
    Key? key,
     this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: child,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            BACKGROUND_IMAGE_PATH,
          ),
        ),
      ),
    );
  }
}
