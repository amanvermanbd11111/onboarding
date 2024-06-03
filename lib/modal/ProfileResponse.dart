class ProfileResponse {
  String? message;
  bool? status;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? totalReceived;
  String? totalInReview;
  String? totalRejected;
  String? totalReceivedToday;
  String? totalInReviewToday;
  String? totalRejectedToday;
  String? createdDate;

  ProfileResponse(
      {this.message,
        this.status,
        this.name,
        this.phone,
        this.email,
        this.address,
        this.totalReceived,
        this.totalInReview,
        this.totalRejected,
        this.totalReceivedToday,
        this.totalInReviewToday,
        this.totalRejectedToday,
        this.createdDate});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    totalReceived = json['total_received'];
    totalInReview = json['total_in_review'];
    totalRejected = json['total_rejected'];
    totalReceivedToday = json['total_received_today'];
    totalInReviewToday = json['total_in_review_today'];
    totalRejectedToday = json['total_rejected_today'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['total_received'] = this.totalReceived;
    data['total_in_review'] = this.totalInReview;
    data['total_rejected'] = this.totalRejected;
    data['total_received_today'] = this.totalReceivedToday;
    data['total_in_review_today'] = this.totalInReviewToday;
    data['total_rejected_today'] = this.totalRejectedToday;
    data['created_date'] = this.createdDate;
    return data;
  }
}
