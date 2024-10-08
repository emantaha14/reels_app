import 'package:reels_app_spider_tech/features/reels_screen/data/data_sources/end_points_constants.dart';

import '../../../../core/error_handler/error_exception.dart';
import '../../../../core/networking/api_services.dart';
import '../models/reels_model.dart';

abstract class GetReelsDataSource {
  Future<GetReelsModel> getReels();
}

class GetReelsDataSourceImpl implements GetReelsDataSource {
  @override
  Future<GetReelsModel> getReels() async {
    const getReelsUrl =
        '${EndPointConstants.baseUrl}${EndPointConstants.reelsEP}';

    final response = await ApiServices.getData(urll: getReelsUrl);
    if (response.statusCode == 200) {
      final getReelsResponse = GetReelsModel.fromJson(response.data);
      return getReelsResponse;
    } else {
      throw ServerException();
    }
  }
}
