import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 555,
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    child: Image.asset(
                      "assets/images/splash.jpeg",
                      fit: BoxFit.cover,
                    ))),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "Find The\nBest Collections",
                textAlign: TextAlign.start,
                style: GoogleFonts.imprima(
                  fontSize: 42,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(12, 12, 13, 1),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "Get your dream item easily with FashionHub and get other intersting offer",
                textAlign: TextAlign.start,
                style: GoogleFonts.imprima(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(121, 119, 128, 1),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 62,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(90)),
                    child: Center(
                      child: Text("Sign Up",style: GoogleFonts.imprima(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 150,
                    height: 62,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 122, 0, 1),
                        borderRadius: BorderRadius.circular(90)),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.imprima(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
