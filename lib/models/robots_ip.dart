class IpCode {
  String? name;
  String? email;
  String? mission;
  String? status;
  String? currentSkipId;
  List<int>? camerasArrangement;
  String? ipAddress;
  String? agoraChannel;
  String? phoneNumber;
  String? type;

  IpCode(
      {this.name,
      this.email,
      this.mission,
      this.status,
      this.currentSkipId,
      this.camerasArrangement,
      this.ipAddress,
      this.agoraChannel,
      this.phoneNumber,
      this.type});

  IpCode.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mission = json['mission'];
    status = json['status'];
    currentSkipId = json['current_skip_id'];
    camerasArrangement = json['cameras_arrangement'].cast<int>();
    ipAddress = json['ip_address'];
    agoraChannel = json['agora_channel'];
    phoneNumber = json['phone_number'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['mission'] = mission;
    data['status'] = status;
    data['current_skip_id'] = currentSkipId;
    data['cameras_arrangement'] = camerasArrangement;
    data['ip_address'] = ipAddress;
    data['agora_channel'] = agoraChannel;
    data['phone_number'] = phoneNumber;
    data['type'] = type;
    return data;
  }
}
