import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CrewList extends StatelessWidget {
  const CrewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Column(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://t.ctcdn.com.br/jiaZ0n0DnPwzFGJJqmm2i5lJn1U=/400x400/smart/i490897.jpeg",
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "James Cameron",
                style: GoogleFonts.poppins(fontSize: 10, color: Colors.white),
              ),
              Text(
                "Director",
                style: GoogleFonts.poppins(fontSize: 10, color: const Color(0xFFaaaaaa)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
