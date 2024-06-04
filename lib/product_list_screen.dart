import 'dart:async';

import 'package:crudapp_personal_project/add_product_screen.dart';
import 'package:crudapp_personal_project/update_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool _getProductListInProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: Visibility(
        visible: _getProductListInProgress,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, int index) {
            return _buildProductItem();
          },
          separatorBuilder: (_, __) => const Divider(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddProductScreen(), //Route
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _getProductList() async {
    _getProductListInProgress = true;
    setState(() {});
    const String productListUrl =
        'https://crud.teamrabbil.com/api/v1/ReadProduct';
    Uri uri = Uri.parse(productListUrl);
    Response response = await get(uri);

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Get Product List Failed! Try Again'),
        ),
      );
    }
  }

  Widget _buildProductItem() {
    return ListTile(
      // leading: Image.network(
      //   'https://www.bing.com/images/search?view=detailV2&ccid=HGwGqH0h&id=2D96AF324228F57A88160AE697316CA90DF4E017&thid=OIP.HGwGqH0hwUuKQqWn40hjOgHaHa&mediaurl=https%3a%2f%2fstatic.vecteezy.com%2fsystem%2fresources%2fpreviews%2f000%2f420%2f681%2foriginal%2fpicture-icon-vector-illustration.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.1c6c06a87d21c14b8a42a5a7e348633a%3frik%3dF%252bD0DalsMZfmCg%26pid%3dImgRaw%26r%3d0&exph=5120&expw=5120&q=icon+picutre&simid=608001562680383538&FORM=IRPRST&ck=33E34C11DB8C7F83EA2FDBAED692FE5B&selectedIndex=0&itb=0&idpp=overlayview&ajaxhist=0&ajaxserp=0',
      //       height: 0.5,
      //       width: 0.3,
      // ),
      title: const Text('Product Name'),
      subtitle: const Wrap(
        children: [
          Text('Unit Price: 100'),
          Text('Quality: 100'),
          Text('Total Price: 10000')
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UpdateProductScreen(), //Route
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline_sharp),
            onPressed: () {
              _showDeleteConfirmationDialog();
            },
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Delete'),
            content: const Text(
                'Are you sure that you want to delete this product?'),
            actions: [
              TextButton(onPressed: () {}, child: const Text('Cancel')),
              TextButton(onPressed: () {}, child: const Text('Yes, Delete'))
            ],
          );
        });
  }
}

class Product {
  final String productName;
  final String productCode;
  final String image;
  final String unitPrice;
  final String quantity;
  final String totalPrice;

  Product(
      {required this.productName,
      required this.productCode,
      required this.image,
      required this.unitPrice,
      required this.quantity,
      required this.totalPrice});
}
