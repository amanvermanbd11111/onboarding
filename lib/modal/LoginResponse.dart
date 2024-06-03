class LoginResponse {
  String? message;
  bool? status;
  String? userId;

  LoginResponse({this.message, this.status, this.userId});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    return data;
  }
}
