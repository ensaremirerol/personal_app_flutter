class ProfileModel {
  final String? network;
  final String? username;
  final String? url;

  ProfileModel({this.network, this.username, this.url});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      network: json['network'],
      username: json['username'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['network'] = this.network;
    data['username'] = this.username;
    data['url'] = this.url;
    return data;
  }

  @override
  String toString() {
    return 'ProfileModel{network: $network, username: $username, url: $url}';
  }
}
