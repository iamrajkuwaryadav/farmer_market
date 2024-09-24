import 'package:crunchshop/core/values/local_files.dart';

class ProductModel {
  final String productTitle;
  final String price;
  final double ratingCount;
  final int inStockQuantity;
  final List<String> productImagesList;
  final bool isFavorite;
  final List<String> colorVariantsList;
  final String brand;
  final String model;
  final String colorName;
  final String style;

  ProductModel({
    required this.productTitle,
    required this.price,
    required this.ratingCount,
    required this.inStockQuantity,
    required this.productImagesList,
    required this.isFavorite,
    required this.colorVariantsList,
    required this.brand,
    required this.model,
    required this.colorName,
    required this.style,
  });
}

List<ProductModel> productsList = [
  ProductModel(
    productTitle: "Smart Watches",
    price: "\$120.00",
    ratingCount: 3,
    inStockQuantity: 5,
    productImagesList: [
      LocalFiles.productWatchImg,
      LocalFiles.productWatchImg,
      LocalFiles.productWatchImg,
    ],
    isFavorite: true,
    colorVariantsList: ['#396036', '#CDBD69', '#3B250F', '#69ABCE', '#C0C0C0'],
    brand: "Noise",
    model: "ColorFit Pulse 2",
    colorName: "Air Superiority Blue",
    style: "Modern",
  ),
  ProductModel(
    productTitle: "Apple MacBook",
    price: "\$1200.00",
    ratingCount: 3,
    inStockQuantity: 5,
    productImagesList: [
      LocalFiles.productLaptopImg,
      LocalFiles.productLaptopImg,
      LocalFiles.productLaptopImg,
    ],
    isFavorite: false,
    colorVariantsList: ['#396036', '#CDBD69', '#3B250F', '#69ABCE', '#C0C0C0'],
    brand: "Noise",
    model: "ColorFit Pulse 2",
    colorName: "Air Superiority Blue",
    style: "Modern",
  ),
  ProductModel(
    productTitle: "Traveling Bags",
    price: "\$220.00",
    ratingCount: 3,
    inStockQuantity: 5,
    productImagesList: [
      LocalFiles.productBagImg,
      LocalFiles.productBagImg,
      LocalFiles.productBagImg,
    ],
    isFavorite: true,
    colorVariantsList: ['#396036', '#CDBD69', '#3B250F', '#69ABCE', '#C0C0C0'],
    brand: "Noise",
    model: "ColorFit Pulse 2",
    colorName: "Air Superiority Blue",
    style: "Modern",
  ),
  ProductModel(
    productTitle: "New Sport Shoes",
    price: "\$300.00",
    ratingCount: 3,
    inStockQuantity: 5,
    productImagesList: [
      LocalFiles.productShoeImg,
      LocalFiles.productShoeImg,
      LocalFiles.productShoeImg,
    ],
    isFavorite: false,
    colorVariantsList: ['#396036', '#CDBD69', '#3B250F', '#69ABCE', '#C0C0C0'],
    brand: "Noise",
    model: "ColorFit Pulse 2",
    colorName: "Air Superiority Blue",
    style: "Modern",
  ),
];
