class UserInfoProfile {
  String? userid;
  String? userName;
  String? userPhone;
  String? userMail;
  String? userImage;
  String? userAccountType;
  int?plan;
  UserInfoProfile(
      {this.userid,
      this.userName,
      this.userPhone,
      this.userMail,
      this.userImage,
      this.userAccountType,
      this.plan
      });

  UserInfoProfile.fromJson(Map<String, dynamic> map)
      : this(
          userid: map['id'].toString(),
          userName: map['name'].toString(),
          userPhone: map['phone'].toString(),
          userMail: map['email'].toString(),
          userAccountType: map['type'].toString(),
          userImage: map['image'].toString(),
          plan: map['plan'],
        );

  Map<String, dynamic> toJson(
          {required String id,
          required String name,
          required String phone,
          required String email,
          required String type,
          required String url,
          required int plan
          }) =>
      {
        'id': id,
        'name': name,
        'phone': phone,
        'email': email,
        'type': type,
        'image': url,
        'plan':plan
      };
}
