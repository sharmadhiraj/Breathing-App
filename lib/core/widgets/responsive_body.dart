import 'package:flutter/material.dart';

class ResponsiveBody extends StatelessWidget {
  final Widget child;

  const ResponsiveBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Center(child: SizedBox(width: 500, child: child));
        }
        return child;
      },
    );
  }
}
