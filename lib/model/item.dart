class Item {
  String? itemName = '';
  int? qty = 0;
  String? unique = '';
  double? price = 0;
  String? cat1 = '';
  String? cat2 = '';
  String? cat3 = '';

  Item();

  Item.fromJson(Map<String, dynamic> json) {
    itemName = json["item_name"];
    qty = json["qty"];
    unique = json["unique"];
    price = json["price"];

    cat1 = json["cat1"];
    cat2 = json["cat2"];
    cat3 = json["cat3"];
  }

  Map<String, dynamic> toJson() => {
        "item_name": this.itemName,
        "qty": this.qty,
        "unique": this.unique,
        "price": this.price,
        "cat1": this.cat1,
        "cat2": this.cat2,
        "cat3": this.cat3,
      };

  String toString() {
    return "{item_name: '${reVal(itemName)}', qty: ${reVal(qty)}, unique: '${reVal(unique)}', price: ${reVal(price)}, cat1: '${reVal(cat1)}', cat2: '${reVal(cat2)}', cat3: '${reVal(cat3)}'}";
  }

  String? reVal(dynamic value) {
    if (value is String) {
      if (value.isEmpty) {
        return '';
      }
      return value.replaceAll("\"", "'").replaceAll("'", "\\'");
    } else {
      return value;
    }
  }
}
