import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.hint ,
    required this.prefixIcon,
    required this.keyboardType,
    required this.controller ,
     this.focusedBorderdColor ,
    this.obscureText =false ,
    this.suffixIcon,

    super.key,
  });
final String hint ;
final IconData prefixIcon ;
final TextInputType keyboardType ;
final TextEditingController controller ;
final Color? focusedBorderdColor;
final Widget? suffixIcon ;
final bool obscureText ;


  @override
  Widget build(BuildContext context) {
    bool _isEnabled = true;

    return TextField(
      enabled: _isEnabled,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      style: GoogleFonts.cairo(
        color: Color(0xFF032B77)
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        hintMaxLines: 1,
        hintText: hint,
        filled: true,
        fillColor: Color(0xFFFFFFFF),



        hintStyle: GoogleFonts.cairo(
          color: Colors.grey
        ),
        prefixIcon: Icon(prefixIcon,
          color: _isEnabled ? Colors.grey : Colors.blue,
        ),

        suffixIcon: suffixIcon,
        enabledBorder: buildOutlineInputBorder(color: Colors.grey),
        focusedBorder: buildOutlineInputBorder(color: Color(0xFF032B77)),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({Color color =Colors.grey }) {
    return OutlineInputBorder(

        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: color),
      
      );
  }
}
