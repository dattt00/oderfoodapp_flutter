import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oderfoodapp_flutter/strings/restaurant_home_strings.dart';

class HomeMenuWidget extends StatelessWidget {
  const HomeMenuWidget({
    super.key,
    required this.zoomDrawerController,
  });

  final ZoomDrawerController zoomDrawerController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => zoomDrawerController.toggle!(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.home,
              color: Colors.white,
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              homeText,
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
    );
  }
}

