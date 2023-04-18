import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_quiz_app/utilities/constants.dart';
import 'package:the_quiz_app/screens/quiz_page.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key? key, required this.userName, required this.userScore}) : super(key: key);

  String? userName;
  int? userScore;
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  String? userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'images/background.jpg',
            ).image,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kBackgroundCardColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 54, 24, 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'images/icon.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                ' Shubhchintak Quiz',
                                style: GoogleFonts.poppins(
                                    color: kDefaultBlueColor,
                                    textStyle: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w500
                                    )
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Text(
                              'Hey, ${widget.userName}',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: kDefaultBlueColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500
                                  )
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Text(
                              'Here is your Result: ',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: kDefaultBlueColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500
                                  )
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                            child: Row(
                              children: [
                                Text(
                                  'Your score is:',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: kDefaultBlueColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500
                                      )
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  '${widget.userScore} / 100',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: kDefaultBlueColor,
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).popUntil((route) => route.isFirst);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                    color: kDefaultBlueColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  width: 270,
                                  height: 70,
                                  child: Center(
                                    child: Text(
                                      'Play Again',
                                      style: GoogleFonts.poppins(
                                          color: kBackgroundCardColor,
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
