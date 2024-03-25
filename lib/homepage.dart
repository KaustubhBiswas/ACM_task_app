import 'package:acm_task_app/controllers/product_controller.dart';
import 'package:acm_task_app/product_tile.dart';
import 'package:acm_task_app/sidenavbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {

  final User user;

  const HomePage({Key? key, required this.user}): super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeightPercentage = 0.09;
    
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
        primary: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * appBarHeightPercentage),
          child: Container(
              width: double.maxFinite,
              height: screenHeight * appBarHeightPercentage,
              clipBehavior: Clip.antiAlias,
              decoration: const ShapeDecoration(
                color: Color(0xFF4F709C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      print('SideNavBar Button Pressed');
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    icon: Icon(Icons.menu),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 110),
                    child: Text(
                      'Home Page',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ], //children
              )),
        ),
      ),
      drawer: SideNavBar(user: widget.user),
      body: GetBuilder<ProductController>(
        builder: (productController) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 11,
          mainAxisSpacing: 11),
          itemCount: productController.productList.length,
        itemBuilder: (context, index){
          print('Building ProoductTile for ${productController.productList[index].name}');
          return ProductTile(productController.productList[index]);
        }),)
    );
  }
}