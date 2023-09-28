import 'package:learning/src/domain/entity/banner_response_entity.dart';

abstract class BannerRepository {
  Future<BannerResponseEntity> getBanners();
}
