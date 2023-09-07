import 'dart:convert';

class OrderModel {
  final int? id;
  final int? parentId;
  final String? status;
  final String? currency;
  final String? version;
  final bool? pricesIncludeTax;
  final DateTime? dateCreated;
  final DateTime? dateModified;
  final String? discountTotal;
  final String? discountTax;
  final String? shippingTotal;
  final String? shippingTax;
  final String? cartTax;
  final String? total;
  final String? totalTax;
  final int? customerId;
  final String? orderKey;
  final Ing? billing;
  final Ing? shipping;
  final String? paymentMethod;
  final String? paymentMethodTitle;
  final String? transactionId;
  final String? customerIpAddress;
  final String? customerUserAgent;
  final String? createdVia;
  final String? customerNote;
  final dynamic dateCompleted;
  final DateTime? datePaid;
  final String? cartHash;
  final String? number;
  final List<LineItem>? lineItems;
  final List<dynamic>? taxLines;
  final List<ShippingLine>? shippingLines;
  final List<dynamic>? feeLines;
  final List<dynamic>? couponLines;
  final List<dynamic>? refunds;

  OrderModel({
    this.id,
    this.parentId,
    this.status,
    this.currency,
    this.version,
    this.pricesIncludeTax,
    this.dateCreated,
    this.dateModified,
    this.discountTotal,
    this.discountTax,
    this.shippingTotal,
    this.shippingTax,
    this.cartTax,
    this.total,
    this.totalTax,
    this.customerId,
    this.orderKey,
    this.billing,
    this.shipping,
    this.paymentMethod,
    this.paymentMethodTitle,
    this.transactionId,
    this.customerIpAddress,
    this.customerUserAgent,
    this.createdVia,
    this.customerNote,
    this.dateCompleted,
    this.datePaid,
    this.cartHash,
    this.number,
    this.lineItems,
    this.taxLines,
    this.shippingLines,
    this.feeLines,
    this.couponLines,
    this.refunds,
  });

  factory OrderModel.fromRawJson(String str) =>
      OrderModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        parentId: json["parent_id"],
        status: json["status"],
        currency: json["currency"],
        version: json["version"],
        pricesIncludeTax: json["prices_include_tax"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
        dateModified: json["date_modified"] == null
            ? null
            : DateTime.parse(json["date_modified"]),
        discountTotal: json["discount_total"],
        discountTax: json["discount_tax"],
        shippingTotal: json["shipping_total"],
        shippingTax: json["shipping_tax"],
        cartTax: json["cart_tax"],
        total: json["total"],
        totalTax: json["total_tax"],
        customerId: json["customer_id"],
        orderKey: json["order_key"],
        billing: json["billing"] == null ? null : Ing.fromJson(json["billing"]),
        shipping:
            json["shipping"] == null ? null : Ing.fromJson(json["shipping"]),
        paymentMethod: json["payment_method"],
        paymentMethodTitle: json["payment_method_title"],
        transactionId: json["transaction_id"],
        customerIpAddress: json["customer_ip_address"],
        customerUserAgent: json["customer_user_agent"],
        createdVia: json["created_via"],
        customerNote: json["customer_note"],
        dateCompleted: json["date_completed"],
        datePaid: json["date_paid"] == null
            ? null
            : DateTime.parse(json["date_paid"]),
        cartHash: json["cart_hash"],
        number: json["number"],
        lineItems: json["line_items"] == null
            ? []
            : List<LineItem>.from(
                json["line_items"]!.map((x) => LineItem.fromJson(x))),
        taxLines: json["tax_lines"] == null
            ? []
            : List<dynamic>.from(json["tax_lines"]!.map((x) => x)),
        shippingLines: json["shipping_lines"] == null
            ? []
            : List<ShippingLine>.from(
                json["shipping_lines"]!.map((x) => ShippingLine.fromJson(x))),
        feeLines: json["fee_lines"] == null
            ? []
            : List<dynamic>.from(json["fee_lines"]!.map((x) => x)),
        couponLines: json["coupon_lines"] == null
            ? []
            : List<dynamic>.from(json["coupon_lines"]!.map((x) => x)),
        refunds: json["refunds"] == null
            ? []
            : List<dynamic>.from(json["refunds"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "status": status,
        "currency": currency,
        "version": version,
        "prices_include_tax": pricesIncludeTax,
        "date_created": dateCreated?.toIso8601String(),
        "date_modified": dateModified?.toIso8601String(),
        "discount_total": discountTotal,
        "discount_tax": discountTax,
        "shipping_total": shippingTotal,
        "shipping_tax": shippingTax,
        "cart_tax": cartTax,
        "total": total,
        "total_tax": totalTax,
        "customer_id": customerId,
        "order_key": orderKey,
        "billing": billing?.toJson(),
        "shipping": shipping?.toJson(),
        "payment_method": paymentMethod,
        "payment_method_title": paymentMethodTitle,
        "transaction_id": transactionId,
        "customer_ip_address": customerIpAddress,
        "customer_user_agent": customerUserAgent,
        "created_via": createdVia,
        "customer_note": customerNote,
        "date_completed": dateCompleted,
        "date_paid": datePaid?.toIso8601String(),
        "cart_hash": cartHash,
        "number": number,
        "line_items": lineItems == null
            ? []
            : List<dynamic>.from(lineItems!.map((x) => x.toJson())),
        "tax_lines":
            taxLines == null ? [] : List<dynamic>.from(taxLines!.map((x) => x)),
        "shipping_lines": shippingLines == null
            ? []
            : List<dynamic>.from(shippingLines!.map((x) => x.toJson())),
        "fee_lines":
            feeLines == null ? [] : List<dynamic>.from(feeLines!.map((x) => x)),
        "coupon_lines": couponLines == null
            ? []
            : List<dynamic>.from(couponLines!.map((x) => x)),
        "refunds":
            refunds == null ? [] : List<dynamic>.from(refunds!.map((x) => x)),
      };
}

class Ing {
  final String? firstName;
  final String? lastName;
  final String? company;
  final String? address1;
  final String? address2;
  final String? city;
  final String? state;
  final String? postcode;
  final String? country;
  final String? email;
  final String? phone;

  Ing({
    this.firstName,
    this.lastName,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.email,
    this.phone,
  });

  factory Ing.fromRawJson(String str) => Ing.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ing.fromJson(Map<String, dynamic> json) => Ing(
        firstName: json["first_name"],
        lastName: json["last_name"],
        company: json["company"],
        address1: json["address_1"],
        address2: json["address_2"],
        city: json["city"],
        state: json["state"],
        postcode: json["postcode"],
        country: json["country"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "company": company,
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "state": state,
        "postcode": postcode,
        "country": country,
        "email": email,
        "phone": phone,
      };
}

class LineItem {
  final int? id;
  final String? name;
  final int? productId;
  final int? variationId;
  final int? quantity;
  final String? taxClass;
  final String? subtotal;
  final String? subtotalTax;
  final String? total;
  final String? totalTax;
  final String? sku;
  final String? price;
  final Images? image;
  final List<MetaDatum>? metaData;
  final dynamic parentName;

  LineItem(
      {this.id,
      this.name,
      this.productId,
      this.variationId,
      this.quantity,
      this.taxClass,
      this.subtotal,
      this.subtotalTax,
      this.total,
      this.totalTax,
      this.sku,
      this.price,
      this.image,
      this.parentName,
      this.metaData});

  factory LineItem.fromRawJson(String str) =>
      LineItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
        id: json["id"],
        name: json["name"],
        productId: json["product_id"],
        variationId: json["variation_id"],
        quantity: json["quantity"],
        taxClass: json["tax_class"],
        subtotal: json["subtotal"],
        subtotalTax: json["subtotal_tax"],
        total: json["total"],
        totalTax: json["total_tax"],
        sku: json["sku"],
        price: json["price"].toString(),
        image: json["image"] == null ? null : Images.fromJson(json["image"]),
        parentName: json["parent_name"],
        metaData: json["meta_data"] == null
            ? []
            : List<MetaDatum>.from(
                json["meta_data"]!.map((x) => MetaDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "product_id": productId,
        "variation_id": variationId,
        "quantity": quantity,
        "tax_class": taxClass,
        "subtotal": subtotal,
        "subtotal_tax": subtotalTax,
        "total": total,
        "total_tax": totalTax,
        "sku": sku,
        "price": price,
        "image": image?.toJson(),
        "parent_name": parentName,
        "meta_data": metaData == null
            ? []
            : List<dynamic>.from(metaData!.map((x) => x.toJson())),
      };
}

class Images {
  final String? id;
  final String? src;

  Images({
    this.id,
    this.src,
  });

  factory Images.fromRawJson(String str) => Images.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"].toString(),
        src: json["src"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "src": src,
      };
}

class MetaDatum {
  final int? id;
  final String? key;
  final String? value;
  final String? displayKey;
  final String? displayValue;

  MetaDatum({
    this.id,
    this.key,
    this.value,
    this.displayKey,
    this.displayValue,
  });

  factory MetaDatum.fromRawJson(String str) =>
      MetaDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
        id: json["id"],
        key: json["key"],
        value: json["value"],
        displayKey: json["display_key"],
        displayValue: json["display_value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "value": value,
        "display_key": displayKey,
        "display_value": displayValue,
      };
}

class Links {
  final List<Collection>? self;
  final List<Collection>? collection;
  final List<Collection>? customer;

  Links({
    this.self,
    this.collection,
    this.customer,
  });

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null
            ? []
            : List<Collection>.from(
                json["self"]!.map((x) => Collection.fromJson(x))),
        collection: json["collection"] == null
            ? []
            : List<Collection>.from(
                json["collection"]!.map((x) => Collection.fromJson(x))),
        customer: json["customer"] == null
            ? []
            : List<Collection>.from(
                json["customer"]!.map((x) => Collection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": self == null
            ? []
            : List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": collection == null
            ? []
            : List<dynamic>.from(collection!.map((x) => x.toJson())),
        "customer": customer == null
            ? []
            : List<dynamic>.from(customer!.map((x) => x.toJson())),
      };
}

class Collection {
  final String? href;

  Collection({
    this.href,
  });

  factory Collection.fromRawJson(String str) =>
      Collection.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class ShippingLine {
  final int? id;
  final String? methodTitle;
  final String? methodId;
  final String? instanceId;
  final String? total;
  final String? totalTax;
  final List<dynamic>? taxes;
  final List<dynamic>? metaData;

  ShippingLine({
    this.id,
    this.methodTitle,
    this.methodId,
    this.instanceId,
    this.total,
    this.totalTax,
    this.taxes,
    this.metaData,
  });

  factory ShippingLine.fromRawJson(String str) =>
      ShippingLine.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ShippingLine.fromJson(Map<String, dynamic> json) => ShippingLine(
        id: json["id"],
        methodTitle: json["method_title"],
        methodId: json["method_id"],
        instanceId: json["instance_id"],
        total: json["total"],
        totalTax: json["total_tax"],
        taxes: json["taxes"] == null
            ? []
            : List<dynamic>.from(json["taxes"]!.map((x) => x)),
        metaData: json["meta_data"] == null
            ? []
            : List<dynamic>.from(json["meta_data"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "method_title": methodTitle,
        "method_id": methodId,
        "instance_id": instanceId,
        "total": total,
        "total_tax": totalTax,
        "taxes": taxes == null ? [] : List<dynamic>.from(taxes!.map((x) => x)),
        "meta_data":
            metaData == null ? [] : List<dynamic>.from(metaData!.map((x) => x)),
      };
}
