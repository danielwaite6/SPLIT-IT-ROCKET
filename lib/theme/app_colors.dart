import 'package:flutter/material.dart';

abstract class AppColors {
  Color get background;
  Color get title;
  Color get button;
}

class AppColorsDefault implements AppColors {
  @override
  Color get background => const Color(0xFF40B38C);

  @override
  Color get title => const Color(0xFF40B28C);

  @override
  Color get button => const Color(0xFF666666);
}
