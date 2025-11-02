import 'package:flutter/material.dart' as M;
import 'package:flutter/widgets.dart';

abstract class Icons {
  // static

  static const activeStar = 'assets/icons/activated.png';
  static const add = 'assets/icons/add.png';
  static const search = 'assets/icons/Search.png';
  static const bag = 'assets/icons/bag.png';
  static const checkBoxNotActive = 'assets/icons/checkbox off.png';
  static const favoriteActive = 'assets/icons/favoriteActive.png';
  static const blackCheckBoxActive = 'assets/icons/checkbox on.png';
  static const redCheckBoxActive = 'assets/icons/Selected.png';
  static const chevron = 'assets/icons/chevron.png';
  static const dropdown = 'assets/icons/dropdown.png';
  static const favorite = 'assets/icons/favorites.png';
  static const home = 'assets/icons/home.png';
  static const arrowForward = 'assets/icons/arrowForward.png';
  static const more = 'assets/icons/more.png';
  static const bagActive = 'assets/icons/bagActive.png';
  static const remove = 'assets/icons/remove.png';
  static const pen = 'assets/icons/pen.png';
  static const question = 'assets/icons/question.png';
  static const post = 'assets/images/post.png';
  static const tipax = 'assets/images/tipax.png';
  static const profileActive = 'assets/icons/profileActive.png';
  static const homeActivate = 'assets/icons/homeActive.png';
  static const bagButton = 'assets/icons/bagButton.png';
  static const thumbUp = 'assets/icons/thumb_up.png';
  static const favoriteInactive = 'assets/icons/favoriteInactive.png';
  static const addedtofavorite = 'assets/icons/addedtofavorite.png';
  static const inactiveStar = 'assets/icons/inactive.png';
  static const minus = 'assets/icons/minus.png';
  static const filter = 'assets/icons/filter.png';
  static const highlow = 'assets/icons/highlow.png';
  static const viewList = 'assets/icons/view_list.png';
  static const profile = 'assets/icons/profile.png';
  static const shop = 'assets/icons/shop.png';
  static const shopActivated = 'assets/icons/shopActivated.png';
}

class Image extends M.StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final BoxFit boxfit;
  final Color? color;
  const Image({
    super.key,
    this.color,
    this.boxfit = BoxFit.contain,
    required this.image,
    this.width,
    this.height,
  });

  const Image.Icon({
    super.key,
    this.color,
    required this.image,
    this.boxfit = BoxFit.contain,
    double size = 22,
  }) : width = size,
       height = size;

  @override
  M.Widget build(M.BuildContext context) {
    return M.Image.asset(
      fit: boxfit,
      // colorBlendMode: BlendMode.,
      color: color,
      width: width,
      height: height,
      image,
    );
  }
}
