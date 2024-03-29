class ProductDetailModel {
  num? id;
  String? name;
  String? description;
  List<AlternateNames>? alternateNames;
  List<LocalisedData>? localisedData;
  String? gender;
  String? productCode;
  String? pdpLayout;
  Brand? brand;
  String? sizeGuide;
  String? sizeGuideApiUrl;
  bool? isNoSize;
  bool? isOneSize;
  bool? isInStock;
  bool? hasVariantsWithProp65Risk;
  List<Variants>? variants;
  Media? media;
  Info? info;
  Price? price;
  String? baseUrl;

  ProductDetailModel(
      {this.id,
      this.name,
      this.description,
      this.alternateNames,
      this.localisedData,
      this.gender,
      this.productCode,
      this.pdpLayout,
      this.brand,
      this.sizeGuide,
      this.sizeGuideApiUrl,
      this.isNoSize,
      this.isOneSize,
      this.isInStock,
      this.hasVariantsWithProp65Risk,
      this.variants,
      this.media,
      this.info,
      this.price,
      this.baseUrl});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    if (json['alternateNames'] != null) {
      alternateNames = <AlternateNames>[];
      json['alternateNames'].forEach((v) {
        alternateNames!.add(new AlternateNames.fromJson(v));
      });
    }
    if (json['localisedData'] != null) {
      localisedData = <LocalisedData>[];
      json['localisedData'].forEach((v) {
        localisedData!.add(new LocalisedData.fromJson(v));
      });
    }
    gender = json['gender'];
    productCode = json['productCode'];
    pdpLayout = json['pdpLayout'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    sizeGuide = json['sizeGuide'];
    sizeGuideApiUrl = json['sizeGuideApiUrl'];
    isNoSize = json['isNoSize'];
    isOneSize = json['isOneSize'];
    isInStock = json['isInStock'];
    hasVariantsWithProp65Risk = json['hasVariantsWithProp65Risk'];

    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;

    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    baseUrl = json['baseUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.alternateNames != null) {
      data['alternateNames'] =
          this.alternateNames!.map((v) => v.toJson()).toList();
    }
    if (this.localisedData != null) {
      data['localisedData'] =
          this.localisedData!.map((v) => v.toJson()).toList();
    }
    data['gender'] = this.gender;
    data['productCode'] = this.productCode;
    data['pdpLayout'] = this.pdpLayout;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    data['sizeGuide'] = this.sizeGuide;
    data['sizeGuideApiUrl'] = this.sizeGuideApiUrl;
    data['isNoSize'] = this.isNoSize;
    data['isOneSize'] = this.isOneSize;
    data['isInStock'] = this.isInStock;
    data['hasVariantsWithProp65Risk'] = this.hasVariantsWithProp65Risk;

    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    if (this.media != null) {
      data['media'] = this.media!.toJson();
    }

    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }

    data['baseUrl'] = this.baseUrl;
    return data;
  }
}

class AlternateNames {
  String? locale;
  String? title;

  AlternateNames({this.locale, this.title});

  AlternateNames.fromJson(Map<String, dynamic> json) {
    locale = json['locale'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locale'] = this.locale;
    data['title'] = this.title;
    return data;
  }
}

class LocalisedData {
  String? locale;
  String? title;
  String? pdpUrl;

  LocalisedData({this.locale, this.title, this.pdpUrl});

  LocalisedData.fromJson(Map<String, dynamic> json) {
    locale = json['locale'];
    title = json['title'];
    pdpUrl = json['pdpUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locale'] = this.locale;
    data['title'] = this.title;
    data['pdpUrl'] = this.pdpUrl;
    return data;
  }
}

class Brand {
  num? brandId;
  String? name;
  String? description;

  Brand({this.brandId, this.name, this.description});

  Brand.fromJson(Map<String, dynamic> json) {
    brandId = json['brandId'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brandId'] = this.brandId;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

class Variants {
  num? id;
  String? name;
  num? sizeId;
  String? brandSize;
  String? sizeDescription;
  String? displaySizeText;
  num? sizeOrder;
  String? sku;
  bool? isLowInStock;
  bool? isInStock;
  bool? isAvailable;
  num? colourWayId;
  String? colourCode;
  String? colour;
  Price? price;
  bool? isPrimary;
  bool? isProp65Risk;
  String? ean;
  String? seller;

  Variants(
      {this.id,
      this.name,
      this.sizeId,
      this.brandSize,
      this.sizeDescription,
      this.displaySizeText,
      this.sizeOrder,
      this.sku,
      this.isLowInStock,
      this.isInStock,
      this.isAvailable,
      this.colourWayId,
      this.colourCode,
      this.colour,
      this.price,
      this.isPrimary,
      this.isProp65Risk,
      this.ean,
      this.seller});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sizeId = json['sizeId'];
    brandSize = json['brandSize'];
    sizeDescription = json['sizeDescription'];
    displaySizeText = json['displaySizeText'];
    sizeOrder = json['sizeOrder'];
    sku = json['sku'];
    isLowInStock = json['isLowInStock'];
    isInStock = json['isInStock'];
    isAvailable = json['isAvailable'];
    colourWayId = json['colourWayId'];
    colourCode = json['colourCode'];
    colour = json['colour'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    isPrimary = json['isPrimary'];
    isProp65Risk = json['isProp65Risk'];
    ean = json['ean'];
    seller = json['seller'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sizeId'] = this.sizeId;
    data['brandSize'] = this.brandSize;
    data['sizeDescription'] = this.sizeDescription;
    data['displaySizeText'] = this.displaySizeText;
    data['sizeOrder'] = this.sizeOrder;
    data['sku'] = this.sku;
    data['isLowInStock'] = this.isLowInStock;
    data['isInStock'] = this.isInStock;
    data['isAvailable'] = this.isAvailable;
    data['colourWayId'] = this.colourWayId;
    data['colourCode'] = this.colourCode;
    data['colour'] = this.colour;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['isPrimary'] = this.isPrimary;
    data['isProp65Risk'] = this.isProp65Risk;
    data['ean'] = this.ean;
    data['seller'] = this.seller;
    return data;
  }
}

class Price {
  Current? current;
  Current? previous;
  Rrp? rrp;
  Xrp? xrp;
  String? currency;
  bool? isMarkedDown;
  bool? isOutletPrice;
  String? startDateTime;

  Price({
    this.current,
    this.previous,
    this.rrp,
    this.xrp,
    this.currency,
    this.isMarkedDown,
    this.isOutletPrice,
    this.startDateTime,
  });

  Price.fromJson(Map<String, dynamic> json) {
    current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
    previous = json['previous'] != null
        ? new Current.fromJson(json['previous'])
        : null;
    rrp = json['rrp'] != null ? new Rrp.fromJson(json['rrp']) : null;
    xrp = json['xrp'] != null ? new Xrp.fromJson(json['xrp']) : null;
    currency = json['currency'];
    isMarkedDown = json['isMarkedDown'];
    isOutletPrice = json['isOutletPrice'];
    startDateTime = json['startDateTime'];
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
    if (this.xrp != null) {
      data['xrp'] = this.xrp!.toJson();
    }
    data['currency'] = this.currency;
    data['isMarkedDown'] = this.isMarkedDown;
    data['isOutletPrice'] = this.isOutletPrice;
    data['startDateTime'] = this.startDateTime;

    return data;
  }
}

class Current {
  num? value;
  String? text;
  String? versionId;
  String? conversionId;

  Current({this.value, this.text, this.versionId, this.conversionId});

  Current.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
    versionId = json['versionId'];
    conversionId = json['conversionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    data['versionId'] = this.versionId;
    data['conversionId'] = this.conversionId;
    return data;
  }
}

class Rrp {
  Null? value;
  Null? text;
  String? versionId;
  String? conversionId;

  Rrp({this.value, this.text, this.versionId, this.conversionId});

  Rrp.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
    versionId = json['versionId'];
    conversionId = json['conversionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    data['versionId'] = this.versionId;
    data['conversionId'] = this.conversionId;
    return data;
  }
}

class Xrp {
  num? value;
  String? text;
  String? versionId;
  String? conversionId;

  Xrp({this.value, this.text, this.versionId, this.conversionId});

  Xrp.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
    versionId = json['versionId'];
    conversionId = json['conversionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    data['versionId'] = this.versionId;
    data['conversionId'] = this.conversionId;
    return data;
  }
}

class Media {
  List<Images>? images;

  Media({this.images});

  Media.fromJson(Map<String, dynamic> json) {
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? url;
  String? type;
  num? colourWayId;
  String? colourCode;
  String? colour;
  bool? isPrimary;

  Images(
      {this.url,
      this.type,
      this.colourWayId,
      this.colourCode,
      this.colour,
      this.isPrimary});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    type = json['type'];
    colourWayId = json['colourWayId'];
    colourCode = json['colourCode'];
    colour = json['colour'];
    isPrimary = json['isPrimary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['type'] = this.type;
    data['colourWayId'] = this.colourWayId;
    data['colourCode'] = this.colourCode;
    data['colour'] = this.colour;
    data['isPrimary'] = this.isPrimary;
    return data;
  }
}

class Info {
  String? aboutMe;
  Null? sizeAndFit;
  String? careInfo;

  Info({this.aboutMe, this.sizeAndFit, this.careInfo});

  Info.fromJson(Map<String, dynamic> json) {
    aboutMe = json['aboutMe'];
    sizeAndFit = json['sizeAndFit'];
    careInfo = json['careInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aboutMe'] = this.aboutMe;
    data['sizeAndFit'] = this.sizeAndFit;
    data['careInfo'] = this.careInfo;
    return data;
  }
}

class ProductType {
  num? id;
  String? name;

  ProductType({this.id, this.name});

  ProductType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class PlpIds {
  num? id;
  String? type;

  PlpIds({this.id, this.type});

  PlpIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}
