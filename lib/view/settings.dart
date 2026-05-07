import 'package:flutter/material.dart';
import 'package:todolist/view/common_widget.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(18, 18, 18, 1),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(255, 255, 255, 0.87),
          ),
        ),
        title: Center(
          child: Text(
            'Settings',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.87),
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SectionLabel(label: 'Settings'),
          ProfileMenuItem(
            icon: Icons.format_paint,
            title: 'Change app color',
            ontap: () {},
          ),
          ProfileMenuItem(
            icon: Icons.type_specimen,
            title: 'Change app typography',
            ontap: () {},
          ),
          ProfileMenuItem(
            icon: Icons.translate,
            title: 'Change app language',
            ontap: () {},
          ),
          SectionLabel(label: 'Import'),
          ProfileMenuItem(
            icon: Icons.import_export_sharp,
            title: 'Import from Google calendar',
            ontap: () {},
          ),
        ],
      ),
    );
  }
}
