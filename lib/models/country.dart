

class Countries {
  final String code;
  final String countryName;
  final int geonameid;


  Countries({ required this.code, required this.countryName, required this.geonameid});


  factory Countries.fromJson(Map<String, dynamic> json) {
    return Countries(
      code: json['country_code'],
      countryName: json['country_name'],
      geonameid: json['geonameid'],
     
    );
  }
  void printfromJson() {
    print('CODE: $code, CountryName: $countryName, GEONAIMED: $geonameid');
  }
}
