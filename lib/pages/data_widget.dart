import 'package:flutter/material.dart';
import 'package:latihan_bloc/pages/center_widget.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      color: Colors.red,
      child: CenterWidget(),
    );
  }
}
