class Products {
  final String id;
  final String title;
  final String image;
  final String description;
  final String price;
  // final List<RatingModel> rating;

  Products(
      {required this.description,
      required this.id,
      // required this.rating,
      required this.image,
      required this.title,
      required this.price});

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
        description: map['description'],
        id: map['id'].toString(),
        // rating: List<RatingModel>.from(
        //   map['rating'].map(
        //     (e) => RatingModel.fromMap(e),
        //   ),
        // ),
        image: map['image'],
        title: map['title'],
        price: map['price'].toString());
  }

  Map<String, dynamic> toMap() {
    return {
      "description": description,
      "image": image,
      "price": price,
      "title": title,
      "id": id
    };
  }
}

class RatingModel {
  final String count;
  final String rate;

  RatingModel({
    required this.count,
    required this.rate,
  });

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
        count: map['count'].toString(), rate: map['rate'].toString());
  }

  Map<String, dynamic> toMap() {
    return {"count": count, "rate": rate};
  }
}
