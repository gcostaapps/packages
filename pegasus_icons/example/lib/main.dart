import 'package:flutter/material.dart';

import 'icons_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pegasus Icons Example',
      home: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        appBar: AppBar(
          title: const Text('Pegasus Icons Example'),
        ),
        body: SingleChildScrollView(
          child: Wrap(
            children: [
              ...List.generate(
                iconDataList.length,
                (index) => IconCard(
                  iconData: iconDataList[index],
                  iconName: iconNameList[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  const IconCard({
    Key? key,
    required this.iconData,
    required this.iconName,
  }) : super(key: key);

  final IconData iconData;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            size: 50.0,
          ),
          const SizedBox(height: 24.0),
          Text(iconName)
        ],
      ),
    );
  }
}
