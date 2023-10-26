// global
import 'package:clout/screens/campaign_register/widgets/age_slider.dart';
import 'package:clout/screens/campaign_register/widgets/category_dropdown.dart';
import 'package:clout/screens/campaign_register/widgets/itemdetail_textinput.dart';
import 'package:clout/screens/campaign_register/widgets/minimumfollowers_dialog.dart';
import 'package:clout/screens/campaign_register/widgets/offeringitem_textinput.dart';
import 'package:clout/screens/campaign_register/widgets/product_textinput.dart';
import 'package:clout/screens/campaign_register/widgets/recruit_input.dart';
import 'package:clout/screens/campaign_register/widgets/region_dropdown.dart';
import 'package:clout/screens/join/widgets/big_button.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/sns/sns3.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

// Screens
import 'package:clout/screens/campaign_register/widgets/data_title.dart';

// Widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/input/input_elements/input_element.dart';

class CampaignRegister extends StatefulWidget {
  CampaignRegister({super.key});

  @override
  State<CampaignRegister> createState() => _CampaignRegisterState();
}

class _CampaignRegisterState extends State<CampaignRegister> {
  var category,
      productName,
      startDate,
      endDate,
      recruitCount = 1,
      pay,
      offeringItems,
      itemDetail,
      minAge = 0,
      maxAge = 100,
      minimumFollowers,
      minimumFollowersString = '0',
      region;

  SfRangeValues ageRanges = SfRangeValues(0, 100);

  setCategory(input) {
    setState(() {
      category = input;
    });
  }

  setProductName(input) {
    setState(() {
      productName = input;
    });
  }

  setStartDate(input) {
    setState(() {
      startDate = input;
    });
  }

  setEndDate(input) {
    setState(() {
      endDate = input;
    });
  }

  setRecruitCount(input) {
    setState(() {
      recruitCount = input;
    });
  }

  setPay(input) {
    setState(() {
      pay = input;
    });
  }

  setOfferingItems(input) {
    setState(() {
      offeringItems = input;
    });
  }

  setItemDetail(input) {
    setState(() {
      itemDetail = input;
    });
  }

  setAge(input) {
    setState(() {
      ageRanges = input;
      minAge = input.start.toInt();
      maxAge = input.end.toInt();
    });
  }

  setMinimumFollowers(input) {
    setState(() {
      minimumFollowers = input;
    });
  }

  setMinimumFollowersString(input) {
    setState(() {
      minimumFollowersString = input;
    });
  }

  setRegion(input) {
    setState(() {
      region = input;
    });
  }

  register(destination) {
    if (category != null &&
        productName != null &&
        startDate != null &&
        endDate != null &&
        pay != null &&
        offeringItems != null &&
        itemDetail != null &&
        // age != null &&
        minimumFollowers != null &&
        region != null) {
      //등록하는 api 요청 들어가야 함
    } else {
      Get.offNamed(destination);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Header(header: 4, headerTitle: '캠페인 작성')),
        body: Container(
            color: Colors.white,
            width: double.infinity,
            child: BouncingListview(
                child: FractionallySizedBox(
              widthFactor: 0.9,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DataTitle(text: '카테고리'),
                    CategoryDropdown(
                        category: category, setCategory: setCategory),
                    SizedBox(height: 10),
                    DataTitle(text: '제품명'),
                    ProductTextinput(setProductName: setProductName),
                    SizedBox(height: 10),
                    DataTitle(text: '모집 인원(최대 100명)'),
                    RecruitInput(
                        recruitCount: recruitCount,
                        setRecruitCount: setRecruitCount),
                    SizedBox(height: 10),
                    DataTitle(text: '게시 기간'),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        DataTitle(text: '제공 내역'),
                      ],
                    ),
                    OfferingitemTextinput(setOfferingItems: setOfferingItems),
                    SizedBox(height: 10),
                    DataTitle(text: '제품 배송 여부'),
                    ItemdetailTextinput(setItemDetail: setItemDetail),
                    SizedBox(height: 10),
                    DataTitle(text: '제품 사진 첨부'),
                    DataTitle(text: '광고 희망 플랫폼'),
                    Sns3(),
                    DataTitle(text: '희망 클라우터 나이'),
                    AgeSlider(ageRanges: ageRanges, setAge: setAge),
                    SizedBox(height: 10),
                    DataTitle(text: '희망 최소 팔로워 수'),
                    MinimumfollowersDialog(
                        minimumFollowers: minimumFollowers,
                        minimumFollowersString: minimumFollowersString,
                        setMinimumFollowers: setMinimumFollowers,
                        setMinimumFollowersString: setMinimumFollowersString),
                    DataTitle(text: '지역 선택'),
                    RegionDropdown(region: region, setRegion: setRegion),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: BigButton(
                        title: '캠페인 등록',
                        function: register,
                        destination: '/home',
                      ),
                    )
                  ]),
            ))));
  }
}
