class CertificateModel {
  final String? name;
  final String? issuer;
  final String? date;
  final String? url;

  CertificateModel({
    this.name,
    this.issuer,
    this.date,
    this.url,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) =>
      CertificateModel(
        name: json["name"],
        issuer: json["issuer"],
        date: json["date"],
        url: json["url"],
      );
  
  Map<String, dynamic> toJson() => {
        "name": name,
        "issuer": issuer,
        "date": date,
        "url": url,
      };

  @override
  String toString() {
    return 'CertificateModel{name: $name, issuer: $issuer, date: $date, url: $url}';
  }
}
