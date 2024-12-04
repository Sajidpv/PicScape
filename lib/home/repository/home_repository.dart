import 'package:picscape/home/model/image_model.dart';

abstract class HomeRepository {
  Future<UnsplashImageModel> fetchImagesApi(String search, int page);
}
