import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'arrow_>': Icons.arrow_forward_ios_rounded,
  'arrow_<': Icons.arrow_back_ios_new_rounded,
  'user_circle': Icons.account_circle,
  'saetting': Icons.settings,
  'computaer': Icons.computer_sharp,
  'desktop': Icons.desktop_windows_sharp
};

Icon getIcon(String nombreIcon) {
  return Icon(_icons[nombreIcon], color: Colors.blue);
}
