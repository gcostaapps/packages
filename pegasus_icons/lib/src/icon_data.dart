import 'package:flutter/widgets.dart';

@immutable
class PegasusIconsData extends IconData {
  const PegasusIconsData(int codePoint)
      : super(
          codePoint,
          fontFamily: 'PegasusIcons',
          fontPackage: 'pegasus_icons',
        );
}
