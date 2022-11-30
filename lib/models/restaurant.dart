class Restaurant {
  int? id;
  String? title;
  String? poster;

  Restaurant(this.id, this.title, this.poster);

  Restaurant.fromJson(Map<String, dynamic> json){
    id = json["id"];
    title = json["title"];
    poster = json["poster"];
  }
}