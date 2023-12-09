import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomText extends StatelessWidget {
  String hint;
  TextEditingController Controllerr;


   CustomText({required this.hint,required this.Controllerr,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(color: Color.fromRGBO(52, 118, 79, 0.8)),
         controller: Controllerr,
        decoration: InputDecoration(
            errorStyle: TextStyle(color: Colors.orange[900]),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(52, 118, 79, 0.8))),
            fillColor: Colors.amber.shade50,
            suffixIcon: Icon(Icons.subtitles_outlined,color: Color.fromRGBO(52, 118, 79, 0.8),),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                    color: Color.fromRGBO(52, 118, 79, 0.8)),
                borderRadius: BorderRadius.circular(25)),
            hintText: hint,
            hintStyle: GoogleFonts
                .acme(textStyle:
            TextStyle(
              fontSize: 20,
              color: Colors.orange.shade900))));

  }
}
