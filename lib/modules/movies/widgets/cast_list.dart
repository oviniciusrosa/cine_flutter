import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CastList extends StatelessWidget {
  const CastList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Column(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Cassie Evans",
                style: GoogleFonts.poppins(fontSize: 10, color: Colors.white),
              ),
              Text(
                "as Neitiri",
                style: GoogleFonts.poppins(fontSize: 10, color: const Color(0xFFaaaaaa)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
