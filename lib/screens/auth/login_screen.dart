import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_reveision/utils/helpers.dart';

import '../../prefs/shared_pref_controller.dart';

import '../../provider/language_provider.dart';
import '../../widgets/app_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers{
  late TextEditingController _emailController ;
  late TextEditingController _passwordController ;
  bool obscure =true ;
 late String _language ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _language =SharedPrefController().language ;
    // _language =
    //     SharedPrefController().getValueFor(PrefKeys.language.name) ?? 'en';
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFCFF),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.loginAppBarTitle ,style: GoogleFonts.cairo(
          color: Color(0xFF032B77)
        ),),
        actions: [
          IconButton(onPressed: (){
            _showLanguageBottomSheet();
          }, icon: Icon(Icons.language),color: Color(0xFF032B77),),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.loginTitle,
              style: GoogleFonts.cairo(
                color: Color(0xFF1170DF),
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.loginSubtitle,
              style: GoogleFonts.cairo(
                color: Color(0xFF1170DF),
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
           AppTextField(hint: AppLocalizations.of(context)!.emailHint, prefixIcon: Icons.email, keyboardType: TextInputType.emailAddress, controller: _emailController),
            SizedBox(
              height: 10.h,
            ),
            AppTextField(hint: AppLocalizations.of(context)!.passwordHint, prefixIcon: Icons.lock, keyboardType: TextInputType.text, controller: _passwordController,obscureText: obscure,suffixIcon:IconButton(onPressed: (){
              setState(() {
                obscure =! obscure ;
              });
            }, icon:Icon(Icons.remove_red_eye) ) ,),
            SizedBox(
              height: 20.h,
            ),
            Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),

                gradient: LinearGradient(colors: [
                  Color(0xFF146C94), Color(0xFFAFD3E2)
                ]),
              ),
              child: ElevatedButton(
                  onPressed: () {
                    _performLogin();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                      elevation: 0,
                      minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    )
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.loginButton,
                    style: GoogleFonts.cairo(),
                  )),
            )
          ],
        ),
      ),
    );
  }
  void _performLogin() {
    if (_checkData()) {
      _login();
    }
  }

  bool _checkData() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Enter required Data', error: true);
    return false;
  }

  void _login() {
    Navigator.pushReplacementNamed(context, '/home_screen');
  }



  void _showLanguageBottomSheet() async {
    String? langCode = await showModalBottomSheet<String>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.language_title,
                        style: GoogleFonts.cairo(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.loginSubtitle,
                        style: GoogleFonts.cairo(
                          fontSize: 14.sp,
                          color: Colors.black45,
                          height: 1.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Divider(),
                      RadioListTile<String>(
                        title: Text('English', style: GoogleFonts.cairo()),
                        value: 'en',
                        groupValue: _language,
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() => _language = value);
                            Navigator.pop(context, 'en');
                          }
                        },
                      ),
                      RadioListTile<String>(
                        title: Text('العربية', style: GoogleFonts.cairo()),
                        value: 'ar',
                        groupValue: _language,
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() => _language = value);
                            Navigator.pop(context, 'ar');
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );

    if (langCode != null) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Provider.of<LanguageProvider>(context, listen: false).changeLanguage();
      });
    }
  }


}

