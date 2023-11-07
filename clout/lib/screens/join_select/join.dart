//widgets
//pages
import 'package:clout/screens/register_or_modify/advertiser/advertiser_join.dart';
import 'package:clout/screens/register_or_modify/clouter/clouter_join.dart';
import 'package:clout/widgets/buttons/big_button.dart';

//global
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

class Join extends StatelessWidget {
  const Join({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: style.colors['white'], 
              child: Center(
                child: Column( 
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 35),
                      child: Image.asset(
                        'assets/images/clouter.png',
                        width: 230,
                      ),
                    ),
                    
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: BigButton(
                        title: '인플루언서로 시작하기',
                        function: () {
                          Get.to(()=>ClouterJoin()); // AdvertiserJoin 클래스의 인스턴스를 전달
                        },
                      ),
                    ),
                  ],
                ),
            ),
          ),
        ),
          Expanded(
            flex: 1,
            child: Container(
              color: style.colors['main2'], 
              child: Center(
                child: Column( 
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 35),
                      child: Image.asset(
                        'assets/images/advertiser.png',
                        width: 230,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: BigButton(
                        title: '광고주로 시작하기',
                        textColor: style.colors['main1'],
                        buttonColor: style.colors['white'],
                        function: () {
                          Get.to(()=>AdvertiserJoin()); 
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}