import 'dart:convert';
import 'package:http/http.dart' as http;

// Define the Product model
class Product {
  final String name;

  Product({required this.name});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] as String,
      // Add more fields as needed based on the API response
    );
  }
}

// Define the FimbuServices class
class FimbuServices {
  static const BASE_URL = 'https://api.timbu.cloud/products';
  final String api_key;
  final String app_id;
  final String organization_id;

  FimbuServices(
      {required this.api_key,
      required this.app_id,
      required this.organization_id});

  Future<Product> getProduct() async {
    final response = await http.get(Uri.parse(
        '$BASE_URL?organization_id=$organization_id&Appid=$app_id&Apikey=$api_key'));
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get product');
    }
  }
}

void main() async {
  String apiKey = 'ca531c27aa9f48c990fd842ab72e105220240721145028236942';
  String appId = '0HH5OYDLR40WXRU';
  String organizationId = '538b7a24ddb14a8da774d77f4dd746d6';

  FimbuServices fimbuServices = FimbuServices(
    api_key: apiKey,
    app_id: appId,
    organization_id: organizationId,
  );

  try {
    Product product = await fimbuServices.getProduct();
    print('Product: ${product.name}');
  } catch (e) {
    print('Error: $e');
  }
}
