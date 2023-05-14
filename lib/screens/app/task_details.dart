import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({Key? key}) : super(key: key);

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F4FA),
      appBar: AppBar(
        title: Text("مهتمي"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "تاسك رقم 4 الخاص بالتواصل مع معرض مزاج",
            style: GoogleFonts.cairo(fontSize: 20.sp, color: Color(0xFF032B77)),
          ),
          // Text(
          //   "تاسك رقم 4 الخاص بالتواصل مع معرض مزاج تاسك رقم 4 الخاص بالتواصل مع معرض مزاج تاسك رقم 4 الخاص بالتواصل مع معرض مزاج تاسك رقم 4 الخاص بالتواصل مع معرض مزاج تاسك رقم 4 الخاص بالتواصل مع معرض مزاج",
          //   style: GoogleFonts.cairo(fontSize: 20.sp, color: Color(0xFF032B77)),
          // ),
          ExpansionTile(
            title: Text('وصف المهمة'),
            trailing: Icon(Icons.expand_more),
            children: [
              Text(
                "تاسك رقم 4 الخاص بالتواصل مع معرض مزاج تاسك رقم 4 الخاص بالتواصل مع معرض مزاج تاسك رقم 4 الخاص بالتواصل مع معرض مزاج تاسك رقم 4 الخاص بالتواصل مع معرض مزاج تاسك رقم 4 الخاص بالتواصل مع معرض مزاج",
                style: GoogleFonts.cairo(fontSize: 20.sp, color: Color(0xFF032B77)),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
