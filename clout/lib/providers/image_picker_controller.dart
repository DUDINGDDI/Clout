import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  static final ImagePickerService _imagePickerService =
      ImagePickerService._internal();

  factory ImagePickerService() {
    return _imagePickerService;
  }

  ImagePickerService._internal();

  final ImagePicker _picker = ImagePicker();

  Future<List<XFile>> pickImage() async {
    try {
      final pickedFile = await _picker.pickMultiImage();
      return pickedFile;
    } catch (e) {
      print('ImagePickerService: $e');
      return [];
    }
  }

  Future<XFile?> pickSingleImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      return pickedFile;
    } catch (e) {
      print('ImagePickerService: $e');
      return null;
    }
  }
}

////////////////////////////////////////////////////////////////////////////////// 여기가 메인
class ImagePickerController extends GetxController {
  final picker = ImagePickerService();

  // List<XFile> images = [];
  List<XFile> images = [
    // XFile('assets/images/clouterImage.jpg'),
    // XFile('assets/images/itemImage.jpg'),
    // XFile('assets/images/more.png'),
  ];

  // 기존 사진 가져오는 로직(회원 정보 수정때 사용해야함)
  // loadPreviousImage() async {
  //   if (registerController.images.isNotEmpty) {
  //     var previousImg = registerController.images;
  //     List<XFile> imgList = [];
  //     for (int i = 0; i < previousImg.length; i++) {
  //       final ByteData bytes = await rootBundle.load(previousImg[i]);
  //       final Uint8List target = bytes.buffer.asUint8List();
  //       imgList.add(XFile.fromData(target));
  //       print('따잇');
  //     }
  //     state = imgList;
  //   }
  // }

  delImage(XFile image) {
    images.remove(image);
    update();
  }

  addImage(List<XFile> value) {
    if (images.isEmpty) {
      images.addAll(value);
    } else {
      images.addAll(value);
    }
    if (images.length > 4) {
      images = images.sublist(0, 4);
      Fluttertoast.showToast(msg: '사진은 최대 4장까지만 등록가능합니다.');
    }
    update();
  }

  Future getImage() async {
    picker.pickImage().then((value) {
      addImage(value);
    }).catchError((onError) {
      Fluttertoast.showToast(msg: 'failed to get image');
    });
  }
}
