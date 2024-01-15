class ProductModel {
  String? searchTerm;
  String? categoryName;
  num? itemCount;
  String? redirectUrl;
  List<Products>? products;

  ProductModel(
      {this.searchTerm,
      this.categoryName,
      this.itemCount,
      this.redirectUrl,
      this.products});

  ProductModel.fromJson(Map<String, dynamic> json) {
    searchTerm = json['searchTerm'];
    categoryName = json['categoryName'];
    itemCount = json['itemCount'];
    redirectUrl = json['redirectUrl'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['searchTerm'] = this.searchTerm;
    data['categoryName'] = this.categoryName;
    data['itemCount'] = this.itemCount;
    data['redirectUrl'] = this.redirectUrl;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  num? id;
  String? name;
  Price? price;
  String? colour;
  num? colourWayId;
  String? brandName;
  bool? hasVariantColours;
  bool? hasMultiplePrices;
  var groupId;
  num? productCode;
  String? productType;
  String? url;
  String? imageUrl;
  List<String>? additionalImageUrls;
  String? videoUrl;
  bool? showVideo;
  bool? isSellingFast;

  Products({
    this.id,
    this.name,
    this.price,
    this.colour,
    this.colourWayId,
    this.brandName,
    this.hasVariantColours,
    this.hasMultiplePrices,
    this.groupId,
    this.productCode,
    this.productType,
    this.url,
    this.imageUrl,
    this.additionalImageUrls,
    this.videoUrl,
    this.showVideo,
    this.isSellingFast,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    colour = json['colour'];
    colourWayId = json['colourWayId'];
    brandName = json['brandName'];
    hasVariantColours = json['hasVariantColours'];
    hasMultiplePrices = json['hasMultiplePrices'];
    groupId = json['groupId'];
    productCode = json['productCode'];
    productType = json['productType'];
    url = json['url'];
    imageUrl = json['imageUrl'];
    additionalImageUrls = json['additionalImageUrls'].cast<String>();
    videoUrl = json['videoUrl'];
    showVideo = json['showVideo'];
    isSellingFast = json['isSellingFast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['colour'] = this.colour;
    data['colourWayId'] = this.colourWayId;
    data['brandName'] = this.brandName;
    data['hasVariantColours'] = this.hasVariantColours;
    data['hasMultiplePrices'] = this.hasMultiplePrices;
    data['groupId'] = this.groupId;
    data['productCode'] = this.productCode;
    data['productType'] = this.productType;
    data['url'] = this.url;
    data['imageUrl'] = this.imageUrl;
    data['additionalImageUrls'] = this.additionalImageUrls;
    data['videoUrl'] = this.videoUrl;
    data['showVideo'] = this.showVideo;
    data['isSellingFast'] = this.isSellingFast;
    return data;
  }
}

class Price {
  Current? current;
  Previous? previous;
  Rrp? rrp;
  bool? isMarkedDown;
  bool? isOutletPrice;
  String? currency;

  Price(
      {this.current,
      this.previous,
      this.rrp,
      this.isMarkedDown,
      this.isOutletPrice,
      this.currency});

  Price.fromJson(Map<String, dynamic> json) {
    current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
    previous = json['previous'] != null
        ? new Previous.fromJson(json['previous'])
        : null;
    rrp = json['rrp'] != null ? new Rrp.fromJson(json['rrp']) : null;
    isMarkedDown = json['isMarkedDown'];
    isOutletPrice = json['isOutletPrice'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    if (this.previous != null) {
      data['previous'] = this.previous!.toJson();
    }
    if (this.rrp != null) {
      data['rrp'] = this.rrp!.toJson();
    }
    data['isMarkedDown'] = this.isMarkedDown;
    data['isOutletPrice'] = this.isOutletPrice;
    data['currency'] = this.currency;
    return data;
  }
}

class Current {
  num? value;
  String? text;

  Current({this.value, this.text});

  Current.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    return data;
  }
}

class Previous {
  num? value;
  String? text;

  Previous({this.value, this.text});

  Previous.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    return data;
  }
}

class Rrp {
  String? value;
  String? text;

  Rrp({this.value, this.text});

  Rrp.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    return data;
  }
}
