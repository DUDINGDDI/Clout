import 'package:clout/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/list/widgets/campaign_infinite_scroll_body.dart';

// controllers
import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:clout/providers/scroll_controllers/infinite_scroll_controller.dart';

class AdvertiserMycampaign extends GetView<InfiniteScrollController> {
  AdvertiserMycampaign({super.key});

  final infiniteController =
      Get.put(InfiniteScrollController(), tag: 'advertiserMyCampaign');

  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    infiniteController.setCurrentPage(0);
    infiniteController
        .setEndPoint('/advertisement-service/v1/advertisements/advertisements');
    infiniteController.setParameter(
        '?advertiserId=${userController.memberId}&page=${infiniteController.currentPage}&size=${10}');
    infiniteController.getData();
    print('왜 아무것도 안되지?');
    return GetBuilder<InfiniteScrollController>(
      tag: 'advertiserMyCampaign',
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 4,
            headerTitle: '내 캠페인 목록',
          ),
        ),
        body: SingleChildScrollView(
          controller: controller.scrollController.value,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CampaignInfiniteScrollBody(controllerTag: 'advertiserMyCampaign'),
              infiniteController.hasMore
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 40),
                      child: SizedBox(
                        height: 50,
                        child: LoadingWidget(),
                      ),
                    )
                  : Container(
                      height: 700,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
