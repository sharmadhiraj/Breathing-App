import 'package:flutter/material.dart';

class BackgroundBuilder extends StatelessWidget {
  const BackgroundBuilder({required this.child, super.key});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: isLightMode
                    ? const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [0.31, 0.69],
                        colors: [
                          Color.fromRGBO(99, 0, 104, 0.08),
                          Color.fromRGBO(255, 138, 0, 0.08),
                        ],
                      )
                    : const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 0.4, 1.0],
                        colors: [
                          Color(0xFF1A1128),
                          Color(0xFF2D1B4E),
                          Color(0xFF3A2260),
                        ],
                      ),
              ),
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                "assets/images/${isLightMode ? "light" : "dark"}_cloud_1.png",
                width: 400,
              ),
            ),
          ),

          Positioned.fill(
            child: Align(
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  "assets/images/${isLightMode ? "light" : "dark"}_cloud_2.png",
                  width: 400,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                "assets/images/${isLightMode ? "light" : "dark"}_cloud_3.png",
                width: 400,
              ),
            ),
          ),

          ?child,
        ],
      ),
    );
  }
}
