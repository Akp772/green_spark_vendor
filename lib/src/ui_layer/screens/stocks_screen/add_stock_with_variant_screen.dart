import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/business_layer/providers/stocks_provider.dart';
import 'package:provider/provider.dart';

class AddStockWithVariantScreen extends StatefulWidget {
  const AddStockWithVariantScreen({Key? key}) : super(key: key);

  @override
  State<AddStockWithVariantScreen> createState() => _AddStockWithVariantScreenState();
}

class _AddStockWithVariantScreenState extends State<AddStockWithVariantScreen> {

  File? file;
  TextEditingController skuController = TextEditingController();
  TextEditingController stockQtyController = TextEditingController();
  TextEditingController purchasePriceController = TextEditingController();
  TextEditingController offerPriceController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  StocksProvider? stocksProvider;

  @override
  Widget build(BuildContext context) {
    stocksProvider = Provider.of<StocksProvider>(context,listen: true);
    return Container();
  }


  Future<void> _handleOnTap() async {
    String? res = await stocksProvider!.addStocksWithoutVariant(await _setRequest());

  }

  Future<FormData> _setRequest() async {
    return  FormData.fromMap({
      "product_id":9,
      "sku": skuController.text,
      "stock_qty": stockQtyController.text,
      "purchase_price": purchasePriceController.text,
      "price": priceController.text,
      "offer_price": offerPriceController.text,
      "featured_image": await MultipartFile.fromFile(file!.path),
    });
  }
}
