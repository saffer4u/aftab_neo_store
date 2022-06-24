import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppLoading extends StatelessWidget {
  final String? loadingText;
  final double? backgroundOpacity;
  const AppLoading({
    Key? key,
    this.loadingText,
    this.backgroundOpacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: BLACK_COLOR.withOpacity(
              backgroundOpacity == null ? 0 : backgroundOpacity!)),
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
