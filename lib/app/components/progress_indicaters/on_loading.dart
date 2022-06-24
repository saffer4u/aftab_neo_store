import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../widgets/background_image.dart';

class OnLoading extends StatelessWidget {
  final String? loadingText;
  const OnLoading({
    this.loadingText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: WHITE_COLOR,
              backgroundColor: WHITE_COLOR70,
            ),
            SizedBox(height: 20),
            loadingText != null
                ? Text(
                    loadingText!,
                    style: Theme.of(context).textTheme.headline4,
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
