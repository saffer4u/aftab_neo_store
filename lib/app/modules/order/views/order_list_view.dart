import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../components/widgets/appbar.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: "My Orders"),
    );
  }
}
