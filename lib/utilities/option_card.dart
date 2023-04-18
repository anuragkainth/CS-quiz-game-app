import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_quiz_app/utilities/constants.dart';

class OptionCard extends StatefulWidget {
  final String text;
  final bool isCorrect;
  final Function(bool) onSelect;
  int tempSelection;

  OptionCard(
      {required this.text, required this.isCorrect, required this.onSelect, required this.tempSelection});

  @override
  _OptionCardState createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(widget.tempSelection == 0){
          bool isCorrect = widget.isCorrect;
          widget.onSelect(isCorrect);
          setState(() {
            _selected = true;
          });
        }
      },
      child: Card(
        color: _selected
            ? (widget.isCorrect ? Colors.green : Colors.red)
            : Colors.grey,
        child: Container(
          height: MediaQuery.sizeOf(context).height /12,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0, 1),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Center(child: Text(widget.text, style: GoogleFonts.poppins(textStyle: TextStyle(color: kDefaultBlueColor, fontSize: 13)),)),
        ),
      ),
    );
  }
}
