import 'package:book_library/design_system/app_typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BLBookListItem extends StatelessWidget {
  const BLBookListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/7/7a/The_Great_Gatsby_Cover_1925_Retouched.jpg',
              height: 84,
              width: 77,
              fit: BoxFit.cover,
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  'Marina',
                  style: AppTypography.subtitle1Bold,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text('Carlos Ruiz Zafon'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
