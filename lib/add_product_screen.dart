import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  //Set the controller
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _productCodeTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _addNewProductInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey, //makes state the form

            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  controller: _nameTEController,
                  // Text by default that's why don't need the text-inputType

                  decoration: const InputDecoration(
                      hintText: 'Name', labelText: 'Name'),

                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Write your product name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _unitPriceTEController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Unit Price', labelText: 'Unit Price'),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Write your product price';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _productCodeTEController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: 'Product Code', labelText: 'Product Code'),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Write your product code';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _quantityTEController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Quantity', labelText: 'Quantity'),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Write your product quantity';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _totalPriceTEController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Total Price', labelText: 'Total Price'),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Write your total price';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  controller: _imageTEController,
                  //Image is a string type that's why it's remain optional

                  decoration: const InputDecoration(
                      hintText: 'Image', labelText: 'Image'),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Write your image';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // if(_addNewProductInProgress== true)
                //  const Center(
                //    child: CircularProgressIndicator() ,
                //  )
                // else
                //
                // ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       fixedSize: const Size.fromWidth(double.maxFinite),
                //
                //       //padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                //
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(16)),
                //       backgroundColor: Colors.pinkAccent,
                //       foregroundColor: Colors.white,
                //     ),
                //     onPressed: () {
                //       if (_formKey.currentState!.validate()) {
                //         _addProduct();
                //       }
                //     },
                //     child: const Text('Add'),
                // )
                //Todo: Add button in progress

                Visibility(
                  visible: _addNewProductInProgress == false,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _addProduct();
                      }
                    },
                    child: const Text('Add Product'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Future, async, await

  Future<void> _addProduct() async {
    _addNewProductInProgress = true; //Progress is start
    setState(() {});
    //Step 1: Set Url
    const String addNewProductUrl = 'https://crud.teamrabbil.com/create';

    //Step 2: Prepare Data
    Map<String, dynamic> inputData = {
      "Img": _imageTEController.text.trim(),
      "ProductCode": _productCodeTEController.text,
      "ProductName": _nameTEController.text,
      "Qty": _quantityTEController.text,
      "TotalPrice": _totalPriceTEController.text,
      "UnitPrice": _unitPriceTEController.text
    };

    //URI - Uniform Resource Identifier
    // Step 3: Parse
    Uri uri = Uri.parse(addNewProductUrl);

    //Step 4: Send Request
    Response response = await post(uri,
        body: jsonEncode(inputData),
        headers: {'content-type': 'application/json'});

    print(response.statusCode);
    print(response.body);
    print(response.headers);

    //Todo: Form Clean
    //Todo: Toast/ Snack bar message

    if(response.statusCode == 200){
      _nameTEController.clear();
      _unitPriceTEController.clear();
      _productCodeTEController.clear();
      _quantityTEController.clear();
      _totalPriceTEController.clear();
      _imageTEController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New Product Added'),
        ),
      );
      }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New Product Failed! Try Again'),
        ),
      );
    }

  }

  @override
  void dispose() {
    super.dispose();
    _nameTEController.dispose();
    _unitPriceTEController.dispose();
    _productCodeTEController.dispose();
    _quantityTEController.dispose();
    _totalPriceTEController.dispose();
    _imageTEController.dispose();
  }
}
