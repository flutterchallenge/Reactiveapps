class Forex {
  Rates rates;
  int code;

  Forex({this.rates, this.code});

  Forex.fromJson(Map<String, dynamic> json) {
    rates = json['rates'] != null ? new Rates.fromJson(json['rates']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rates != null) {
      data['rates'] = this.rates.toJson();
    }
    data['code'] = this.code;
    return data;
  }
}

class Rates {
  EURUSD eURUSD;

  Rates({this.eURUSD});

  Rates.fromJson(Map<String, dynamic> json) {
    eURUSD =
    json['EURUSD'] != null ? new EURUSD.fromJson(json['EURUSD']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eURUSD != null) {
      data['EURUSD'] = this.eURUSD.toJson();
    }
    return data;
  }
}

class EURUSD {
  double rate;
  int timestamp;

  EURUSD({this.rate, this.timestamp});

  EURUSD.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['timestamp'] = this.timestamp;
    return data;
  }
}