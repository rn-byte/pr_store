import 'package:flutter/material.dart';

class LoadProduct extends StatefulWidget {
  const LoadProduct({super.key});

  @override
  _LoadProductState createState() => _LoadProductState();
}

class _LoadProductState extends State<LoadProduct> {
  final _formKey = GlobalKey<FormState>();

  // Controllers or Variables for Input Fields
  final TextEditingController idController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController skuController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  DateTime? selectedDate;
  final TextEditingController salePriceController = TextEditingController();
  final TextEditingController thumbnailController = TextEditingController();
  bool? isFeatured = false;
  final TextEditingController brandController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryIdController = TextEditingController();
  final TextEditingController imagesController = TextEditingController();
  final TextEditingController productTypeController = TextEditingController();
  final TextEditingController productAttributesController =
      TextEditingController();
  final TextEditingController productVariationsController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Input Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField("ID", idController),
              buildNumberField("Stock", stockController),
              buildTextField("SKU", skuController),
              buildNumberField("Price", priceController),
              buildTextField("Title", titleController),
              buildDatePicker(context),
              buildNumberField("Sale Price", salePriceController),
              buildTextField("Thumbnail URL", thumbnailController),
              buildSwitchField("Is Featured", isFeatured, (value) {
                setState(() {
                  isFeatured = value;
                });
              }),
              buildTextField("Brand", brandController),
              buildTextField("Description", descriptionController),
              buildTextField("Category ID", categoryIdController),
              buildTextField("Images (comma-separated URLs)", imagesController),
              buildTextField("Product Type", productTypeController),
              buildTextField("Product Attributes (JSON format)",
                  productAttributesController),
              buildTextField("Product Variations (JSON format)",
                  productVariationsController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission
                    print("Form Submitted");
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          }
          return null;
        },
      ),
    );
  }

  Widget buildNumberField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          }
          return null;
        },
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
              "Date: ${selectedDate?.toLocal().toString().split(' ')[0] ?? "Not Selected"}"),
          Spacer(),
          ElevatedButton(
            onPressed: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null && pickedDate != selectedDate) {
                setState(() {
                  selectedDate = pickedDate;
                });
              }
            },
            child: Text('Pick Date'),
          ),
        ],
      ),
    );
  }

  Widget buildSwitchField(
      String label, bool? value, Function(bool?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(label),
          Spacer(),
          Switch(
            value: value ?? false,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
