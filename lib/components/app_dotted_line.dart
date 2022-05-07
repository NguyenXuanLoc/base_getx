import 'package:docsify/theme/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';

class AppDotsLine extends StatelessWidget {
  const AppDotsLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DottedLine(
      direction: Axis.horizontal,
      lineLength: double.infinity,
      lineThickness: 1.0,
      dashLength: 4.0,
      dashColor: colorGrey20,
      // dashGradient: [Colors.red, Colors.blue],
      dashRadius: 0.0,
      dashGapLength: 4.0,
      dashGapColor: colorGrey20,
      // dashGapGradient: [Colors.red, Colors.blue],
      dashGapRadius: 0.0,
    );
  }
}
