import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';



class Util{

  static SnackBar showSnackBar(String text, String label, int duration) {
      return SnackBar(
        content: Text(text),
        action: SnackBarAction(label: label, onPressed: () {  },),
        duration: Duration(seconds: duration)
      );
  }

  static SnackBar showSnackBarWithContext(BuildContext context, String text, String label, int duration) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
          content: Text(text),
          action: SnackBarAction(label: label, onPressed: () {  },),
          duration: Duration(seconds: duration)
      ),
    );
  }

  static Stream<int> Mytimer(int seconds) async*{
    for(var i = seconds;i>-1;i--){
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  static showProgressDialog(BuildContext context) {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          });
  }

  // static DateFormat formatDate() {
  //   return DateFormat("dd-MM-yyyy");
  // }

  static void navigate(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }

  static void navigateWidget(BuildContext context, Widget widget){
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  static void potUntil(BuildContext context, String route) {
    Navigator.of(context).popUntil(ModalRoute.withName(route));
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Future<bool> checkNetworkConnectivity() async {
    bool isConnected = false;
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(Duration(seconds: 10));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        isConnected = true;
        return isConnected;
      }
    } on SocketException catch (e) {
      isConnected = false;
      print(e.message+' not connected');
      return isConnected;
    } on TimeoutException catch(_){
      print('Network timeout');
      isConnected = false;
      return isConnected;
    }
  }

  static double getScreenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static Future<void> preparePlacesList(List<DropdownMenuItem> list) async {
    placeList.forEach((element) {
      list.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
  }


  static List<String> placeList = [
    "Multan",
    "Chashma",
    "Faislabad",
    "Islamabad",
    "Lahore",
    //TODO: convert city names to Place object
    // Karachi
    // Lahore
    // Sialkot City
    // Faisalabad
    // Rawalpindi
    // Peshawar
    // Saidu Sharif
    // Multan
    // Gujranwala
    // Islamabad
    // Quetta
    // Bahawalpur
    // Sargodha
    // New Mirpur
    // Chiniot
    // Sukkur
    // Larkana
    // Shekhupura
    // Jhang City
    // Rahimyar Khan
    // Gujrat
    // Kasur
    // Mardan
    // Mingaora
    // Dera Ghazi Khan
    // Nawabshah
    // Sahiwal
    // Mirpur Khas
    // Okara
    // Mandi Burewala
    // Jacobabad
    // Saddiqabad
    // Kohat
    // Muridke
    // Muzaffargarh
    // Khanpur
    // Gojra
    // Mandi Bahauddin
    // Abbottabad
    // Dadu
    // Khuzdar
    // Pakpattan
    // Tando Allahyar
    // Vihari
    // Jaranwala
    // Kamalia
    // Kot Addu
    // Nowshera
    // Swabi
    // Dera Ismail Khan
    // Chaman
    // Charsadda
    // Kandhkot
    // Hasilpur
    // Muzaffarabad
    // Mianwali
    // Jalalpur Jattan
    // Bhakkar
    // Zhob
    // Kharian
    // Mian Channun
    // Jamshoro
    // Pattoki
    // Harunabad
    // Toba Tek Singh
    // Shakargarh
    // Hujra Shah Muqim
    // Kabirwala
    // Mansehra
    // Lala Musa
    // Nankana Sahib
    // Bannu
    // Timargara
    // Parachinar
    // Gwadar
    // Abdul Hakim
    // Hassan Abdal
    // Tank
    // Hangu
    // Risalpur Cantonment
    // Karak
    // Kundian
    // Umarkot
    // Chitral
    // Dainyor
    // Kulachi
    // Kotli
    // Gilgit
    // Hyderabad City
    // Narowal
    // Khairpur Mir’s
    // Khanewal
    // Jhelum
    // Haripur
    // Shikarpur
    // Rawala Kot
    // Hafizabad
    // Lodhran
    // Malakand
    // Attock City
    // Batgram
    // Matiari
    // Ghotki
    // Naushahro Firoz
    // Alpurai
    // Bagh
    // Daggar
    // Bahawalnagar
    // Leiah
    // Tando Muhammad Khan
    // Chakwal
    // Khushab
    // Badin
    // Lakki
    // Rajanpur
    // Dera Allahyar
    // Shahdad Kot
    // Pishin
    // Sanghar
    // Upper Dir
    // Thatta
    // Dera Murad Jamali
    // Kohlu
    // Mastung
    // Dasu
    // Athmuqam
    // Loralai
    // Barkhan
    // Musa Khel Bazar
    // Ziarat
    // Gandava
    // Sibi
    // Dera Bugti
    // Eidgah
    // Turbat
    // Uthal
    // Khuzdar
    // Chilas
    // Kalat
    // Panjgur
    // Gakuch
    // Qila Saifullah
    // Kharan
    // Aliabad
    // Awaran
    // Dalbandin
  ];

  // static showAlertDialog(BuildContext context, String heading, IconData icon, String message, Color iconBgColor) {
  //   return AlertDialog(
  //     title: Row(
  //       children: [
  //         FinishTick(width: 20,
  //           height: 20,
  //           iconSize: 10,
  //           bgColor: iconBgColor,
  //           iconColor: Colors.white,
  //           icon: icon,),
  //         SizedBox(width: 10,),
  //         Text(heading),
  //       ],
  //     ),
  //     content: Text(message),
  //     actions: [FlatButton(child: Text(
  //         Constants.ok.toUpperCase()), onPressed: () {
  //       Util.pop(context);
  //     },)
  //     ],
  //   );
  // }
}