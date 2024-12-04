import 'package:picscape/configs/app_configs/app_configs.dart';
import 'package:picscape/home/model/image_model.dart';

import '../../../data/network/network_api_services.dart';
import 'home_repository.dart';

class HomeHttpApiRepository implements HomeRepository {
  final _apiServices = NetworkApiService();

  @override
  Future<UnsplashImageModel> fetchImagesApi(String search, int page) async {
    dynamic response = await _apiServices.getGetApiResponse(
      '${AppConfig.BASE_URL}&query=$search&page=$page&per_page=30',
    );
    return UnsplashImageModel.fromJson(response);
  }
}
