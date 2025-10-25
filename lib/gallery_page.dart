import 'package:e_commerce/domains/models/rating.dart';
import 'package:e_commerce/modules/rating/rating_length.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class GalleryPage extends StatefulWidget {
  static String path = '/GalleryPage';

  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: U.Theme.background,
      body: ListView(
        padding: EdgeInsets.all(11),
        children: [
          SizedBox(height: 44, child: U.AppBar(title: 'title')),
          SizedBox(height: 22),
          Row(
            children: [
              U.Text('Primary : '),
              SizedBox(width: 15),
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: U.Theme.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          SizedBox(height: 22),
          Row(
            children: [
              U.Text('black : '),
              SizedBox(width: 15),
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: U.Theme.black,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          SizedBox(height: 22),
          Row(
            children: [
              U.Text('background : '),
              SizedBox(width: 15),
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: U.Theme.background,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          SizedBox(height: 22),
          Row(
            children: [
              U.Text('white : '),
              SizedBox(width: 15),
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: U.Theme.white,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          SizedBox(height: 22),
          Row(
            children: [
              U.Text('gray : '),
              SizedBox(width: 15),
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: U.Theme.gray,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          SizedBox(height: 17),
          U.Text('Button', fontSize: U.TextSize.s18),
          SizedBox(height: 22),
          U.Button(
            size: U.ButtonSize.xs,
            onTap: () {},
            bordeRaius: U.Theme.r25,
            color: U.Theme.primary,
            title: 'xs button , primary , radius 25',
          ),
          SizedBox(height: 22),
          U.Button(
            size: U.ButtonSize.s,
            onTap: () {},
            bordeRaius: U.Theme.r25,
            color: U.Theme.primary,
            title: 'small button , primary , radius 25',
          ),
          SizedBox(height: 22),
          U.Button(
            size: U.ButtonSize.m,
            onTap: () {},
            bordeRaius: U.Theme.r25,
            color: U.Theme.primary,
            title: 'medium button , primary , radius 25',
          ),
          SizedBox(height: 22),
          U.Button(
            size: U.ButtonSize.l,
            onTap: () {},
            bordeRaius: U.Theme.r25,
            color: U.Theme.primary,
            title: 'large button , primary,radius 25',
          ),
          SizedBox(height: 22),
          U.Button(
            size: U.ButtonSize.l,
            onTap: () {},
            bordeRaius: U.Theme.r29,
            color: U.Theme.primary,
            title: 'large button , primary,radius 29 , with leading',
            leading: U.Image.Icon(color: U.Theme.black, image: U.Icons.bag),
          ),
          SizedBox(height: 22),

          U.Button(
            size: U.ButtonSize.l,
            onTap: () {},
            bordeRaius: U.Theme.r8,
            color: U.Theme.primary,
            title: 'large button , primary,radius 8',
            //trailing: Icon(Icons.abc),
          ),
          SizedBox(height: 22),

          U.Button(
            size: U.ButtonSize.l,
            onTap: () {},
            bordeRaius: U.Theme.r25,
            color: U.Theme.black,
            title: 'large button , black , radius 25',
            // trailing: Icon(Icons.abc),
          ),
          SizedBox(height: 22),
          U.Text('OutlineButton:', fontSize: U.TextSize.s18),
          SizedBox(height: 14),

          U.OutlineButton(
            bordeRaius: 111,
            onTap: () {},
            borderType: U.BorderVariants.black,
            size: U.OutlineButtonSize.small,
            title: 'small outlineButton',
          ),
          SizedBox(height: 22),
          U.OutlineButton(
            bordeRaius: 111,
            onTap: () {},
            borderType: U.BorderVariants.black,
            size: U.OutlineButtonSize.large,
            title: 'large outlineButton',
          ),
          SizedBox(height: 22),
          Container(
            padding: EdgeInsets.all(11),
            color: Colors.black,
            height: 55,
            child: U.OutlineButton(
              bordeRaius: 111,
              onTap: () {},
              borderType: U.BorderVariants.white,
              size: U.OutlineButtonSize.small,
              title: 'small , white outlineButton',
            ),
          ),
          SizedBox(height: 22),
          U.Text('IconButton:', fontSize: U.TextSize.s18),
          SizedBox(height: 22),
          U.IconButton(
            size: U.IconButtonSize.large,
            icon: U.Icons.shop,
            onTap: () {},
          ),
          SizedBox(height: 22),
          U.IconButton(
            color: U.Theme.primary,
            size: U.IconButtonSize.small,
            icon: U.Icons.profile,
            onTap: () {},
          ),
          SizedBox(height: 22),
          U.Text('Counter:', fontSize: U.TextSize.s18),
          SizedBox(height: 12),

          U.Counter(count: 2, onAdded: () {}, onIncremented: () {}),
          SizedBox(height: 22),

          U.Text('SearchInput::', fontSize: U.TextSize.s18),

          SizedBox(height: 12),
          U.SearchInput(
            controller: TextEditingController(),
            onSearched: () {},
            isSearched: false,
            hintText: 'Search',
          ),
          SizedBox(height: 32),
          U.Text('Rating star:', fontSize: U.TextSize.s18),
          U.PickStar(onTap: (star) {}),
          SizedBox(height: 32),
          U.Text('TextInput:', fontSize: U.TextSize.s18),
          SizedBox(height: 22),
          U.TextInput(title: 'credit card', textCtrl: TextEditingController()),
          SizedBox(height: 22),
          U.Text('checkBox:', fontSize: U.TextSize.s18),

          SizedBox(height: 32),
          Row(
            children: [
              U.CheckBox(
                onTap: () {
                  isChecked = !isChecked;
                  setState(() {});
                },
                isActive: isChecked,
                color: U.CheckBoxColor.black,
              ),
              SizedBox(width: 11),
              U.CheckBox(
                onTap: () {
                  isChecked = !isChecked;
                  setState(() {});
                },
                isActive: isChecked,
                color: U.CheckBoxColor.red,
              ),
            ],
          ),
          SizedBox(height: 15),
          RatingLength(ratings: [3, 2, 3, 3, 2]),
          SizedBox(height: 102),
        ],
      ),
    );
  }
}
