class ProductModel {

  String title;
  String description;
  String slug;
  String image;
  String id;
  var price;
  List<String> tags;

  ProductModel({this.tags, this.description, this.slug, this.image, this.price, this.title, this.id});

  ProductModel.fromJson(Map<String, dynamic> json){
    this.title = json["title"];
    this.description = json["description"];
    this.slug = json["slug"];
    this.image = json["image"];
    this.price = json["price"];
    this.tags = json["tags"];
    this.id = json["_id"];
    }

}