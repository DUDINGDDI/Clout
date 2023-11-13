import 'package:clout/utilities/category_translator.dart';
import 'package:clout/widgets/sns/sns2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// api
import 'dart:convert';
import 'dart:async';
import 'package:clout/type.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

// controllers
import 'package:clout/providers/user_controllers/user_controller.dart';

// widgets
import 'package:clout/widgets/list/campaign_item_box.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Clouter {
  int clouterId = 1;
  String nickname = '모카우유';
  int starRating = 20;
  int fee = 500000;
  String category = '반려동물';
  int contractCount = 5;
  List<String> selectedPlatform = [
    "YOUTUBE",
    "INSTAGRAM",
    "TIKTOK",
  ];
  String firstImg = 'assets/images/clouterImage.jpg';
}

String baseUrl = dotenv.env['CLOUT_APP_BASE_URL']!;

// Future<Campaign> fetchCampaign(String endPoint, String parameter) async {
//   final response =
//       await http.get(Uri.parse('${baseUrl}/v1/${endPoint}${parameter}'));

//   if (response.statusCode == 200) {
//     print('👻✨ response body: ${response.body}');
//     return Campaign.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('캠페인 불러오기 실패 💨');
//   }
// }

class InfiniteScrollController extends GetxController {
  getRequest(endPoint, parameter) async {
    var url = Uri.parse('${baseUrl}${endPoint}${parameter}');
    print('3️⃣');
    print('${url} 👉 infinite_scroll_controller.dart');
    print('${json.encode(parameter)} 👉 infinite_scroll_controller.dart');
    final response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    print('4️⃣');
    print('응답코드 입니다. ${response.statusCode}');
    print('reponseBody입니다 ${utf8.decode(response.bodyBytes)}');
    if (response.statusCode == 200) {
      print(
          '👻✨ response body: ${response.body} // 👉 infinite_scroll_controller.dart');
      return utf8.decode(response.bodyBytes);
    } else {
      return null;
    }
  }

  var scrollController = ScrollController().obs;

  var isClouterData = true; // 클라우터 정보인지 아닌지
  List<dynamic> data = [].obs;

  int pageSize = 20;
  var isLoading = false;
  var hasMore = true;
  var currentPage = 0;
  var endPoint = '';
  var parameter = '';

  setEndPoint(input) {
    endPoint = input;
    update();
  }

  setParameter(input) {
    parameter = input;
    update();
  }

  setCurrentPage(input) {
    final userController = Get.find<UserController>();
    currentPage = input;
    parameter =
        '?advertiserId=${userController.memberId}&page=${currentPage}&size=${10}';
    update();
  }

  // late Future<Campaign> futureCampaign;

  @override
  void onInit() {
    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels ==
              scrollController.value.position.maxScrollExtent &&
          hasMore) {
        setCurrentPage(currentPage + 1);
        _getData();
      }
    });

    super.onInit();
  }

  _getData() async {
    isLoading = true;
    hasMore = true;

    await Future.delayed(Duration(seconds: 2));

    int offset = data.length;

    var response = await getRequest(endPoint, parameter);
    print(response);
    var jsonData = jsonDecode(response);
    var contentList = jsonData['content'] as List;

    var appendData = [];

    List<String> allPlatforms = ["INSTAGRAM", "TIKTOK", "YOUTUBE"];

    if (contentList.isNotEmpty) {
      for (var item in contentList) {
        var campaignData = CampaignInfo.fromJson(item['campaign']);
        var advertiserData = AdvertiserInfo.fromJson(item['advertiserInfo']);

        var adPlatformWidgets;
        if (campaignData.adPlatformList?.contains("ALL") ?? false) {
          // "ALL"이 포함되어 있으면 모든 플랫폼을 나타내는 Widget 리스트 생성
          adPlatformWidgets =
              allPlatforms.map((platform) => Sns2(platform: platform)).toList();
        } else {
          // 그렇지 않으면, adPlatformList에 있는 플랫폼에 대한 Widget 리스트를 생성
          adPlatformWidgets = campaignData.adPlatformList
              ?.map((platform) => Sns2(platform: platform))
              .toList();
        }

        var campaignItemBox = Padding(
          padding: const EdgeInsets.all(10.0),
          child: CampaignItemBox(
            campaignId: campaignData.campaignId ?? 0,
            adCategory: AdCategoryTranslator.translateAdCategory(
                campaignData.adCategory!),
            title: campaignData.title ?? "제목없음",
            price: campaignData.price ?? 0,
            companyInfo: advertiserData.companyInfo!,
            numberOfSelectedMembers: campaignData.numberOfSelectedMembers ?? 0,
            numberOfRecruiter: campaignData.numberOfRecruiter ?? 0,
            adPlatformList: adPlatformWidgets,
            advertiserInfo: advertiserData,
            // firstImg: 'images/assets/itemImage.jpg', // 💥 이미지 수정하기
          ),
        );
        appendData.add(campaignItemBox);
      }
      // var appendData = isClouterData
      //     ? List<Clouter>.generate(10, (i) {
      //         var clouter = Clouter();
      //         clouter.clouterId = i + 1 + offset;
      //         return clouter;
      //       })
      //     : [campaignItemBox];
      data.addAll(appendData);

      isLoading = false;
      hasMore = contentList.isNotEmpty;
      update();
    } else {
      hasMore = false;
      isLoading = false;
      update();
    }
  }

  reload() async {
    isLoading = true;
    data.clear();

    await Future.delayed(Duration(seconds: 2));

    _getData();
    update();
  }

  toggleData(input) {
    isClouterData = input;
    data = [];
    _getData();
    update();
  }
}
