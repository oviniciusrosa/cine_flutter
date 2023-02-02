import 'package:cine_flutter/common/widgets/heading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFF706A78),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "#Amazing",
                            style: GoogleFonts.poppins(fontSize: 10, color: Colors.white),
                          ),
                          Text(
                            "#Cool",
                            style: GoogleFonts.poppins(fontSize: 10, color: Colors.white),
                          ),
                          Text(
                            "#Exciting",
                            style: GoogleFonts.poppins(fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Flexible(
                        child: Text(
                          "Ut et et et ad irure reprehenderit ea est. Eu ad ullamco ut quis deserunt adipisicing ex ea dolor commodo elit velit deserunt. Culpa deserunt elit magna aliqua commodo voluptate minim ad. Ut et et et ad irure reprehenderit ea est. Eu ad ullamco ut quis deserunt adipisicing ex ea dolor commodo elit velit deserunt. Culpa deserunt elit magna aliqua commodo voluptate minim ad.",
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(height: 8),
                    Text("By Steve A.", style: GoogleFonts.poppins(fontSize: 10, color: Colors.white)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Ionicons.star, size: 14, color: Colors.amber),
                        SizedBox(width: 4),
                        Padding(
                          padding: EdgeInsets.only(top: 2.5),
                          child: Heading.small("9.8/10", fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
