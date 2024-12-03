import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spare_ease/components/app_constants.dart';
import 'package:spare_ease/components/my_app_functions.dart';
import 'package:spare_ease/components/subtitle_text.dart';
import 'package:spare_ease/components/title_text.dart';
import 'package:spare_ease/models/product_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:spare_ease/pages/loginNsignup/components/validator.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key, this.productModel});
  final ProductModel? productModel;

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  final _formKey = GlobalKey<FormState>();
  XFile? _pickedImage;
  late TextEditingController _titleController,
      _priceController,
      _descriptionController,
      _quantityController;
  String? _categoryValue;
  String? _brandValue;

  bool isEditing = false;
  String? productNetworkImage;
  @override
  void initState() {
    if (widget.productModel != null) {
      isEditing = true;
      productNetworkImage = widget.productModel!.productImage;
      _categoryValue = widget.productModel!.productCategory;
      _brandValue = widget.productModel!.productBrand;
    }
    _titleController =
        TextEditingController(text: widget.productModel?.productTitle);
    _priceController =
        TextEditingController(text: widget.productModel?.productPrice);
    _descriptionController =
        TextEditingController(text: widget.productModel?.productDescription);
    _quantityController =
        TextEditingController(text: widget.productModel?.productQuantity);

    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void clearForm() {
    _titleController.clear();
    _priceController.clear();
    _descriptionController.clear();
    _quantityController.clear();
    removePickedImage();
  }

  void removePickedImage() {
    setState(() {
      _pickedImage = null;
      productNetworkImage = null;
    });
  }

  Future<void> _uploadProduct() async {
    if (_pickedImage == null) {
      MyAppFunctions.showErrorOrWarningDialog(
        context: context,
        subtitle: "Please pick up an image",
        fct: () {},
      );

      return;
    }
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {}
  }

  Future<void> _editProduct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (_pickedImage == null && productNetworkImage == null) {
      MyAppFunctions.showErrorOrWarningDialog(
        context: context,
        subtitle: "Please pick up an image",
        fct: () {},
      );
      return;
    }
    if (isValid) {}
  }

  Future<void> localImagePicker() async {
    final ImagePicker picker = ImagePicker();
    await MyAppFunctions.imagePickerDialog(
      context: context,
      cameraFCT: () async {
        _pickedImage = await picker.pickImage(source: ImageSource.camera);
        setState(() {});
      },
      galleryFCT: () async {
        _pickedImage = await picker.pickImage(source: ImageSource.gallery);
        setState(() {});
      },
      removeFCT: () {
        setState(() {
          _pickedImage = null;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        bottomSheet: SizedBox(
          height: kBottomNavigationBarHeight + 10,
          child: Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.clear),
                  label: const Text(
                    "Clear",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    clearForm();
                  },
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    // backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.upload),
                  label: Text(
                    isEditing ? "Edit Product" : "Upload Product",
                  ),
                  onPressed: () {
                    if (isEditing) {
                      _editProduct();
                    } else {
                      _uploadProduct();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: TitlesTextWidget(
            label: isEditing ? "Edit Product" : "Upload a new product",
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),

                // Image Picker
                if (isEditing && productNetworkImage != null) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      productNetworkImage!,
                      // width: size.width * 0.7,
                      height: size.width * 0.5,
                      alignment: Alignment.center,
                    ),
                  ),
                ] else if (_pickedImage == null) ...[
                  SizedBox(
                    width: size.width * 0.4 + 10,
                    height: size.width * 0.4,
                    child: DottedBorder(
                        child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.image_outlined,
                            size: 80,
                            color: Colors.blue,
                          ),
                          TextButton(
                            onPressed: () {
                              localImagePicker();
                            },
                            child: const Text("Pick Product Image"),
                          ),
                        ],
                      ),
                    )),
                  ),
                ] else ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(
                        _pickedImage!.path,
                      ),
                      // width: size.width * 0.7,
                      height: size.width * 0.5,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
                if (_pickedImage != null || productNetworkImage != null) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          localImagePicker();
                        },
                        child: const Text("Pick another image"),
                      ),
                      TextButton(
                        onPressed: () {
                          removePickedImage();
                        },
                        child: const Text(
                          "Remove image",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  )
                ],
                const SizedBox(
                  height: 25,
                ),

                // Category dropdown widget
                DropdownButton(
                    items: AppConstants2.categoriesDropDownList,
                    value: _categoryValue,
                    hint: const Text("Choose Category"),
                    onChanged: (String? value) {
                      setState(() {
                        _categoryValue = value;
                      });
                    }),
                const SizedBox(
                  height: 25,
                ),
                DropdownButton(
                    items: AppConstants2.brandsDropDownList,
                    value: _categoryValue,
                    hint: const Text("Choose Brand"),
                    onChanged: (String? value) {
                      setState(() {
                        _brandValue = value;
                      });
                    }),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _titleController,
                          key: const ValueKey('Title'),
                          maxLength: 80,
                          minLines: 1,
                          maxLines: 2,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          decoration: const InputDecoration(
                            hintText: 'Product Title',
                          ),
                          validator: (value) {
                            return MyValidators.uploadProdTexts(
                              value: value,
                              toBeReturnedString: "Please enter a valid title",
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: TextFormField(
                                controller: _priceController,
                                key: const ValueKey('Price \$'),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'^(\d+)?\.?\d{0,2}'),
                                  ),
                                ],
                                decoration: const InputDecoration(
                                    hintText: 'Price',
                                    prefix: SubtitleTextWidget(
                                      label: "\$ ",
                                      color: Colors.blue,
                                      fontSize: 16,
                                    )),
                                validator: (value) {
                                  return MyValidators.uploadProdTexts(
                                    value: value,
                                    toBeReturnedString: "Price is missing",
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 1,
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller: _quantityController,
                                keyboardType: TextInputType.number,
                                key: const ValueKey('Quantity'),
                                decoration: const InputDecoration(
                                  hintText: 'Qty',
                                ),
                                validator: (value) {
                                  return MyValidators.uploadProdTexts(
                                    value: value,
                                    toBeReturnedString: "Quantity is missed",
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          key: const ValueKey('Description'),
                          controller: _descriptionController,
                          minLines: 5,
                          maxLines: 8,
                          maxLength: 1000,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: const InputDecoration(
                            hintText: 'Product Description',
                          ),
                          validator: (value) {
                            return MyValidators.uploadProdTexts(
                              value: value,
                              toBeReturnedString: "Description is missed",
                            );
                          },
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: kBottomNavigationBarHeight + 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
