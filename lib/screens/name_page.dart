import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_quiz_app/utilities/constants.dart';
import 'package:the_quiz_app/screens/quiz_page.dart';

class NamePage extends StatefulWidget {
  const NamePage({Key? key}) : super(key: key);

  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {

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
                              'What is your name?',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: kDefaultBlueColor,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w500
                                  )
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                            child: TextField(
                                decoration: InputDecoration(
                                  icon: Icon(Icons.face, color: kDefaultRedColor),
                                  hintText: 'Enter your Name',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                style: GoogleFonts.poppins(textStyle: TextStyle(color: kDefaultBlueColor)),
                                onChanged: (value){
                                  userName = value;
                                },
                              ),
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => QuizPage(userName: userName,),
                                        )
                                    );
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
                                        'Continue',
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
