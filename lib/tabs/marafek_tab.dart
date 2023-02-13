import 'package:flutter/material.dart';

import '../donut_tile.dart';

class MarafekTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List marafekList = [
      'خدمات الرخص',
      'خدمات نيابات المرور',
    ];
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(10),
              itemCount: marafekList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1),
              itemBuilder: (BuildContext context, int index) {
                return DonutTile(
                  donutFlavour: marafekList[index],
                );
              }),
        )
      ],
    );
  }
}
