class CandleDataModel {
  List<Deseased> deseased=[];
  bool upgrade;

  CandleDataModel({this.deseased});

  CandleDataModel.fromJson(Map<String, dynamic> json) {
    if (json['deseased'] != null) {
      deseased = new List<Deseased>();
      json['deseased'].forEach((v) {
        deseased.add(new Deseased.fromJson(v));
      });
    }
    upgrade = json['upgrade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deseased != null) {
      data['deseased'] = this.deseased.map((v) => v.toJson()).toList();
    }
    data['upgrade'] = this.upgrade;
    return data;
  }
}

class Deseased {
  String deceasedDate;
  String candleType;
  String deceasedMessage;
  bool remindByPhone;
  bool remindByEmail;
  bool candleLighted;
  bool isTraditionalCalander;
  bool beforeSunset;
  String deceasedName;
  String userId;
  String userName;
  String candleId;
  String deceasedMusic;
  String deceasedPhoto;
  List<DeceasedInvites> deceasedInvites;
  List<String> deceasedfiles;

  Deseased(
      {this.deceasedDate,
        this.candleType,
        this.deceasedMessage,
        this.remindByPhone,
        this.remindByEmail,
        this.candleLighted,
        this.isTraditionalCalander,
        this.beforeSunset,
        this.deceasedName,
        this.userName,
        this.userId,
        this.candleId,
        this.deceasedMusic,
        this.deceasedPhoto,
        this.deceasedInvites,
        this.deceasedfiles,
      });

  Deseased.fromJson(Map<String, dynamic> json) {
    deceasedDate = json['deceased_date'];
    candleType = json['candle_type'];
    deceasedMessage = json['deceased_message'];
    remindByPhone = json['remind_by_phone'];
    remindByEmail = json['remind_by_email'];
    isTraditionalCalander = json['isTraditionalCalander']==null?true:json['isTraditionalCalander'];
    beforeSunset = json['beforeSunset']==null?true:json['beforeSunset'];
    candleLighted = json['candle_lighted'];
    deceasedName = json['deceased_name'];
    userName = json['user_name'];
    userId = json['userId'];
    candleId = json['candle_id'];
    deceasedMusic = json['deceased_music'];
    deceasedPhoto = json['deceased_photo'];
    if (json['deceased_invites'] != null) {
      deceasedInvites = new List<DeceasedInvites>();
      json['deceased_invites'].forEach((v) {
        deceasedInvites.add(new DeceasedInvites.fromJson(v));
      });
    }
    deceasedfiles =json['deceased_files']!=null? json['deceased_files'].cast<String>():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deceased_date'] = this.deceasedDate;
    data['candle_type'] = this.candleType;
    data['deceased_message'] = this.deceasedMessage;
    data['remind_by_phone'] = this.remindByPhone;
    data['remind_by_email'] = this.remindByEmail;
    data['isTraditionalCalander'] = this.isTraditionalCalander;
    data['beforeSunset'] = this.beforeSunset;
    data['candle_lighted'] = this.candleLighted;
    data['deceased_name'] = this.deceasedName;
    data['user_name'] = this.userName;
    data['userId'] = this.userId;
    data['candle_id'] = this.candleId;
    data['deceased_music'] = this.deceasedMusic;
    data['deceased_photo'] = this.deceasedPhoto;
    if (this.deceasedInvites != null) {
      data['deceased_invites'] = this.deceasedInvites.map((v) => v.toJson()).toList();
    }
    data['deceased_files'] = this.deceasedfiles;
    return data;
  }

}
class DeceasedInvites {
  String deceasedName;
  String deceasedEmail;

  DeceasedInvites({this.deceasedName, this.deceasedEmail});

  DeceasedInvites.fromJson(Map<String, dynamic> json) {
    deceasedName = json['deceasedName'];
    deceasedEmail = json['deceasedEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deceasedName'] = this.deceasedName;
    data['deceasedEmail'] = this.deceasedEmail;
    return data;
  }
}



