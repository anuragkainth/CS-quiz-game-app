import 'package:the_quiz_app/screens/name_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(
        children: [
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height * 1,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image
                    .asset(
                  'images/background.jpg',
                )
                    .image,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/icon.png',
                  width: 170,
                  height: 170,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 100,
                  height: 20,
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0.05),
                  child: Text(
                    'Shubhchintak Quiz',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w600
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NamePage(),
                          )
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            // blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      width: 270,
                      height: 70,
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0xff030F1B),
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Align(
                  alignment: AlignmentDirectional(0, 0.05),
                  child: Text(
                    'By Anurag Kainth',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600
                        )
                    ),
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}