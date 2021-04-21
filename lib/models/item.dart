class CartItem{

  String _cid;
  String _productId;
  String _productName;
  String _productUnit;
  String _productQty;
  String _productPrice;
  String _productImage;

  CartItem(this._cid, this._productId, this._productName, this._productUnit,      this._productQty, this._productPrice, this._productImage);

  String get productImage => _productImage;

  set productImage(String value) {
    _productImage = value;
  }

  String get productPrice => _productPrice;

  set productPrice(String value) {
    _productPrice = value;
  }

  String get productQty => _productQty;

  set productQty(String value) {
    _productQty = value;
  }

  String get productUnit => _productUnit;

  set productUnit(String value) {
    _productUnit = value;
  }

  String get productName => _productName;

  set productName(String value) {
    _productName = value;
  }

  String get productId => _productId;

  set productId(String value) {
    _productId = value;
  }

  String get cid => _cid;

  set cid(String value) {
    _cid = value;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map['cid'] = _cid;
    map['productId'] = _productId;
    map['productName'] = _productName;
    map['productUnit'] = _productUnit;
    map['productQty'] = _productQty;
    map['productPrice'] = _productPrice;
    map['productImage'] = _productImage;
    return map;
  }

  CartItem.fromMap(Map<String, dynamic> map){
    this._cid = map['cid'];
    this._productId = map['productId'];
    this._productName = map['productName'];
    this._productUnit = map['productUnit'];
    this._productQty = map['productQty'];
    this._productPrice = map['productPrice'];
    this._productImage = map['productImage'];
  }

}