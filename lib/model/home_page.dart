import 'package:flutter/material.dart';
import 'package:practice_19/model/product_modal.dart';
import 'package:practice_19/screen/card_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModal> cartList = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Total cart item count  ${cartList.length}"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.2,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                shrinkWrap: true,
                itemCount: productList.length,
                itemBuilder: (context, index) => Container(
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 2.5,
                        child: Image.network(
                          "${productList[index].image}",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text("${productList[index].name}"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${productList[index].prize}"),
                          InkWell(
                            onTap: () {
                              try {
                                cartList.firstWhere((element) =>
                                    element.id == productList[index].id);
                                var snakeBar = SnackBar(
                                    content: Text("Already added this item"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snakeBar);
                              } catch (e) {
                                cartList.add(productList[index]);
                                setState(() {});
                              }
                            },
                            child: Icon(Icons.shopping_bag),
                          )
                        ],
                      ),
                      Text(
                        "${productList[index].details}",
                        style: TextStyle(),
                        maxLines: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MaterialButton(
                shape: Border.all(color: Colors.red),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CardPage(),
                    ),
                  );
                },
                child: Text("Go to card"),
                minWidth: double.infinity,
                color: Colors.red,
                height: size.height * 0.1),
          ],
        ),
      ),
    ));
  }
}
