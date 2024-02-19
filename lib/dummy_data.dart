import 'package:e_comerce_app/features/shop/models/category_model.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';

class TDummyData {
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
  ];
}
