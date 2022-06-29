
import 'package:flutter/material.dart';

import 'background_image.dart';

class OnError extends StatelessWidget {
  final String? errText;
  final void Function()? onRefresh;

  const OnError({
    this.errText,
    Key? key,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errText ?? "Something went wrong",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(
            height: 20,
          ),
          TextButton.icon(
            onPressed: onRefresh,
            label: Text("Refresh"),
            icon: Icon(Icons.refresh),
          )
        ],
      )),
    );
  }
}
