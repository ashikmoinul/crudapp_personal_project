import 'package:flutter/material.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  //Set the controller
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,  //makes state the form

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
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromWidth(double.maxFinite),

                      //padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      backgroundColor: Colors.pinkAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if(_formKey.currentState!.validate()){

                      }
                    },
                    child: const Text('Add'))
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose(){
    _nameTEController.dispose();
    _unitPriceTEController.dispose();
    _quantityTEController.dispose();
    _totalPriceTEController.dispose();
    _imageTEController.dispose();

  }
}
