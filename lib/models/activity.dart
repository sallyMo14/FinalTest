import 'package:gsg_final_project_rgs/models/user.dart';

class Activitie {
  int? id;
  String? body;
  String? userId;
  String? mailId;
  dynamic sendNumber;
  dynamic sendDate;
  dynamic sendDestination;
  String? createdAt;
  String? updatedAt;
  User? user;

  Activitie(
      {this.id,
      this.body,
      this.userId,
      this.mailId,
      this.sendNumber,
      this.sendDate,
      this.sendDestination,
      this.createdAt,
      this.updatedAt,
      this.user});

  Activitie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    userId = json['user_id'];
    mailId = json['mail_id'];
    sendNumber = json['send_number'];
    sendDate = json['send_date'];
    sendDestination = json['send_destination'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['body'] = this.body;
    data['user_id'] = this.userId;
    data['mail_id'] = this.mailId;
    data['send_number'] = this.sendNumber;
    data['send_date'] = this.sendDate;
    data['send_destination'] = this.sendDestination;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
