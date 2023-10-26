import 'package:flutter/material.dart';
import 'package:learning/src/domain/entity/banner_response_entity.dart';

class BannerListWidget extends StatelessWidget {
  final List<BannerDataEntity> bannerList;

  const BannerListWidget({super.key, required this.bannerList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: bannerList.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final banner = bannerList[index];

          return Image.network(
            banner.eventImage,
            width: 350,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
