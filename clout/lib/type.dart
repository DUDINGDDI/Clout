import 'dart:convert';
import 'dart:typed_data';

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
    final Map<String, dynamic> data = Map<String, dynamic>();
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

  Clouter(
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
  );

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
        json['userId'],
        json['pwd'],
        json['nickName'],
        json['name'],
        json['birthday'],
        json['age'],
        json['phoneNumber'],
        json['channelList'],
        json['minCost'],
        json['categoryList'],
        json['regionList'],
        Address.fromJson(json['address']));
  }
}

// 💥 계약한 광고 건수 추가하기
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

  ClouterInfo(
    this.clouterId,
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
  );

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
    categoryList = json['categoryList'].cast<String>();
    regionList = json['regionList'].cast<String>();
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
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
    return data;
  }
}

class Login {
  // int user; //??
  String userId;
  String password;

  Login(
      // this.user,
      this.userId,
      this.password);

  Map<String, dynamic> toJson() => {
        // 'user' : user,
        'userId': userId,
        'password': password
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
      this.isEnded});

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
  }
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
  // String? image;

  CampaignInfo(
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
    // required this.firstImg,
  );

  factory CampaignInfo.fromJson(Map<String, dynamic> json) {
    return CampaignInfo(
      json['campaignId'],
      json['adPlatformList'] != null
          ? List<String>.from(json['adPlatformList'])
          : null,
      json['price'],
      json['details'],
      json['deletedAt'],
      json['title'],
      json['adCategory'],
      json['isPriceChangeable'],
      json['isDeliveryRequired'],
      json['numberOfRecruiter'],
      json['numberOfApplicants'],
      json['numberOfSelectedMembers'],
      json['offeringDetails'],
      json['sellingLink'],
      json['applyStartDate'],
      json['applyEndDate'],
      json['minClouterAge'],
      json['maxClouterAge'],
      json['minFollower'],
      json['companyInfo'] != null
          ? CompanyInfo.fromJson(json['companyInfo'])
          : null,
      json['address'] != null ? Address.fromJson(json['address']) : null,
      json['advertiserInfo'] != null
          ? AdvertiserInfo.fromJson(json['advertiserInfo'])
          : null,
    );
  }
}