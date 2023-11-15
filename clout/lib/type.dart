import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

class Autogenerated {
  List<ClouterInfo>? clouterInfo;
  List<Top10CampaignList>? top10CampaignList;

  Autogenerated({this.clouterInfo, this.top10CampaignList});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    if (json['clouters'] != null) {
      clouterInfo = <ClouterInfo>[];
      json['clouters'].forEach((v) {
        clouterInfo!.add(ClouterInfo.fromJson(v));
      });
    }

    if (json['top10CampaignList'] != null) {
      top10CampaignList = <Top10CampaignList>[];
      json['top10CampaignList'].forEach((v) {
        top10CampaignList!.add(Top10CampaignList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.clouterInfo != null) {
      data['clouters'] = this.clouterInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Address {
//   String? zipCode;
//   String? mainAddress;
//   String? detailAddress;

//   Address(this.zipCode, this.mainAddress, this.detailAddress);

//   Map<String, dynamic> toJson() => {
//         'zipCode': zipCode,
//         'mainAddress': mainAddress,
//         'detailAddress': detailAddress,
//       };

//   factory Address.fromJson(Map<String, dynamic> json) {
//     return Address(
//       json['zipCode'],
//       json['mainAddress'],
//       json['detailAddress'],
//     );
//   }
// }

class LoginResponse {
  String? memberRole;
  int? memberId;

  LoginResponse(this.memberRole, this.memberId);
  Map<String, dynamic> toJson() => {
        'memberRole': memberRole,
        'memberId': memberId,
      };

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      json['memberRole'],
      json['memberId'],
    );
  }
}

class Address {
  String? zipCode;
  String? mainAddress;
  String? detailAddress;

  Address(this.zipCode, this.mainAddress, this.detailAddress);

  Address.fromJson(Map<String, dynamic> json) {
    zipCode = json['zipCode'];
    mainAddress = json['mainAddress'];
    detailAddress = json['detailAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['zipCode'] = zipCode;
    data['mainAddress'] = mainAddress;
    data['detailAddress'] = detailAddress;
    return data;
  }
}

class CompanyInfo {
  String? companyName;
  String? regNum;
  String? ceoName;
  String? managerName;
  String? managerPhoneNumber;

  CompanyInfo(this.companyName, this.regNum, this.ceoName, this.managerName,
      this.managerPhoneNumber);

  Map<String, dynamic> toJson() => {
        'companyName': companyName,
        'regNum': regNum,
        'ceoName': ceoName,
        'managerName': managerName,
        'managerPhoneNumber': managerPhoneNumber,
      };

  factory CompanyInfo.fromJson(Map<String, dynamic> json) {
    return CompanyInfo(
      json['companyName'],
      json['regNum'],
      json['ceoName'],
      json['managerName'],
      json['managerPhoneNumber'],
    );
  }

  String toString() {
    return "${companyName}, ${regNum}, ${ceoName}, ${managerName}, ${managerPhoneNumber} ";
  }
}

class Advertiser {
  String? userId;
  String? pwd;
  Address? address;
  CompanyInfo? companyInfo;
  int? advertiserAvgstar;

  Advertiser(
    this.userId,
    this.pwd,
    this.address,
    this.companyInfo,
    this.advertiserAvgstar,
  );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'pwd': pwd,
        'address': address,
        'companyInfo': companyInfo,
        'advertiserAvgstar': advertiserAvgstar,
      };

  factory Advertiser.fromJson(Map<String, dynamic> json) {
    return Advertiser(
      json['userId'],
      json['pwd'],
      Address.fromJson(json['addressInfo']),
      // Address.fromJson(json['address']),
      CompanyInfo.fromJson(json['companyInfo']),
      json['advertiserAvgstar'],
    );
  }
}

// 아이디 중복 체크
class CheckDuplicated {
  bool checkValue;

  CheckDuplicated({required this.checkValue});

  factory CheckDuplicated.fromJson(Map<String, dynamic> json) {
    return CheckDuplicated(checkValue: json['checkValue']);
  }
}

class ChannelList {
  String name;
  String platform;
  String link;
  int followerScale;

  ChannelList(this.name, this.platform, this.link, this.followerScale);

  Map<String, dynamic> toJson() => {
        'name': name,
        'platform': platform,
        'link': link,
        'followerScale': followerScale,
      };

  factory ChannelList.fromJson(Map<String, dynamic> json) {
    return ChannelList(
        json['name'], json['platform'], json['link'], json['followerScale']);
  }
}

// class ChannelList {
//   String? name;
//   String? platform;
//   String? link;
//   int? followerScale;

//   ChannelList(this.name, this.platform, this.link, this.followerScale);

//   ChannelList.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     platform = json['platform'];
//     link = json['link'];
//     followerScale = json['followerScale'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = name;
//     data['platform'] = platform;
//     data['link'] = link;
//     data['followerScale'] = followerScale;
//     return data;
//   }
// }

class PointItem {
  final int transactionId;
  final int pointId;
  final int memberId;
  final int amount;
  final String pointStatus;
  final String category;
  final String counterparty;
  final String time;

  PointItem({
    required this.transactionId,
    required this.pointId,
    required this.memberId,
    required this.amount,
    required this.pointStatus,
    required this.category,
    required this.counterparty,
    required this.time,
  });

  // JSON을 Dart 객체로 변환하는 팩토리 메서드
  factory PointItem.fromJson(Map<String, dynamic> json) {
    return PointItem(
      transactionId: json['transactionId'],
      pointId: json['pointId'],
      memberId: json['memberId'],
      amount: json['amount'],
      pointStatus: json['pointStatus'],
      category: json['category'],
      counterparty: json['counterparty'],
      time: json['time'],
    );
  }
}

class Clouter {
  String? userId;
  String? pwd;
  String? nickName;
  String? name;
  String? birthday;
  int? age;
  String? phoneNumber;
  List<dynamic>? channelList;
  int? minCost;
  List<dynamic>? categoryList;
  List<dynamic>? regionList;
  Address? address;
  List<dynamic>? imageResponses;

  Clouter({
    this.userId,
    this.pwd,
    this.nickName,
    this.name,
    this.birthday,
    this.age,
    this.phoneNumber,
    this.channelList,
    this.minCost,
    this.categoryList,
    this.regionList,
    this.address,
    this.imageResponses,
  });

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'pwd': pwd,
        'nickName': nickName,
        'name': name,
        'birthday': birthday,
        'age': age,
        'phoneNumber': phoneNumber,
        'channelList': channelList,
        'minCost': minCost,
        'categoryList': categoryList,
        'regionList': regionList,
        'address': address,
      };

  factory Clouter.fromJson(Map<String, dynamic> json) {
    return Clouter(
      userId: json['userId'],
      pwd: json['pwd'],
      nickName: json['nickName'],
      name: json['name'],
      birthday: json['birthday'],
      age: json['age'],
      phoneNumber: json['phoneNumber'],
      channelList: json['channelList'],
      minCost: json['minCost'],
      categoryList: json['categoryList'],
      regionList: json['regionList'],
      address: Address.fromJson(json['address']),
      imageResponses: json['imageResponses'],
    );
  }
}

class ImageResponse {
  int? id;
  String? originalName;
  String? path;

  ImageResponse({this.id, this.originalName, this.path});

  factory ImageResponse.fromJson(Map<String, dynamic> json) {
    return ImageResponse(
      id: json['id'],
      originalName: json['originalName'],
      path: json['path'],
    );
  }
}

class ClouterInfo {
  int? clouterId;
  String? userId;
  int? avgScore;
  // int? contractCount;
  String? role;
  String? nickName;
  String? name;
  String? birthday;
  int? age;
  String? phoneNumber;
  List<dynamic>? channelList;
  int? minCost;
  List<String>? categoryList;
  List<String>? regionList;
  Address? address;
  int? countOfContract;
  List<dynamic>? imageResponses;

  ClouterInfo(
      {this.clouterId,
      this.userId,
      this.avgScore,
      // this.contractCount,
      this.role,
      this.nickName,
      this.name,
      this.birthday,
      this.age,
      this.phoneNumber,
      this.channelList,
      this.minCost,
      this.categoryList,
      this.regionList,
      this.address,
      this.countOfContract,
      this.imageResponses});

  ClouterInfo.fromJson(Map<String, dynamic> json) {
    clouterId = json['clouterId'];
    userId = json['userId'];
    avgScore = json['avgScore'];
    role = json['role'];
    nickName = json['nickName'];
    name = json['name'];
    birthday = json['birthday'];
    age = json['age'];
    phoneNumber = json['phoneNumber'];
    if (json['channelList'] != null) {
      channelList = <ChannelList>[];
      json['channelList'].forEach((v) {
        channelList!.add(ChannelList.fromJson(v));
      });
    }
    minCost = json['minCost'];
    categoryList = json['categoryList'];
    regionList = json['regionList'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    countOfContract = json['countOfContract'];
    imageResponses = json['imageResponses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['clouterId'] = clouterId;
    data['userId'] = userId;
    data['avgScore'] = avgScore;
    data['role'] = role;
    data['nickName'] = nickName;
    data['name'] = name;
    data['birthday'] = birthday;
    data['age'] = age;
    data['phoneNumber'] = phoneNumber;
    if (channelList != null) {
      data['channelList'] = channelList!.map((v) => v.toJson()).toList();
    }
    data['minCost'] = minCost;
    data['categoryList'] = categoryList;
    data['regionList'] = regionList;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['countOfContract'] = countOfContract;
    data['imageResponses'] = imageResponses;
    return data;
  }
}

class LoginInfo {
  // int user; //??
  String userId;
  String password;

  LoginInfo(
      // this.user,
      this.userId,
      this.password);

  Map<String, dynamic> toJson() => {
        // 'user' : user,
        'userId': userId,
        'password': password
      };
}

class CampaignResponse {
  CampaignInfo? campaignInfo;
  AdvertiserInfo? advertiserInfo;
  List<dynamic>? imageList;

  CampaignResponse({
    this.campaignInfo,
    this.advertiserInfo,
    this.imageList,
  });

  factory CampaignResponse.fromJson(Map<String, dynamic> json) {
    print('이거');
    print(json['campaignInfo']);
    print('똥');
    print(json['advertiserInfo']);
    print(json['imageList']);
    return CampaignResponse(
      campaignInfo: CampaignInfo.fromJson(json['campaignInfo']),
      advertiserInfo: AdvertiserInfo.fromJson(json['advertiserInfo']),
      imageList: json['imageList'],
    );
  }

  Map<String, dynamic> toJson() => {
        'campaignInfo': campaignInfo,
        'advertiserInfo': advertiserInfo,
        // 'companyInfo': companyInfo,
        // 'imageList': imageList,
      };
}

class Campaign {
  int? campaignId;
  List<String>? adPlatformList;
  int? price;
  String? details;
  String? title;
  String? deletedAt;
  String? adCategory;
  bool? isPriceChangeable;
  bool? isDeliveryRequired;
  int? numberOfRecruiter;
  int? numberOfApplicants;
  int? numberOfSelectedMembers;
  String? offeringDetails;
  String? sellingLink;
  String? applyStartDate;
  String? applyEndDate;
  int? minClouterAge;
  int? maxClouterAge;
  int? minFollower;
  bool? isEnded;
  int? registerId;
  List<String>? regionList;
  List<dynamic>? imageList;

  Campaign(
      {this.campaignId,
      this.adPlatformList,
      this.price,
      this.details,
      this.title,
      this.deletedAt,
      this.adCategory,
      this.isPriceChangeable,
      this.isDeliveryRequired,
      this.numberOfRecruiter,
      this.numberOfApplicants,
      this.numberOfSelectedMembers,
      this.offeringDetails,
      this.sellingLink,
      this.applyStartDate,
      this.applyEndDate,
      this.minClouterAge,
      this.maxClouterAge,
      this.minFollower,
      this.isEnded,
      this.registerId,
      this.regionList,
      this.imageList});

  Campaign.fromJson(Map<String, dynamic> json) {
    campaignId = json['campaignId'];
    adPlatformList = json['adPlatformList'].cast<String>();
    price = json['price'];
    details = json['details'];
    deletedAt = json['deletedAt'];
    title = json['title'];
    adCategory = json['adCategory'];
    isPriceChangeable = json['isPriceChangeable'];
    isDeliveryRequired = json['isDeliveryRequired'];
    numberOfRecruiter = json['numberOfRecruiter'];
    numberOfApplicants = json['numberOfApplicants'];
    numberOfSelectedMembers = json['numberOfSelectedMembers'];
    offeringDetails = json['offeringDetails'];
    sellingLink = json['sellingLink'];
    applyStartDate = json['applyStartDate'];
    applyEndDate = json['applyEndDate'];
    minClouterAge = json['minClouterAge'];
    maxClouterAge = json['maxClouterAge'];
    minFollower = json['minFollower'];
    isEnded = json['isEnded'];
    registerId = json['registerId'];
    regionList = json['regionList'];
    imageList = json['imageList'];
  }

  Map<String, dynamic> toJson() => {
        // 'user' : user,
        'campaignId': campaignId,
        'adPlatformList': adPlatformList,
        'price': price,
        'details': details,
        'deletedAt': deletedAt,
        'title': title,
        'adCategory': adCategory,
        'isPriceChangeable': isPriceChangeable,
        'isDeliveryRequired': isDeliveryRequired,
        'numberOfRecruiter': numberOfRecruiter,
        'numberOfApplicants': numberOfApplicants,
        'numberOfSelectedMembers': numberOfSelectedMembers,
        'offeringDetails': offeringDetails,
        'sellingLink': sellingLink,
        'applyStartDate': applyStartDate,
        'applyEndDate': applyEndDate,
        'minClouterAge': minClouterAge,
        'maxClouterAge': maxClouterAge,
        'minFollower': minFollower,
        'isEnded': isEnded,
        'registerId': registerId,
        'regionList': regionList,
        'imageList': imageList,
      };
}

class AdvertiserInfo {
  int? advertiserId;
  String? userId;
  int? totalPoint;
  String? role;
  int? advertiserAvgStar;
  Address? address;
  CompanyInfo? companyInfo;

  AdvertiserInfo(
    this.advertiserId,
    this.userId,
    this.totalPoint,
    this.role,
    this.advertiserAvgStar,
    this.address,
    this.companyInfo,
  );

  Map<String, dynamic> toJson() => {
        'advertiserId': advertiserId,
        'userId': userId,
        'totalPoint': totalPoint,
        'role': role,
        'advertiserAvgStar': advertiserAvgStar,
        'address': address,
        'companyInfo': companyInfo,
      };

  factory AdvertiserInfo.fromJson(Map<String, dynamic> json) {
    if (json['companyInfo'] == null) {
      return AdvertiserInfo(
        json['advertiserId'],
        json['userId'],
        json['totalPoint'],
        json['role'],
        json['advertiserAvgStar'],
        json['address'] != null ? Address.fromJson(json['address']) : null,
        null, // companyInfo가 없는 경우 null로 설정
      );
    } else {
      return AdvertiserInfo(
        json['advertiserId'],
        json['userId'],
        json['totalPoint'],
        json['role'],
        json['advertiserAvgStar'],
        json['address'] != null ? Address.fromJson(json['address']) : null,
        CompanyInfo.fromJson(json['companyInfo']),
      );
    }
  }
}

class CampaignList {
  List<dynamic> campaignList;
  AdvertiserInfo advertiserInfo;

  CampaignList({
    required this.campaignList,
    required this.advertiserInfo,
  });

  factory CampaignList.fromJson(Map<String, dynamic> json) {
    return CampaignList(
      campaignList: json['campaignList'],
      advertiserInfo: AdvertiserInfo.fromJson(json['advertiserInfo']),
    );
  }
}

class Top10CampaignList {
  Campaign? campaign;
  AdvertiserInfo? advertiserInfo;

  Top10CampaignList({this.campaign, this.advertiserInfo});

  Top10CampaignList.fromJson(Map<String, dynamic> json) {
    campaign =
        json['campaign'] != null ? Campaign.fromJson(json['campaign']) : null;
    advertiserInfo = json['advertiserInfo'] != null
        ? AdvertiserInfo.fromJson(json['advertiserInfo'])
        : null;
  }
}

class CampaignInfo {
  int? campaignId;
  List<String>? adPlatformList;
  int? price;
  String? details;
  String? deletedAt;
  String? title;
  String? adCategory;
  bool? isPriceChangeable;
  bool? isDeliveryRequired;
  int? numberOfRecruiter;
  int? numberOfApplicants;
  int? numberOfSelectedMembers;
  String? offeringDetails;
  String? sellingLink;
  String? applyStartDate;
  String? applyEndDate;
  int? minClouterAge;
  int? maxClouterAge;
  int? minFollower;
  bool? isEnded;
  AdvertiserInfo? advertiserInfo;
  Address? address;
  CompanyInfo? companyInfo;
  List<dynamic>? imageList;

  CampaignInfo({
    this.campaignId,
    this.adPlatformList,
    this.price,
    this.details,
    this.deletedAt,
    this.title,
    this.adCategory,
    this.isPriceChangeable,
    this.isDeliveryRequired,
    this.numberOfRecruiter,
    this.numberOfApplicants,
    this.numberOfSelectedMembers,
    this.offeringDetails,
    this.sellingLink,
    this.applyStartDate,
    this.applyEndDate,
    this.minClouterAge,
    this.maxClouterAge,
    this.minFollower,
    this.companyInfo,
    this.address,
    this.advertiserInfo,
    this.imageList,
  });

  factory CampaignInfo.fromJson(Map<String, dynamic> json) {
    return CampaignInfo(
        campaignId: json['campaignId'],
        adPlatformList: json['adPlatformList'] != null
            ? List<String>.from(json['adPlatformList'])
            : null,
        price: json['price'],
        details: json['details'],
        deletedAt: json['deletedAt'],
        title: json['title'],
        adCategory: json['adCategory'],
        isPriceChangeable: json['isPriceChangeable'],
        isDeliveryRequired: json['isDeliveryRequired'],
        numberOfRecruiter: json['numberOfRecruiter'],
        numberOfApplicants: json['numberOfApplicants'],
        numberOfSelectedMembers: json['numberOfSelectedMembers'],
        offeringDetails: json['offeringDetails'],
        sellingLink: json['sellingLink'],
        applyStartDate: json['applyStartDate'],
        applyEndDate: json['applyEndDate'],
        minClouterAge: json['minClouterAge'],
        maxClouterAge: json['maxClouterAge'],
        minFollower: json['minFollower'],
        companyInfo: json['companyInfo'] != null
            ? CompanyInfo.fromJson(json['companyInfo'])
            : null,
        address:
            json['address'] != null ? Address.fromJson(json['address']) : null,
        advertiserInfo: json['advertiserInfo'] != null
            ? AdvertiserInfo.fromJson(json['advertiserInfo'])
            : null,
        imageList: json['imageList']);
  }
}

class RegionBool {
  String region;
  bool selected;

  RegionBool(this.region, this.selected);
}

class Category {
  String english;
  String korean;

  Category(this.english, this.korean);
}

class ClouterRegisterForm {
  Clouter clouter;
  List<MultipartFile> files;

  ClouterRegisterForm({required this.clouter, required this.files});

  Map<String, dynamic> toJson() => {
        'createClrRequest': clouter,
        'files': files,
      };
}

class ContractResponse {
  List<dynamic>? content;

  ContractResponse({this.content});

  factory ContractResponse.fromJson(Map<String, dynamic> json) {
    return ContractResponse(content: json['content']);
  }
}

class ContractContent {
  int? contractId;
  String? name;
  int? price;
  String? postDeadline;
  String? contractExpiration;
  String? contents;
  ClouterInfo? clouterInfo;
  AdvertiserInfo? advertiserInfo;
  String? state;
  String? path;

  ContractContent({
    this.contractId,
    this.name,
    this.price,
    this.postDeadline,
    this.contractExpiration,
    this.contents,
    this.clouterInfo,
    this.advertiserInfo,
    this.state,
    this.path,
  });

  factory ContractContent.fromJson(Map<String, dynamic> json) {
    return ContractContent(
      contractId: json['contractId'],
      name: json['name'],
      price: json['price'],
      postDeadline: json['postDeadline'],
      contractExpiration: json['contractExpiration'],
      contents: json['contents'],
      clouterInfo: ClouterInfo.fromJson(json['clouterInfo']),
      advertiserInfo: AdvertiserInfo.fromJson(json['advertiserInfo']),
      state: json['state'],
      path: json['path'],
    );
  }
}

class AppliedClouterInfo {
  int? applyId;
  int? campaignId;
  int? numberOfRecruiter;
  int? numberOfApplicants;
  int? numberOfSelectedMembers;
  int? hopeAdFee;
  String? applyStatus;
  String? nickname;
  int? clouterAvgStar;
  List<ClouterChannelList>? clouterChannelList;
  int? clouterId;

  AppliedClouterInfo(
      this.applyId,
      this.campaignId,
      this.numberOfRecruiter,
      this.numberOfApplicants,
      this.numberOfSelectedMembers,
      this.hopeAdFee,
      this.applyStatus,
      this.nickname,
      this.clouterAvgStar,
      this.clouterChannelList,
      this.clouterId);

  AppliedClouterInfo.fromJson(Map<String, dynamic> json) {
    campaignId = json['campaignId'];
    numberOfRecruiter = json['numberOfRecruiter'];
    numberOfApplicants = json['numberOfApplicants'];
    numberOfSelectedMembers = json['numberOfSelectedMembers'];
    hopeAdFee = json['hopeAdFee'];
    applyStatus = json['applyStatus'];
    nickname = json['nickname'];
    clouterAvgStar = json['clouterAvgStar'];
    if (json['clouterChannelList'] != null) {
      clouterChannelList = <ClouterChannelList>[];
      json['clouterChannelList'].forEach((v) {
        clouterChannelList!.add(ClouterChannelList.fromJson(v));
      });
    }
    clouterId = json['clouterId'];
    applyId = json['applyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['campaignId'] = campaignId;
    data['numberOfRecruiter'] = numberOfRecruiter;
    data['numberOfApplicants'] = numberOfApplicants;
    data['numberOfSelectedMembers'] = numberOfSelectedMembers;
    data['hopeAdFee'] = hopeAdFee;
    data['applyStatus'] = applyStatus;
    data['nickname'] = nickname;
    data['clouterAvgStar'] = clouterAvgStar;
    if (clouterChannelList != null) {
      data['clouterChannelList'] =
          clouterChannelList!.map((v) => v.toJson()).toList();
    }
    data['clouterId'] = clouterId;
    data['applyId'] = applyId;
    return data;
  }
}

class ClouterChannelList {
  String? name;
  String? platform;
  String? link;
  String? followerScale;

  ClouterChannelList({this.name, this.platform, this.link, this.followerScale});

  ClouterChannelList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    platform = json['platform'];
    link = json['link'];
    followerScale = json['followerScale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['platform'] = platform;
    data['link'] = link;
    data['followerScale'] = followerScale;
    return data;
  }
}
