import 'package:flutter/material.dart';

import '../donut_tile.dart';

class TravelTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List travelList = [
      'استعلام عن رصيد',
      'تجديد باقة',
    ];
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(10),
              itemCount: travelList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1),
              itemBuilder: (BuildContext context, int index) {
                return DonutTile(
                  donutFlavour: travelList[index],
                );
              }),
        )
      ],
    );
  }
}
