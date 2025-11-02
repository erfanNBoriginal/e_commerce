import 'package:flutter/cupertino.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class SettingsCard extends StatelessWidget {
  
  final String title ;
  final String subTitle ;
  final void Function() onTap;
  
  const SettingsCard({super.key, required this.title, required this.subTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0,left: 15,top: 18,bottom: 38),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                U.Text(title,fontSize: U.TextSize.s16,weight: U.TextWeight.semiBold,),
                SizedBox(height: 9,),
                U.Text(
                  color: U.Theme.gray,
                  subTitle,fontSize: U.TextSize.s11,weight: U.TextWeight.regular,),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: onTap,
            child: U.Image.Icon(image: U.Icons.chevron))
        ],
      ),
    );
  }
}