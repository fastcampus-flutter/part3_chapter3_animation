import 'package:flutter/material.dart';

import '../../../../common/common.dart';
import '../../../notification/s_notification.dart';

class TtossAppBar extends StatefulWidget {
  static const double appBarHeight = 60;

  const TtossAppBar({super.key});

  @override
  State<TtossAppBar> createState() => _TtossAppBarState();
}

class _TtossAppBarState extends State<TtossAppBar> {
  bool _showRedDot = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TtossAppBar.appBarHeight,
      color: context.appColors.appBarBackground,
      child: Row(
        children: [
          width10,
          Image.asset(
            "$basePath/icon/toss.png",
            height: 30,
          ),
          emptyExpanded,
          Image.asset(
            "$basePath/icon/map_point.png",
            height: 30,
          ),
          width10,
          Tap(
            onTap: () {
              //알림 화면
              Nav.push(const NotificationScreen());
            },
            child: Stack(
              children: [
                Image.asset(
                  "$basePath/icon/notification.png",
                  height: 30,
                ),
                if (_showRedDot)
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                    ),
                  ))
              ],
            ).animate().shake(duration: 2000.ms, hz: 3).then().fadeOut(duration: 1000.ms),
          ),
          width10,
        ],
      ),
    );
  }
}
