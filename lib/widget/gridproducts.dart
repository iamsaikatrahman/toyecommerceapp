import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:toyapp/data/products.dart';
import 'package:toyapp/widget/productdetailspage.dart';

class GridProducts extends StatelessWidget {
  const GridProducts({
    Key key,
    @required double screenHeight,
  })  : _screenHeight = screenHeight,
        super(key: key);

  final double _screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      child: Container(
        width: double.infinity,
        height: _screenHeight,
        child: StaggeredGridView.countBuilder(
          scrollDirection: Axis.vertical,
          crossAxisCount: 4,
          itemCount: toyproducts.length,
          itemBuilder: (BuildContext context, int index) {
            Products products = toyproducts[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsDetailsPage(
                      detailsProducts: products,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFEDE4C1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        products.imageUrl,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products.name,
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xFF19532F),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            products.shortdec,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                    //color: Color(0xFFF0F0F0),
                                    color: Color(0xFF19532F),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {},
                                    icon: products.isliked
                                        ? Icon(Icons.favorite)
                                        : Icon(Icons.favorite_border),
                                    iconSize: 25,
                                    color: products.isliked
                                        ? Colors.red
                                        : Colors.blueGrey,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF19532F),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        "\$${products.price}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 15.0,
        ),
      ),
    );
  }
}
