import 'package:fashion_app/core/utils/strings.dart';

abstract class MenCategory {
  static const art = 325;
  // static const shorts = 5231;
  static const gift = 703;
  static const accessories = 1095;
  static const shoesAndSneakers = 1935;

  static final List<Category> categories = [
    Category(
        categoryName: AppStrings.tShirts,
        categoryId: art,
        image:
            'https://img.lovepik.com/free-png/20211213/lovepik-painting-tools-png-image_401548908_wh1200.png'),
    Category(
      categoryName: AppStrings.suitsAndTailoring,
      categoryId: gift,
      image:
          'https://monkeymedia.vcdn.com.vn/upload/web/storage_web/06-11-2022_11:22:01_qua-20-11.jpg',
    ),
    Category(
      categoryName: AppStrings.tShirtsAndTankTops,
      categoryId: accessories,
      image:
          'https://www.pennypincherfashion.com/wp-content/uploads/2019/07/Chic-Neutral-Accessories.jpg',
    ),
    Category(
      categoryName: "Action Figures",
      categoryId: 1053,
      image: 'https://m.media-amazon.com/images/I/81dF42OL0lL.jpg',
    ),
    Category(
      categoryName: "Adhesive Removers",
      categoryId: 563,
      image:
          'https://cdn11.bigcommerce.com/s-wlyjb00m0m/images/stencil/1280x1280/products/115/563/1232_Front__58766.1621004149.jpg?c=2',
    ),
    Category(
      categoryName: "Adhesive Sheets",
      categoryId: 1267,
      image: 'https://cdn-amz.woka.io/images/I/71CAntIzBZL.jpg',
    ),
  ];
}

abstract class WomenCategory {
  static const dresses = 5235;
  static const tops = 4167;
  static const jeans = 4331;
  static const shoes = 1931;
  static final List<Category> categories = [
    Category(
      categoryName: AppStrings.dresses,
      categoryId: dresses,
      image:
          'https://images.asos-media.com/products/tfnc-bridesmaid-one-shoulder-maxi-dress-in-teracotta/204329344-1-teracotta',
    ),
    // Category(
    //   categoryName: AppStrings.jeans,
    //   categoryId: jeans,
    //   image:
    //       'https://images.asos-media.com/products/parisian-tall-skinny-jeans-in-indigo/21643306-1-indigo',
    // ),
    // Category(
    //   categoryName: AppStrings.shoes,
    //   categoryId: shoes,
    //   image:
    //       'https://images.asos-media.com/products/london-rebel-flare-heeled-platform-sandals-in-light-pink/203826478-1-lightpink',
    // ),
    // Category(
    //   categoryName: AppStrings.tops,
    //   categoryId: tops,
    //   image:
    //       'https://images.asos-media.com/products/pieces-long-sleeve-top-with-button-detail-in-beige/203561630-1-falcon',
    // ),
  ];
}

abstract class AllProdcutCategories {
  static final categories = [
    Category(
      categoryName: AppStrings.mensTShirts,
      categoryId: MenCategory.art,
    ),
    Category(
      categoryName: AppStrings.mensSuitsAndTailoring,
      categoryId: MenCategory.gift,
    ),
    // Category(
    //   categoryName: AppStrings.womenDresses,
    //   categoryId: WomenCategory.dresses,
    // ),
    // Category(
    //   categoryName: AppStrings.womenJeans,
    //   categoryId: WomenCategory.jeans,
    // ),
    Category(
      categoryName: AppStrings.menTShritsAndTops,
      categoryId: MenCategory.accessories,
    ),
    // Category(
    //   categoryName: AppStrings.womenTops,
    //   categoryId: WomenCategory.tops,
    // ),
    // Category(
    //   categoryName: AppStrings.menShorts,
    //   categoryId: MenCategory.shorts,
    // ),
    // Category(
    //   categoryName: AppStrings.menShoseAndSneakers,
    //   categoryId: MenCategory.shoesAndSneakers,
    // ),
    // Category(
    //   categoryName: AppStrings.womenShoes,
    //   categoryId: WomenCategory.shoes,
    // ),
  ];
}

class Category {
  String categoryName;
  int categoryId;
  String? image;
  Category({
    required this.categoryName,
    required this.categoryId,
    this.image,
  });
}
