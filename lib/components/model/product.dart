class Products {
  Products({
    required this.product,
  });

  Product product;

  factory Products.fromJson(Map<String, dynamic> json, int i) {
    return Products(
      product: Product.fromJson(json["products"][i]),
    );
  }
}

class Product {
  Product(
      {this.id,
      this.title,
      this.price,
      this.vendor,
      this.productType,
      this.status,
      this.variants,
      this.options,
      this.image,
      this.images,
      this.createdAt});

  int? id;
  String? title;
  double? price;
  String? vendor;
  String? productType;
  String? status;
  var variants;
  var options;
  var images;
  var image;
  var createdAt;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        price: double.parse(json['variants'][0]['price']),
        vendor: json['vendor'],
        productType: json['product_type'],
        image: json['image'],
        status: json['status'],
        variants: json['variants'],
        options: json['options'],
        images: json['images'],
        createdAt: json['created_at']);
  }
}
