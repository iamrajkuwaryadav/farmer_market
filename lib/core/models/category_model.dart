import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/values/local_files.dart';

class CategoryModel {
  final String title;
  final String iconPath;

  CategoryModel({
    required this.title,
    required this.iconPath,
  });
}

List<CategoryModel> categoriesList = [
  CategoryModel(
    title: Loc.alized.lbl_clothes,
    iconPath: LocalFiles.imgClothesicon,
  ),
  CategoryModel(
    title: Loc.alized.lbl_bag,
    iconPath: LocalFiles.imgDownload,
  ),
  CategoryModel(
    title: Loc.alized.lbl_shoes,
    iconPath: LocalFiles.imgLightbulb,
  ),
  CategoryModel(
    title: Loc.alized.lbl_kitchen,
    iconPath: LocalFiles.imgClothesicon,
  ),
  CategoryModel(
    title: Loc.alized.lbl_mobiles,
    iconPath: LocalFiles.imgTrash,
  ),
  CategoryModel(
    title: Loc.alized.lbl_toys,
    iconPath: LocalFiles.imgLightbulbDeepOrangeA400,
  ),
  CategoryModel(
    title: Loc.alized.lbl_goggles,
    iconPath: LocalFiles.imgEye,
  ),
  CategoryModel(
    title: Loc.alized.lbl_kitchen,
    iconPath: LocalFiles.imgKitchenicon,
  ),
];
