class CartModel {
  int? id;
  String? name;
  String? brand;
  String? image;
  int? qty;
  int? size;
  num? price;

  CartModel(
      {this.id,
      this.name,
      this.brand,
      this.qty,
      this.size,
      this.price,
      this.image});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    brand = json['brand'];
    image = json['image'];
    qty = json['qty'];
    size = json['size'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['brand'] = this.brand;
    data['image'] = this.image;
    data['qty'] = this.qty;
    data['size'] = this.size;
    data['price'] = this.price;
    return data;
  }
}
