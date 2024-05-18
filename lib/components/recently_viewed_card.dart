import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class RecentlyViewedCard extends StatelessWidget {
  const RecentlyViewedCard({
    required this.plantName,
    required this.plantInfo,
    required this.image,
    super.key,
  });

  final String plantName;
  final String plantInfo;
  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 60.0,
          height: 60.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        const SizedBox(width: 24.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              plantName,
              style: GoogleFonts.poppins(
                color: kDarkGreenColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              plantInfo,
              style: GoogleFonts.poppins(
                color: kGreyColor,
              ),
            )
          ],
        ),
      ],
    );
  }
}
