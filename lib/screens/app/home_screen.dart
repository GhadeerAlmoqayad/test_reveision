import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_reveision/screens/app/task_details.dart';
import 'package:test_reveision/screens/auth/login_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: GoogleFonts.cairo(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //  Navigator.pushReplacementNamed(context, '/login_screen');
            },
            icon: Icon(Icons.notifications),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {
              _confirmLogoutDialog();
              //  Navigator.pushReplacementNamed(context, '/login_screen');
            },
            icon: Icon(Icons.logout),
            color: Colors.black,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFAFD3E2),

              ),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.transparent
                  ),
                    currentAccountPictureSize: Size.square(50),
                    currentAccountPicture: CircleAvatar(
//child: ,
                    ),
                    accountName: Text("Ghadir"),
                    accountEmail: Text("Ghadiiir"))),
            ListTile(
              leading: const Icon(Icons.person),
              title:Text(AppLocalizations.of(context)!.myAccount),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:  Icon(Icons.task),
              title:  Text(AppLocalizations.of(context)!.myTasks),
              onTap: () {

                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:  Icon(Icons.contact_phone),
              title:  Text(AppLocalizations.of(context)!.contactAdmin),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:  Icon(Icons.logout),
              title:  Text(AppLocalizations.of(context)!.logoutButton),
              onTap: () {
                _confirmLogoutDialog();

               // Navigator.pop(context);
              },
            ),

          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 15, // Replace with the actual number of tasks
        itemBuilder: (context, index) {
          // Replace with the logic to build each task card
          return GestureDetector(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => TaskDetails()),);},
            child: Card(
              elevation: 0,
              color: Colors.transparent,

              child: Container(

                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  gradient: LinearGradient(

                      colors: [


                    Color.fromRGBO(17, 112, 223, 1),//Color(0xFF1170DF)
                    Color.fromRGBO(17, 135, 226, 0.44),//    Color(0xFF1187E2)








                  ])
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(

                      children: [
                        Text("تاسك",style: GoogleFonts.cairo(
                          fontSize: 20 ,
                          fontWeight: FontWeight.bold ,

                        ),),
                        Spacer(),
                        Text("عاجل",style: GoogleFonts.cairo(
                          fontSize: 20 ,
                          fontWeight: FontWeight.bold ,

                        ),),


                      ],
                    ),
                      Row(

                        children: [
                          Text("ألأدمن",style: GoogleFonts.cairo(
                            fontSize: 20 ,
                            fontWeight: FontWeight.bold ,

                          ),),
                          Spacer(),
                          Text("تاريخ التسليم",style: GoogleFonts.cairo(
                            fontSize: 20 ,
                            fontWeight: FontWeight.bold ,

                          ),),


                        ],
                      ),


                      Text("الحالة",style: GoogleFonts.cairo(
                        fontSize: 20 ,
                        fontWeight: FontWeight.bold ,

                      ),),
                      Text("الوصف",style: GoogleFonts.cairo(
                        fontSize: 20 ,
                        fontWeight: FontWeight.bold ,

                      ),),


                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),







    );
  }

  void _confirmLogoutDialog() async {
    bool? result = await showDialog<bool>(
        // هذا السطر عشان لما اضغط على اي فراغ ما يسكر مربع الحوار
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Are you'),
            //titleTextStyle: ,
            content: Text('Are you sure?'),
            contentTextStyle: GoogleFonts.cairo(
              color: Colors.black,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text("Confirm")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text("No")),
            ],
          );
        });
    if (result ?? false) {
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
  }
}
