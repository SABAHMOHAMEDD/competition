import 'package:competition/screens/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';

import '../const/const.dart';
import '../donut_tile.dart';
import '../messages/message_screen.dart';

class CivilTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List civilList = [
      'خدمات الرخص',
      'خدمات نيابات المرور',
    ];
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.blueGrey[200],
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(),
              Text('خدمات متعلقة بالاحوال الشخصية والاحوال المدنية'),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(10),
              itemCount: civilList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    navigateTo(context, ChatDetailsScreen(serviceID: 'v07COa4kjYSVRyFsanTNM0kPrcq2'));
                  },
                  child: DonutTile(
                    donutFlavour: civilList[index],
                  ),
                );
              }),
        )
      ],
    );
  }
}
