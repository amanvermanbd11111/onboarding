class HistoryResponse {
  bool? status;
  String? message;
  List<Data>? data;

  HistoryResponse({this.status, this.message, this.data});

  HistoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));

      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? onboardingId;
  String? name;
  String? location;
  String? contactNumber;
  String? inventory;
  String? invPerMonth;
  String? fsc;
  String? date;
  String? medium;
  String? image;
  String? imagePath;
  String? userId;
  String? status;
  String? comment;
  String? createdDate;
  String? createdTime;

  Data(
      {this.id,
        this.onboardingId,
        this.name,
        this.location,
        this.contactNumber,
        this.inventory,
        this.invPerMonth,
        this.fsc,
        this.date,
        this.medium,
        this.image,
        this.imagePath,
        this.userId,
        this.status,
        this.comment,
        this.createdDate,
        this.createdTime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    onboardingId = json['onboarding_id'];
    name = json['name'];
    location = json['location'];
    contactNumber = json['contact_number'];
    inventory = json['inventory'];
    invPerMonth = json['inv_per_month'];
    fsc = json['fsc'];
    date = json['date'];
    medium = json['medium'];
    image = json['image'];
    imagePath = json['image_path'];
    userId = json['user_id'];
    status = json['status'];
    comment = json['comment'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['onboarding_id'] = this.onboardingId;
    data['name'] = this.name;
    data['location'] = this.location;
    data['contact_number'] = this.contactNumber;
    data['inventory'] = this.inventory;
    data['inv_per_month'] = this.invPerMonth;
    data['fsc'] = this.fsc;
    data['date'] = this.date;
    data['medium'] = this.medium;
    data['image'] = this.image;
    data['image_path'] = this.imagePath;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['comment'] = this.comment;
    data['created_date'] = this.createdDate;
    data['created_time'] = this.createdTime;
    return data;
  }
}
