import 'package:e_comerce_app/features/shop/models/baner_model.dart';
import 'package:e_comerce_app/features/shop/models/brand_model.dart';
import 'package:e_comerce_app/features/shop/models/category_model.dart';
import 'package:e_comerce_app/features/shop/models/product_model.dart';
import 'package:e_comerce_app/features/shop/models/product_variation_model.dart';
import 'package:e_comerce_app/routes/routes.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';

class TDummyData {
//!CATEGORIES LIST
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', image: TImages.animals, isFeatured: true, name: 'Animals'),
    CategoryModel(
        id: '2', image: TImages.clothes, isFeatured: true, name: 'Clothes'),
    CategoryModel(
        id: '3', image: TImages.cosmetics, isFeatured: true, name: 'Cosmetics'),
    CategoryModel(id: '4', image: TImages.diy, isFeatured: true, name: 'Tools'),
    CategoryModel(
        id: '5',
        image: TImages.electricity,
        isFeatured: true,
        name: 'Elctricity'),
    CategoryModel(
        id: '6',
        image: TImages.electronics,
        isFeatured: true,
        name: 'Electronics'),
    CategoryModel(
        id: '7', image: TImages.furniture, isFeatured: true, name: 'Furniture'),
    CategoryModel(
        id: '8', image: TImages.jewelry, isFeatured: true, name: 'Jewelry'),
    CategoryModel(
        id: '9', image: TImages.shoes, isFeatured: true, name: 'Shoes'),

    //*SUBACATEGORIES

//sports
    CategoryModel(
      id: '10',
      parentId: '2',
      image: TImages.shoes,
      isFeatured: false,
      name: 'Sport Shoes',
    ),
    CategoryModel(
      id: '11',
      parentId: '2',
      image: TImages.shoes,
      isFeatured: false,
      name: 'Track Suits',
    ),
    CategoryModel(
        id: '12',
        parentId: '2',
        image: TImages.furniture,
        isFeatured: false,
        name: 'Sports Equipment'),

    //furniture
    CategoryModel(
      id: '13',
      parentId: '7',
      image: TImages.furniture,
      isFeatured: false,
      name: 'Bedrom Furniture',
    ),
    CategoryModel(
      id: '14',
      parentId: '7',
      image: TImages.furniture,
      isFeatured: false,
      name: 'Kitchen furniture',
    ),
    CategoryModel(
        id: '15',
        parentId: '7',
        image: TImages.furniture,
        isFeatured: false,
        name: 'Office Furniture'),
  ];

//!BANNER LIST
  static final List<BannerModel> banners = [
    BannerModel(
        targetScreen: TRoutes.order, active: false, imageUrl: TImages.banner1),
    BannerModel(
        targetScreen: TRoutes.cart, active: true, imageUrl: TImages.banner2),
    BannerModel(
        targetScreen: TRoutes.favourites,
        active: true,
        imageUrl: TImages.banner3),
    BannerModel(
        targetScreen: TRoutes.search, active: true, imageUrl: TImages.banner4),
  ];

//!BRAND MODEL

  static final List<BrandModel> brands = [
    BrandModel(id: '1', name: 'Ikea', image: TImages.ikea, isFeatured: true),
    BrandModel(
        id: '2', name: 'Adidas', image: TImages.adidas, isFeatured: true),
    BrandModel(id: '3', name: 'Dell', image: TImages.dell, isFeatured: true),
    BrandModel(id: '4', name: 'Lg', image: TImages.lg, isFeatured: true),
    BrandModel(id: '5', name: 'Nike', image: TImages.nike, isFeatured: true),
  ];

  //!PRODUCMODEL
  static final List<ProductModel> products = [
    ProductModel(
        id: '01',
        stock: 1,
        price: 250,
        title: 'Ikea sofa',
        thumbnail: TImages.flutter,
        productType: 'single',
        brand: BrandModel(
            id: '1', name: 'Sofá', image: TImages.ikea, isFeatured: true),
        categoryId: '7',
        date: DateTime.now(),
        description: 'as good as new',
        images: [
          TImages.furni1,
          TImages.furni2,
          TImages.furni3,
        ],
        isFeatured: true,
        salePrice: 150.0,
        sku: ''),
    ProductModel(
        id: '02',
        stock: 1,
        price: 250,
        title: 'Ikea sofa',
        thumbnail: TImages.flutter,
        productType: 'single',
        brand: BrandModel(
            id: '1', name: 'Sofá', image: TImages.ikea, isFeatured: true),
        categoryId: '7',
        date: DateTime.now(),
        description: 'as good as new',
        images: [
          TImages.furni1,
          TImages.furni2,
          TImages.furni3,
        ],
        isFeatured: true,
        salePrice: 150.0,
        sku: ''),
    ProductModel(
        id: '03',
        stock: 1,
        price: 250,
        title: 'Ikea sofa',
        thumbnail: TImages.flutter,
        productType: 'single',
        brand: BrandModel(
            id: '1', name: 'Sofá', image: TImages.ikea, isFeatured: true),
        categoryId: '7',
        date: DateTime.now(),
        description: 'as good as new',
        images: [
          TImages.furni1,
          TImages.furni2,
          TImages.furni3,
        ],
        isFeatured: true,
        salePrice: 150.0,
        sku: '')
  ];
}
