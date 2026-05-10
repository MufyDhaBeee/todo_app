import 'package:flutter/material.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  bool isTodaySelected = true;
  int selectedNav = 1;
  bool showCompleted = false;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      body: Column(
        children: [
          // ----- Header -------------------------------------------------------->
          const Padding(
            padding: EdgeInsets.only(top: 24, bottom: 16),
            child: Center(
              child: Text(
                'Calendar',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.87),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          //-------------------calender--------------------------------------------->
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(color: Color.fromRGBO(54, 54, 54, 1)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.chevron_left),
                      iconSize: 16,
                      color: Color.fromRGBO(255, 255, 255, 0.87),
                    ),
                    Column(
                      children: const [
                        Text(
                          'FEBRUARY',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.87),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '2022',
                          style: TextStyle(
                            color: Color.fromRGBO(175, 175, 175, 1),
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.chevron_right,
                        color: Color.fromRGBO(255, 255, 255, 0.87),
                        size: 16,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                //-------------------Week Selector------------------------------------------------->
                HorizontalWeekCalendar(
                  minDate: DateTime.now().subtract(const Duration(days: 365)),
                  maxDate: DateTime.now().add(const Duration(days: 365)),
                  initialDate: DateTime.now(),
                  // ── Week layout ──
                  weekStartFrom: WeekStartFrom.Sunday, // matches screenshot
                  // ── Active (selected) day → purple pill ──
                  activeBackgroundColor: Color.fromRGBO(134, 135, 231, 1),
                  activeTextColor: Colors.white,

                  // ── Inactive (un-selected) days ──
                  inactiveBackgroundColor: Colors.transparent,
                  inactiveTextColor: Color(0xFF9090A8),

                  // ── Disabled (out-of-range) days ──
                  disabledBackgroundColor: Colors.transparent,
                  disabledTextColor: Color(0xFF2E2E45),

                  // ── Navigation arrow colors ──
                  activeNavigatorColor: Color(0xFF9090A8),
                  inactiveNavigatorColor: Color(0xFF2E2E45),

                  // ── Pill corner radius ──
                  borderRadius: BorderRadius.circular(12),

                  // ── Scroll feel ──
                  scrollPhysics: const BouncingScrollPhysics(),
                  // ── Callbacks ──
                  onDateChange: (date) {
                    setState(() => selectedDate = date);
                  },
                  onWeekChange: (List<DateTime> weekDates) {
                    // fired when swiping to a new week
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          /// TODAY / COMPLETED BUTTONS
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Color.fromRGBO(76, 76, 76, 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        width: 139,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(134, 135, 231, 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Today",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          //  color:  Color.fromRGBO(134, 135, 231, 1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            width: 2,
                            color: Color.fromRGBO(151, 151, 151, 1),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Completed",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //--------------------------------Task Card------------------------------------>
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Color.fromRGBO(54, 54, 54, 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(microseconds: 200),
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(54, 54, 54, 1),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color.fromRGBO(255, 255, 255, 0.87),
                        width: 2,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                  SizedBox(width: 14),

                  // ---------------- Title + time ------------------------------------------------------>
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Do Math Homework',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.87),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Today At 16:45',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color.fromRGBO(175, 175, 175, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8,),
                  //----------------CategoryChip--------------------------------------------------->
                  CategoryChip(
                    label: 'University',
                    icon: Icons.school,
                    color: Color.fromRGBO(255, 255, 255, 1),),
                  SizedBox(width: 8,),
                  //--------------priority Badge----------------------------------------------------->
                  PriorityBadge(
                    priority: 1,),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Category Chip ────────────────────────────────────────────────────────────

class CategoryChip extends StatelessWidget {
  late final String label;
  late final IconData icon;
  late final Color color;

   CategoryChip({
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Color.fromRGBO(128, 156, 255, 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 13),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
// ─── Priority Badge ───────────────────────────────────────────────────────────

class PriorityBadge extends StatelessWidget {
  final int priority;

  const PriorityBadge({required this.priority});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
      
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: 1,
            color:Color.fromRGBO(134, 135, 231, 1)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.flag_outlined, color: Color.fromRGBO(255, 255, 255, 1), size: 13),
          const SizedBox(width: 3),
          Text(
            '$priority',
            style: const TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
