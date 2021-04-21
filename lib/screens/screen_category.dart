import 'dart:convert';
import 'dart:io';
import 'package:Mumbai_Dabbawala/models/item.dart';
import 'package:Mumbai_Dabbawala/models/product.dart';
import 'package:Mumbai_Dabbawala/values/app_colors.dart';
import 'package:Mumbai_Dabbawala/widgets/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ScreenCategory extends StatefulWidget {
  final String cid, title;

  const ScreenCategory({Key key, this.cid, this.title}) : super(key: key);

  @override
  _ScreenCategoryState createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  // DatabaseHelper databaseHelper = new DatabaseHelper();

  List<Product> products;
  List<Product> mainProducts;

  List<CartItem> items = List<CartItem>();

  TextEditingController _searchQuery;
  bool _isSearching = false;
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100)).then((_) {
      _searchQuery = new TextEditingController();
      // _showDig();
      loadData();
    });
  }

  // _showDig() {
  //   Dialogs.showLoadingDialog(context, _keyLoader);
  // }

  // gotoProductDetails(String id, String title, String cid) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => ScreenProduct(
  //         pid: id,
  //         title: title,
  //         cid: cid,
  //       ),
  //     ),
  //   );
  // }

  // addToCart(Product product) async {
  //   bool isAdded = await databaseHelper.isItemExist(
  //     product.productId,
  //     product.productUnit,
  //   );
  //   if (!isAdded) {
  //     var result = await databaseHelper.insertItem(
  //       new CartItem(
  //           'CART',
  //           product.productId,
  //           product.productName,
  //           product.productUnit,
  //           '1',
  //           product.productPrice,
  //           product.productImageName),
  //     );
  //     if (result > 0) {
  //       loadCount();
  //     }
  //   }
  // }

  bool getIsCart(String picm, String unit) {
    if (items == null || items.length <= 0) {
      return false;
    } else {
      var over =
          items.where((i) => i.productId == picm && i.productUnit == unit);
      if (over.length >= 1) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<void> loadData() async {
    if (widget.cid == "") {
      var res = await http
          .get("http://jugaadapp.microhind.com/apib/api.php?category_id");
      products = productFromJson(res.body);
      mainProducts = productFromJson(res.body);
    } else {
      var res = await http.get(
          "http://jugaadapp.microhind.com/apib/api.php?category_id=${widget.cid}");
      products = productFromJson(res.body);
      mainProducts = productFromJson(res.body);
    }
    Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
    setState(() {
      // loadCount();
    });
  }

  // Future<void> loadCount() async {
  //   items = await databaseHelper.getItemList();
  //   setState(() {});
  // }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(new LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    print("close search box");
    setState(() {
      _searchQuery.clear();
      updateSearchQuery("");
    });
  }

  void updateSearchQuery(String newQuery) {
    if (newQuery.length > 1) {
      products = mainProducts
          .where((prd) =>
              prd.productName.toLowerCase().contains(newQuery.toLowerCase()))
          .toList();
    } else {
      products = mainProducts.toList();
    }
    setState(() {
      searchQuery = newQuery;
    });
    print("search query " + newQuery);
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        new IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQuery == null || _searchQuery.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      new IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  Widget _buildSearchField() {
    return new TextField(
      controller: _searchQuery,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white30),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: updateSearchQuery,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_bg,
      appBar: AppBar(
        backgroundColor: AppColors.color_primary,
        leading: _isSearching ? const BackButton() : null,
        title: _isSearching
            ? _buildSearchField()
            : AppText(
                widget.title == "" ? "Category" : widget.title,
                "Poppins",
                20.0,
                false,
                AppColors.color_white,
              ),
        actions: _buildActions(),
      ),
      body: ListView(
        children: <Widget>[
          products == null
              ? Container(
                  margin: EdgeInsets.all(22.0),
                  child: Column(
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/empty.png'),
                        width: 80,
                        height: 80,
                      ),
                      Text("No products.")
                    ],
                  ),
                )
              : products.length <= 0
                  ? Container(
                      margin: EdgeInsets.all(22.0),
                      child: Column(
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/images/empty.png'),
                            width: 80,
                            height: 80,
                          ),
                          Text("No orders yet.")
                        ],
                      ),
                    )
                  : Container(
                      child: SingleChildScrollView(
                        physics: ScrollPhysics(),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 6.0, horizontal: 12.0),
                              child: GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.color_white,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: FadeInImage.assetNetwork(
                                          placeholder:
                                              'assets/images/placeholder.png',
                                          image:
                                              'http://jugaadapp.microhind.com/upload/product/${products[index].productImageName}',
                                          width: 62,
                                          height: 62,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: 140,
                                              child: Text(
                                                "${products[index].productName}",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "Poppins",
                                                  color: AppColors
                                                      .color_text_primary,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "${products[index].categoryName}",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: "Poppins",
                                                color:
                                                    AppColors.color_text_assent,
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  "₹ ${products[index].productPrice}",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: "Poppins",
                                                    color: AppColors
                                                        .color_text_assent,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        AppColors.color_white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.0),
                                                    border: Border.all(
                                                        color: AppColors
                                                            .color_assent),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text(
                                                      "${products[index].productUnit}",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily: "Poppins",
                                                        color: AppColors
                                                            .color_assent,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      getIsCart(products[index].productId,
                                              products[index].productUnit)
                                          ? Container(
                                              margin:
                                                  EdgeInsets.only(right: 12.0),
                                              decoration: BoxDecoration(
                                                color: AppColors.color_assent,
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "In Cart",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: "Poppins",
                                                    color:
                                                        AppColors.color_white,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : GestureDetector(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    right: 12.0),
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColors.color_primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Add",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "Poppins",
                                                      color:
                                                          AppColors.color_white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // onTap: () => addToCart(
                                              //   products[index],
                                              // ),
                                            )
                                    ],
                                  ),
                                ),
                                // onTap: () => gotoProductDetails(
                                //   products[index].productId,
                                //   products[index].productName,
                                //   products[index].categoryId,
                                // ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
        ],
      ),
    );
  }
}
