import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout,
  });

  final WidgetBuilder mobileLayout,
      tabletLayout,
      desktopLayout; // layout builders for mobile, tablet, and desktop

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // check tablet break point and desktop break point
        if (constraints.maxWidth < 600) {
          return mobileLayout(context);
        } else if (constraints.maxWidth < 900 && constraints.maxWidth >= 600) {
          return tabletLayout(context);
        } else {
          // desktop
          return desktopLayout(context);
        }
      },
    );
  }
}
