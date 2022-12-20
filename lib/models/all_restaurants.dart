class AllRestaurants {
  String? sId;
  int? rid;
  String? name;
  String? logo;
  bool? delivery;
  bool? takeout;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? zip;
  String? phone;
  double? latitude;
  double? longitude;
  String? specialInstructions;
  int? unlockCode;
  int? iV;

  AllRestaurants(
      {this.sId,
      this.rid,
      this.name,
      this.logo,
      this.delivery,
      this.takeout,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.zip,
      this.phone,
      this.latitude,
      this.longitude,
      this.specialInstructions,
      this.unlockCode,
      this.iV});

  AllRestaurants.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    rid = json['rid'];
    name = json['name'];
    logo = json['logo'];
    delivery = json['delivery'];
    takeout = json['takeout'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
    phone = json['phone'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    specialInstructions = json['special_instructions'];
    unlockCode = json['unlock_code'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['rid'] = rid;
    data['name'] = name;
    data['logo'] = logo;
    data['delivery'] = delivery;
    data['takeout'] = takeout;
    data['address1'] = address1;
    data['address2'] = address2;
    data['city'] = city;
    data['state'] = state;
    data['zip'] = zip;
    data['phone'] = phone;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['special_instructions'] = specialInstructions;
    data['unlock_code'] = unlockCode;
    data['__v'] = iV;
    return data;
  }
}
