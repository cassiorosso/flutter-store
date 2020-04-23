class CustomerModel{

String name;
String email;
String token;
String id;

CustomerModel({this.id,this.email, this.name,this.token});

Map<String,dynamic> toMap(CustomerModel user){
  Map<String,dynamic> map = Map<String,dynamic>();
  map['name'] = user.name;
  map['email'] = user.email;
  map['token'] = user.token;

  return map;
}

    factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["_id"],
        name: json["name"],
    );

}