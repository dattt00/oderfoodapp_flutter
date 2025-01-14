import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantImageWidget extends StatelessWidget {
  const RestaurantImageWidget({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          errorWidget: (context, url, err) => const Center(
            child: Icon(Icons.image),
          ),
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

class RestaurantInfoCard extends StatelessWidget {
  final String name;
  final String address;

  const RestaurantInfoCard({
    required this.name,
    required this.address,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(5.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w900),
            ),
            Text(
              address,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
