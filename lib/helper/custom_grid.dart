import 'package:evpazarlama/models/ads_model.dart';
import 'package:flutter/material.dart';

import 'config.dart';
import 'custom_positioned.dart';
import 'custom_text.dart';

class CustomGrid {
  Widget customGrid(BuildContext context, List<AdsModel> list) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 300,
      color: Colors.white,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: list.length,
        itemBuilder: (_, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: mainColor),
            ),
            child: Stack(
              children: [
                Image.network(
                  list[index].images?[0] ?? urlHolder,
                  width: 200,
                  height: 145.0,
                  fit: BoxFit.cover,
                ),
                customPositioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    color: Colors.white.withOpacity(0.8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(
                            text: list[index].details?[0] ?? '***',
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            textFontSize: 14,
                            textWeight: FontWeight.bold,
                            textColor: mainColor),
                        customText(
                            text:
                                '${list[index].details?[2] ?? '***'} ${list[index].details?[3] ?? '***'}',
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            textFontSize: 10,
                            textWeight: FontWeight.bold,
                            textColor: Colors.black),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
