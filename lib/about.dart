import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_tv/core/resources/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
   About({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
      return Scaffold(
        appBar: AppBar(
          title: Text("about",style: GoogleFonts.getFont('Cairo'),),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),

        ),
        body: _body(size),);
  }

  _body(Size size){
    return  SingleChildScrollView(
      child: Container(
        height: size.height,
        width: size.width,
        child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
                elevation: 30,
                shape: RoundedRectangleBorder(
                  //     side: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset('assets/logo.png',height: 200,),
                )),
            SizedBox(height: size.height*0.1,),
            Text(AppStrings.appTitle,style: GoogleFonts.getFont('Cairo',fontSize: 16,fontWeight: FontWeight.w900)),
            Text("Movies and TV",style: GoogleFonts.getFont('Cairo',fontSize: 14,fontWeight: FontWeight.w700)),
            SizedBox(height: size.height*0.02,),

            SizedBox(height: size.height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.mobile_friendly_rounded,),
                Text( 'version' + '  '+ '1.0' ,style: GoogleFonts.getFont('Cairo',fontSize: 16)),
              ],
            ),
            // Text("Phone number".tr+' : 01000679584',style: GoogleFonts.getFont('Cairo',fontSize: 16.sp),),
            // SizedBox(height: size.height*0.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FilledButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      elevation: 5,
                      padding: const EdgeInsets.all(12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: ()=>launch('tel:+201000679584'), child: Icon(Icons.call,)),
                FilledButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 5,
                      padding: const EdgeInsets.all(12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () async => await launch("https://wa.me/+201000679584?text=Hello"),
                    child: Icon(FontAwesomeIcons.whatsapp,color: Colors.greenAccent,),),

              ],
            )

          ],
        ),
      ),
    );
  }

}
