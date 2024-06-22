import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mahfuza_overseas/src/features/promotion/data/model/promotion_model.dart';
import 'package:mahfuza_overseas/src/features/widgets/custom_text.dart';

import '../../../../core/utilities/common_methods.dart';

class PromotionCarouselSlider extends StatelessWidget {
  final List<Data>? list;
  PromotionCarouselSlider({super.key, this.list});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 170.0,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
      ),
      items: (list?.isNotEmpty ?? false)? list?.map((promotion) {
        return Builder(
          builder: (BuildContext context) {
            return  InkWell(
              onTap: (){
             CommonMethods().browseURL(promotion.adsUrl ?? '');
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8, right: 5),
                        child: Align(alignment: Alignment.centerRight,
                        child: CustomRichText(text: "${promotion.adsExpiredDate}", title:  "End in: ",)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomSimpleText(
                          text: "${promotion.adsTitle}",
                          fontSize: 13,
                          alignment: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: CommonMethods.cachedNetworkImage(
                              "${promotion.banner}",
                              // height: 120.0,
                              width: double.infinity,
                              fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }).toList() : [],
    );
  }
}
