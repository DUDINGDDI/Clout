import 'package:clout/providers/address_controller.dart';
import 'package:clout/providers/date_input_controller.dart';
import 'package:clout/providers/fee_controller.dart';
import 'package:clout/providers/follower_controller.dart';
import 'package:clout/providers/four_digits_input_controller.dart';
import 'package:clout/providers/image_picker_controller.dart';
import 'package:clout/providers/platform_select_controller.dart';
import 'package:clout/providers/region_controller.dart';
import 'package:clout/providers/user_controllers/clouter_controller.dart';
import 'package:clout/type.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ClouterInfoController extends GetxController {
  var name;
  var age;
  var phoneNumber;
  var id;
  var password;
  var checkPassword;
  var nickName;
  var images;
  var negoable;
  List<bool> selections = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  var doubleId = 0;
  var obscured = true;
  // var negoable = true;

  var clouter;

  final clouterController = Get.find<ClouterController>();
  var fourDigitsInputController;
  var addressController;
  var platformSelectController;
  var followerController;
  var feeController;
  var regionController;
  var dateController;
  var imagePickerController;

  loadBeforeModify(input){
    name= input['name'];
    dateController.setSelectedDate = DateTime.parse(input['birthday']);
    phoneNumber = input['phoneNumber'];
    addressController.setDaumAddress = input['address']['mainAddress'];
    addressController.setDetailAddresss = input['address']['detailAddress'];
    nickName= input['nickName'];
    id = input['userId'];

    var channelList = input['channelList'];
    for(int i = 0; i<channelList.length; i++){
      if(channelList[i].platform == 'INSTAGRAM'){
        platformSelectController.platforms[0]= true;
        // platform
      }
    }
    
  }

  runOtherControllers() {
    fourDigitsInputController = Get.put(
      FourDigitsInputController(),
      tag: clouterController.controllerTag,
    );
    addressController = Get.put(
      AddressController(),
      tag: clouterController.controllerTag,
    );
    platformSelectController = Get.put(
      PlatformSelectController(),
      tag: clouterController.controllerTag,
    );
    followerController = Get.put(
      FollowerContoller(),
      tag: clouterController.controllerTag,
    );
    feeController = Get.put(
      FeeController(),
      tag: clouterController.controllerTag,
    );
    regionController = Get.put(
      RegionController(),
      tag: clouterController.controllerTag,
    );
    dateController = Get.put(
      DateInputController(),
      tag: clouterController.controllerTag,
    );
    imagePickerController = Get.put(
      ImagePickerController(),
      tag: clouterController.controllerTag,
    );
  }

  static List<String> categories = [
    'ALL',
    'FASHION_BEAUTY',
    'HEALTH_LIFESTYLE',
    'TRAVEL_LEISURE',
    'PARENTING',
    'ELECTRONICS',
    'FOOD',
    'VISIT_EXPERIENCE',
    'PETS',
    'GAMES',
    'ECONOMY_BUSINESS',
    'OTHERS'
  ];

  static List<String> regions = [
    'ALL',
    'SEOUL',
    'BUSAN',
    'DAEGU',
    'INCHEON',
    'GWANGJU',
    'DAEJEON',
    'ULSAN',
    'SEJONG',
    'GYEONGGI',
    'GANGWON',
    'CHUNGBUK',
    'CHUNGNAM',
    'JEONBUK',
    'JEONNAM',
    'GYEONGBUK',
    'GYEONGNAM',
    'JEJU',
  ];

  setClouter() {
    List<ChannelList> channelList = [];
    for (int i = 0; i < 3; i++) {
      if (platformSelectController!.platforms[i]) {
        ChannelList channel = ChannelList(
            platformSelectController!.id[i],
            i == 0
                ? 'INSTAGRAM'
                : id == 1
                    ? 'TIKTOK'
                    : 'YOUTUBE',
            platformSelectController!.link[i],
            int.parse(platformSelectController!.followerCount[i]));
        channelList.add(channel);
      }
    }

    List<String> categoryList = [];
    for (int i = 0; i < 12; i++) {
      if (selections[i]) {
        categoryList.add(categories[i]);
      }
    }

    List<String> regionList = [];
    for (int i = 0; i < regionController.selectedRegions.length; i++) {
      regionList
          .add(regionController.getEnum(regionController.selectedRegions[i]));
    }

    Address address = Address(
      addressController!.zipCode,
      addressController!.daumAddress,
      addressController!.detailAddress,
    );

    clouter = Clouter(
        id,
        password,
        nickName,
        name,
        DateFormat('yyyy-MM-dd').format(dateController!.selectedDate),
        dateController.age,
        phoneNumber,
        channelList,
        int.parse(feeController!.pay),
        categoryList,
        regionList,
        address);
    update();
  }

  setName(input) {
    name = input;
    update();
  }

  setPhoneNumber(input) {
    phoneNumber = input;
    update();
  }

  setId(input) {
    id = input;
  }

  setPassword(input) {
    password = input;
  }

  setCheckPassword(input) {
    checkPassword = input;
  }

  setNickName(input) {
    nickName = input;
  }

  setSelection(index) {
    if (index == 0) {
      selections = List.generate(12, (index) => false);
      selections[index] = !selections[index];
    } else {
      selections[0] = false;
      selections[index] = !selections[index];
    }
    update();
  }

  setDoubleId(input) {
    //defulat 0
    //가능하면 1
    //중복이면 2
    //지금은 편의상 중복 아니라고 함
    doubleId = input;
    update();
  }

  setObscured() {
    obscured = !obscured;
    update();
  }

  canGoSecondPage() {
    if (name == null || name.length == 0) {
      return '이름을 입력해주세요';
    }
    if (DateFormat('yyyy.MM.dd').format(dateController!.selectedDate) ==
        DateFormat('yyyy.MM.dd').format(DateTime.now())) {
      return '생년월일을 입력해주세요 🎂';
    }
    if (phoneNumber == null || phoneNumber.length == 0) {
      return '휴대전화 번호를 입력해주세요 📱';
    }
    if (!fourDigitsInputController.phoneVerified) {
      return '휴대전화 번호 인증을 진행해주세요';
    }
    if (addressController.zipCode == null ||
        addressController.zipCode.length == 0) {
      return '주소를 입력해주세요 🏢';
    }
    if (addressController.detailAddress == null ||
        addressController.detailAddress.length == 0) {
      return '상세주소를 입력해주세요 🏠';
    }
    return '';
  }

  canGoThirdPage() {
    if (nickName == null || nickName.length == 0) {
      return '닉네임을 입력해주세요';
    }
    if (id == null || id.length == 0) {
      return '아이디를 입력해주세요 📃';
    }
    if (id.length < 5 || id.length > 15) {
      return '아이디는 5자 ~ 15자로 입력해주세요';
    }
    if (doubleId == 0) {
      return '아이디 중복을 확인해주세요';
    }
    if (doubleId == 2) {
      return '중복된 아이디입니다 😥';
    }
    if (password == null || password.length == 0) {
      return '비밀번호를 입력해주세요';
    }
    if (password.length < 8 || password.length > 20) {
      return '비밀번호는 8자 ~ 20자로 입력해주세요';
    }
    if (checkPassword == null || checkPassword.length == 0) {
      return '비밀번호 확인을 입력해주세요';
    }
    if (checkPassword != password) {
      return '비밀번호 확인이 일치하지 않습니다';
    }
    return '';
  }

  canGoFourthPage() {
    if ((platformSelectController.id[0].length == 0 &&
            platformSelectController.link[0].length == 0 &&
            platformSelectController.followerCount[0].length == 0) &&
        (platformSelectController.id[1].length == 0 &&
            platformSelectController.link[1].length == 0 &&
            platformSelectController.followerCount[1].length == 0) &&
        (platformSelectController.id[2].length == 0 &&
            platformSelectController.link[2].length == 0 &&
            platformSelectController.followerCount[2].length == 0)) {
      return '최소 한개 이상의 SNS 정보를 입력해주세요';
    }
    if (platformSelectController.id[0].length != 0 ||
        platformSelectController.link[0].length != 0 ||
        platformSelectController.followerCount[0] != '0') {
      if (platformSelectController.id[0].length == 0 ||
          platformSelectController.link[0].length == 0 ||
          platformSelectController.followerCount[0] == '0') {
        return 'Instagram 계정의 정보를 완성해주세요';
      }
    }
    if (platformSelectController.id[1].length != 0 ||
        platformSelectController.link[1].length != 0 ||
        platformSelectController.followerCount[1] != '0') {
      if (platformSelectController.id[1].length == 0 ||
          platformSelectController.link[1].length == 0 ||
          platformSelectController.followerCount[1] == '0') {
        return 'Tiktok 계정의 정보를 완성해주세요';
      }
    }
    if (platformSelectController.id[2].length != 0 ||
        platformSelectController.link[2].length != 0 ||
        platformSelectController.followerCount[2] != '0') {
      if (platformSelectController.id[2].length == 0 ||
          platformSelectController.link[2].length == 0 ||
          platformSelectController.followerCount[2] == '0') {
        return 'Youtube 계정의 정보를 완성해주세요';
      }
    }
    return '';
  }
}
