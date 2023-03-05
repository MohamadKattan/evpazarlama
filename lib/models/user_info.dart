import 'package:evpazarlama/helper/config.dart';

class UserInfoProfile {
  String? userid;
  String? userName;
  String? userPhone;
  String? userMail;
  String? userImage;
  String? userAccountType;
  UserInfoProfile(
      {this.userid,
      this.userName,
      this.userPhone,
      this.userMail,
      this.userImage,
      this.userAccountType});

  UserInfoProfile.fromMap(Map<String, dynamic> map) {
    UserInfoProfile(
      userid: map['id'].toString(),
      userName: map['name'].toString(),
      userPhone: map['phone'].toString(),
      userImage: map['image'].toString(),
      userMail: map['mail'].toString(),
      userAccountType: map['type'].toString(),
    );
  }
  Map<String, dynamic> toJson(String name) => {
        'id': userId,
        'name': name,
        'phone': authInstance.currentUser?.phoneNumber ?? 'null',
        'image': userImage,
        'mail': userMail,
        'type': userAccountType,
      };
}
