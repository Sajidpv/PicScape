import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:picscape/data/response/api_responses.dart';
import 'package:picscape/data/response/status.dart';
import 'package:picscape/home/model/image_model.dart';
import '../repository/home_repository.dart';

class HomeProvider with ChangeNotifier {
  HomeRepository homeRepository;
  HomeProvider({required this.homeRepository}) {
    selectedCategory = categories.first;
    setFetchedImages(ApiResponse.loading());
    fetchImages(selectedCategory);
  }
  final List<String> categories = [
    'Food',
    'Architecture',
    'Movie',
    'Travel',
    'Animal',
    'Sport',
    'Nature',
  ];
  TextEditingController searchImage = TextEditingController();

  String selectedCategory = '';
  List<Results>? _images = [];
  List<Results>? get unsplashImages => _images;

  bool _isFetching = false;
  bool get isFetching => _isFetching;

  int _currentPage = 1;
  bool _hasMore = true;

  ApiResponse<UnsplashImageModel> unsplashedImageList = ApiResponse.loading();
/////////////set selected category///////////////////
  void setNewCategory(int index) {
    selectedCategory = categories[index];
    _currentPage = 1;
    _hasMore = true;
    setFetchedImages(ApiResponse.loading());
    _images = [];
    fetchImages(selectedCategory);
  }

  void searchImages() {
    if (searchImage.text.isNotEmpty) {
      _currentPage = 1;
      _hasMore = true;
      setFetchedImages(ApiResponse.loading());
      _images = [];
      fetchImages(searchImage.text);
    }
  }

/////setting the fetched images////////////////
  void setFetchedImages(ApiResponse<UnsplashImageModel> response) {
    unsplashedImageList = response;
    if (response.status == Status.completed) {
      final newResults = unsplashedImageList.data?.results ?? [];
      if (newResults.isEmpty) {
        _hasMore = false;
      } else {
        _images?.addAll(newResults);
        _currentPage++;
      }
    }
    notifyListeners();
  }

///////////fetch images form api///////////////
  Future<void> fetchImages(String search) async {
    if (_isFetching || !_hasMore) return;
    _isFetching = true;
    notifyListeners();
    homeRepository.fetchImagesApi(search, _currentPage).then((value) {
      setFetchedImages(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('Error: $error');
        print('StackTrace: $stackTrace');
      }

      setFetchedImages(ApiResponse.error(error.toString()));
    }).whenComplete(() {
      _isFetching = false;
    });
  }

  @override
  void dispose() {
    searchImage.clear();
    super.dispose();
  }
}
