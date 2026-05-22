import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:todolist/viewmodel/bottom_nav_provider.dart';

class FocusPage extends StatefulWidget {
  const FocusPage({super.key});

  @override
  State<FocusPage> createState() => _FocusPageState();
}

class _FocusPageState extends State<FocusPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, bottom, child) {
        print('focus');
        return Scaffold(
          backgroundColor: Color.fromRGBO(18, 18, 18, 1),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // ----- Header -------------------------------------------------------->
                const Padding(
                  padding: EdgeInsets.only(top: 24, bottom: 16),
                  child: Center(
                    child: Text(
                      'Focus Mode',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.87),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                //-------------------------Circular Counter-------------------------------------->
                CircularCountDownTimer(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                  duration: 15,
                  fillColor: Color.fromRGBO(134, 135, 231, 1),
                  ringColor: Color.fromRGBO(85, 85, 85, 1),
                  strokeWidth: 15.0,
                  strokeCap: StrokeCap.round,
                  textStyle: TextStyle(
                    fontSize: 33.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //-----------------------------Text-------------------------------------->
                Text(
                  'While your focus mode is on, all of your notifications will be off',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color.fromRGBO(255, 255, 255, 0.87),
                  ),
                ),
                SizedBox(height: 25),
                //--------------------------------------Start Focusing----------------------------------->
                Container(
                  height: 48,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(134, 135, 231, 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      'Start Focusing',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                //----------------Overview Section----------------------------------------------->
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Overview',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.21),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'This Week',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.87),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Color.fromRGBO(255, 255, 255, 0.87),
                                size: 17,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                //-----------------------------------Graph------------------------------------------------------------->
                WeeklyOverviewGraph(),
                SizedBox(height: 10),

                //------------------------------Application section------------------------------------------------------>
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '  Applications',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(255, 255, 255, 0.87),
                      ),
                    ),
                    SizedBox(height: 10),
                    AppUsageTile(
                      image: SvgPicture.asset('assets/icons/instagram.svg'),
                      appName: 'Instagram',
                      usageText: 'You spent 4h on Instagram today',
                    ),
                    AppUsageTile(
                      image: SvgPicture.asset('assets/icons/twitter.svg'),
                      appName: 'Twitter',
                      usageText: 'You spent 3h on Twitter today',
                    ),
                    AppUsageTile(
                      image: SvgPicture.asset('assets/icons/Facebook.svg'),
                      appName: 'Facebook',
                      usageText: 'You spent 1h on Facebbok today',
                    ),
                    AppUsageTile(
                      image: SvgPicture.asset('assets/icons/telegram.svg'),
                      appName: 'Telegram',
                      usageText: 'You spent 30m on Telegram today',
                    ),
                    AppUsageTile(
                      image: SvgPicture.asset('assets/icons/gmail.svg'),
                      appName: 'Gmail',
                      usageText: 'You spent 45m on Gmail today',
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class WeeklyOverviewGraph extends StatelessWidget {
  const WeeklyOverviewGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BarData> data = [
      BarData(
        day: 'SUN',
        hours: 2.5,
        label: '2h30m',
        isHighlighted: false,
        isToday: false,
      ),
      BarData(
        day: 'MON',
        hours: 3.5,
        label: '3h30m',
        isHighlighted: false,
        isToday: false,
      ),
      BarData(
        day: 'TUE',
        hours: 5.0,
        label: '5H',
        isHighlighted: false,
        isToday: false,
      ),
      BarData(
        day: 'WED',
        hours: 3.0,
        label: '3h',
        isHighlighted: false,
        isToday: false,
      ),
      BarData(
        day: 'THU',
        hours: 4.0,
        label: '4h',
        isHighlighted: false,
        isToday: false,
      ),
      BarData(
        day: 'FRI',
        hours: 4.5,
        label: '4h30m',
        isHighlighted: true,
        isToday: false,
      ),
      BarData(
        day: 'SAT',
        hours: 2.0,
        label: '2h',
        isHighlighted: false,
        isToday: true,
      ),
    ];

    const double maxHours = 6.0;
    const double graphHeight = 180.0;
    const double barWidth = 28.0;

    // Y-axis labels
    final List<String> yLabels = ['6h', '5h', '4h', '3h', '2h', '1h'];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(18, 18, 18, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          // Graph area: Y-axis + Bars
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Y-Axis Labels
              SizedBox(
                height: graphHeight + 20, // +20 for a bit of top padding
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: yLabels
                      .map(
                        (label) => Text(
                          label,
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.87),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(width: 8),
              // Bars + Day labels
              Expanded(
                child: Column(
                  children: [
                    // Bar chart
                    SizedBox(
                      height: graphHeight,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: data.map((bar) {
                          final double barHeight =
                              (bar.hours / maxHours) * graphHeight;
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Value label above bar
                              Text(
                                bar.label,
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.87),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 4),
                              // Bar
                              Container(
                                width: barWidth,
                                height: barHeight,
                                decoration: BoxDecoration(
                                  color: bar.isHighlighted
                                      ? const Color.fromRGBO(134, 135, 231, 1)
                                      : const Color.fromRGBO(165, 165, 165, 1),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    topRight: Radius.circular(6),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Day labels row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: data.map((bar) {
                        return SizedBox(
                          width: barWidth,
                          child: Center(
                            child: Text(
                              bar.day,
                              style: TextStyle(
                                color: bar.isToday
                                    ? const Color.fromRGBO(255, 73, 73, 1)
                                    : const Color.fromRGBO(255, 255, 255, 0.87),
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BarData {
  final String day;
  final double hours;
  final String label;
  final bool isHighlighted;
  final bool isToday;

  const BarData({
    required this.day,
    required this.hours,
    required this.label,
    required this.isHighlighted,
    required this.isToday,
  });
}

//-------------------------------application section Tile:---------------------
class AppUsageTile extends StatelessWidget {
  final Widget image;
  final String appName;
  final String usageText;

  const AppUsageTile({
    super.key,
    required this.image,
    required this.appName,
    required this.usageText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(76, 76, 76, 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            // Left: Icon + Text
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                child: Row(
                  children: [
                    image,
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appName,
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          usageText,
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 225, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Divider
            Container(
              width: 2,
              height: 50,
              color: const Color.fromRGBO(151, 151, 151, 1),
            ),
            // Right: Warning icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.error_outline,
                color: Color.fromRGBO(255, 255, 255, 0.87),
                size: 21.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
