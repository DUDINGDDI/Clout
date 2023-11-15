import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/common/choicechip.dart';
import 'package:clout/widgets/refreshable_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/loading_indicator.dart';
import 'package:clout/screens/list/widgets/campaign_infinite_scroll_body.dart';

// controllers
import 'package:clout/providers/scroll_controllers/infinite_scroll_controller.dart';
import 'package:clout/providers/user_controllers/user_controller.dart';

class ClouterMyCampaign extends GetView<InfiniteScrollController> {
  ClouterMyCampaign({super.key});

  final infiniteController =
      Get.put(InfiniteScrollController(), tag: 'clouterMyCampaign');
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    infiniteController.setCurrentPage(0);
    infiniteController.setEndPoint(
        '/advertisement-service/v1/applies/clouters?clouterId=${userController.memberId}&page=${infiniteController.currentPage}&size=${10}');
    infiniteController.setParameter('&type=WAITING'); // 💥 typeEnum..? 추가하기
    final screenHeight = MediaQuery.of(context).size.height;
    infiniteController.reload();
    // infiniteController.getData();
    return GetBuilder<InfiniteScrollController>(
      tag: 'clouterMyCampaign',
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 4,
            headerTitle: '신청한 캠페인',
          ),
        ),
        body: RefreshablePage(
          controller: controller.scrollController.value,
          child: Column(
            children: [
              BouncingListview(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ActionChoiceExample(
                    labels: ['대기중', '채택된 캠페인', '미채택된 캠페인', '신청 취소'],
                    chipCount: 4,
                    onChipSelected: (label) {
                      String typeParam = '';
                      switch (label) {
                        case '대기중':
                          typeParam = '&type=WAITING';
                          break;
                        case '채택된 캠페인':
                          typeParam = '&type=ACCEPTED';
                          break;
                        case '미채택된 캠페인':
                          typeParam = '&type=NOT_ACCEPTED';
                          break;
                        case '신청 취소':
                          typeParam = '&type=CANCEL';
                          break;
                      }
                      infiniteController.setParameter(typeParam);
                      infiniteController.reload();
                    },
                  ),
                ),
              ),
              CampaignInfiniteScrollBody(controllerTag: 'clouterMyCampaign'),
              infiniteController.isLoading
                  ? Column(
                      children: [
                        SizedBox(height: screenHeight / 3),
                        SizedBox(
                            height: 70, child: Center(child: LoadingWidget())),
                        SizedBox(height: 20),
                        Text(
                          '신청한 캠페인을 불러오는 중입니다.\n잠시만 기다려 주세요.',
                          style: style.textTheme.headlineLarge
                              ?.copyWith(fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        )
                      ],
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
