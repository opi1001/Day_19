import 'package:flutter/material.dart';
import 'package:practice_19/model/product_modal.dart';

class CardPage extends StatefulWidget {
  CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  List<ProductModal>? cartList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            // title: Text("Total item is ${widget.cartList.lenght}"),
            ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Container(
                child: Text("You choose any item"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
