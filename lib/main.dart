import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(Home());
}
class Home extends StatefulWidget {

  @override
  Home_State createState() => Home_State();
}

class Home_State extends State<Home> {



  @override
  Widget build(BuildContext context) {
    BannerAd bannerAd= new BannerAd(
        size: AdSize.banner, adUnitId: "ca-app-pub-3940256099942544/6300978111",
        listener: BannerAdListener(
          onAdClosed: (Ad ad){
            print("ads loaded");
          }
        ),request: AdRequest());
   // bannerAd..load();
    return MaterialApp(
        title: "implementadmob",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Implement Admob"),
          ),
          body: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100.0),
                  ),
                  Text("Click Button To get Reward", style:
                  TextStyle(color: Colors.blue, fontSize: 20.0),),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                  ),
                  FlatButton(
                    child: Text("Click", style:
                    TextStyle(color: Colors.white, fontSize: 20.0),),
                    color: Colors.blue,

                    onPressed: (){
                      print("clickeds");
                    },
                  ),
                  AdWidget(ad: bannerAd..load()
                  ,key: UniqueKey(),),
                ],
              )
          ),

        )
    );
  }
}

