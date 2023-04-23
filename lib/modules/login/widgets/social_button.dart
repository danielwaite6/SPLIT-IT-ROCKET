import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButtonWidget extends StatelessWidget {
  const SocialButtonWidget({
    Key? key,
    required this.imagePath,
    required this.label,
    required this.onTap,
  }) : super(key: key);
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset(imagePath, height: 50),
          ),
          Text(
            label,
            style: GoogleFonts.inter(fontSize: 25),
          )
        ],
      ),
    );
  }
}
