import 'package:flutter/material.dart';
import 'package:toyapp/data/products.dart';
import 'package:toyapp/widget/gridproducts.dart';
import 'package:toyapp/widget/homepage.dart';

class ProductsDetailsPage extends StatefulWidget {
  final Products detailsProducts;

  const ProductsDetailsPage({Key key, this.detailsProducts}) : super(key: key);

  @override
  _ProductsDetailsPageState createState() => _ProductsDetailsPageState();
}

class _ProductsDetailsPageState extends State<ProductsDetailsPage> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFAF4E1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFAF4E1),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF19532F),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomePage(),
              ),
            );
          },
        ),
        actions: [
          Container(
            width: 50,
            height: 30,
            decoration: BoxDecoration(
              color: Color(0xFF19532F),
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              child: Image.asset(widget.detailsProducts.imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.detailsProducts.name,
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF19532F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\$${widget.detailsProducts.price}",
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF19532F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.detailsProducts.shortdec,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.detailsProducts.eddition,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            buildOutlineButton(
                              icon: Icons.remove,
                              press: () {
                                if (numOfItems > 1) {
                                  setState(() {
                                    numOfItems--;
                                  });
                                }
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                // if our item is less  then 10 then  it shows 01 02 like that
                                numOfItems.toString().padLeft(2, "0"),
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            buildOutlineButton(
                                icon: Icons.add,
                                press: () {
                                  setState(() {
                                    numOfItems++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.detailsProducts.decription,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "More Like This",
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF19532F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GridProducts(screenHeight: _screenHeight)
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Container(
          width: double.infinity,
          height: 40,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            color: Color(0xFF19532F),
            onPressed: () {},
            child: Text(
              "Add to cart",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 25,
      height: 22,
      child: FlatButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
          side: BorderSide(
            color: Color(0xFF19532F),
          ),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
