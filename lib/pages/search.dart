import 'package:flutter/material.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:spare_ease/components/assets_manager.dart';
import 'package:spare_ease/components/product_widget.dart';
import 'package:spare_ease/components/title_text.dart';
import 'package:spare_ease/models/product_model.dart';
import 'package:spare_ease/providers/products_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static const routeName = '/SearchPage';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  List<ProductModel> productListSearch = [];

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    String? passedCategory =
        ModalRoute.of(context)!.settings.arguments as String?;
    List<ProductModel> productList = passedCategory == null
        ? productsProvider.products
        : productsProvider.findByCategory(categoryName: passedCategory);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AssetsManager.shoppingCart,
            ),
          ),
          title: TitlesTextWidget(label: passedCategory ?? "Search products"),
        ),
        body: productList.isEmpty
            ? const Center(child: TitlesTextWidget(label: "No product found"))
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      controller: searchTextController,
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            searchTextController.clear();
                          },
                          child: const Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      // onChanged: (value) {
                      //   // log("value of the text is $value");
                      // },
                      onSubmitted: (value) {
                        setState(() {
                          productListSearch = productsProvider.searchQuery(
                              searchText: searchTextController.text,
                              passedList: productList);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    if (searchTextController.text.isNotEmpty &&
                        productListSearch.isEmpty) ...[
                      const Center(
                        child: TitlesTextWidget(label: "No products found"),
                      ),
                    ],
                    Expanded(
                      child: DynamicHeightGridView(
                        itemCount: searchTextController.text.isNotEmpty
                            ? productListSearch.length
                            : productList.length,
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        builder: (context, index) {
                          return ProductWidget(
                            productId: searchTextController.text.isNotEmpty
                                ? productListSearch[index].productId
                                : productList[index].productId,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
