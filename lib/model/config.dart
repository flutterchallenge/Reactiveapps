class Config {
  String appName;
  String versionName;
  String versionCode;
  String versionInfo;
  String alert;
  String alertLink;
  int update;

  Config(
      {this.appName,
        this.versionName,
        this.versionCode,
        this.versionInfo,
        this.alert,
        this.alertLink,
        this.update});

  Config.fromJson(Map<String, dynamic> json) {
    appName = json['appName'];
    versionName = json['versionName'];
    versionCode = json['versionCode'];
    versionInfo = json['versionInfo'];
    alert = json['alert'];
    alertLink = json['alert_link'];
    update = json['update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appName'] = this.appName;
    data['versionName'] = this.versionName;
    data['versionCode'] = this.versionCode;
    data['versionInfo'] = this.versionInfo;
    data['alert'] = this.alert;
    data['alert_link'] = this.alertLink;
    data['update'] = this.update;
    return data;
  }
}
