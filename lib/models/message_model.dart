import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModle {
  String? sendrId;
  String? recevrdId;
  String? text;
  String? adsNumber;
  Timestamp? greatAt;
  MessageModle(
      {this.sendrId, this.recevrdId,this.text, this.greatAt, this.adsNumber});
  MessageModle.fromMap(Map<String, dynamic> map) {
    sendrId = map['sendrId'];
    recevrdId = map['recevrdId'];
    text = map['text'];
    adsNumber = map['adsNumber'];
    greatAt = map['greatAt'];
  }

  Map<String, dynamic> toJson(
          {required String sendrId,
          required String recevrdId,
          required String text,
          required String adsNumber}) =>
      {
        "sendrId": sendrId,
        "recevrdId": recevrdId,
        "text": text,
        "adsNumber": adsNumber,
        "greatAt": DateTime.now(),
      };
}
