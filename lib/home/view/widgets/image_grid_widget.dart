import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:picscape/configs/app_themes/colors.dart';
import 'package:picscape/configs/components/default_lost_widget.dart';
import 'package:picscape/configs/components/empty_data_screen_widget.dart';
import 'package:picscape/configs/utils/extensions.dart';
import 'package:picscape/configs/utils/utils.dart';
import 'package:picscape/data/response/status.dart';
import 'package:picscape/home/view/components/product_shimmer.dart';
import 'package:picscape/home/view/components/product_staggered_shimmer.dart';
import 'package:picscape/home/view/widgets/error_widget.dart';
import 'package:picscape/home/view_model/home_provider.dart';
import 'package:provider/provider.dart';

class ImageGridWidget extends StatefulWidget {
  const ImageGridWidget({super.key});

  @override
  State<ImageGridWidget> createState() => _ImageGridWidgetState();
}

class _ImageGridWidgetState extends State<ImageGridWidget> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      Provider.of<HomeProvider>(context, listen: false)
          .fetchImages(context.homeProvider.selectedCategory);
    }
  }

  final Utils _utils = Utils();
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        switch (provider.unsplashedImageList.status) {
          case Status.loading:
            return const ProductStaggeredShimmer();
          case Status.error:
            return HomeErrorWidget(
              list: provider.unsplashedImageList.message,
              onTap: () {
                provider.fetchImages(provider.selectedCategory);
              },
            );
          case Status.completed:
            if (provider.unsplashImages == null ||
                provider.unsplashImages!.isEmpty) {
              return Center(
                child: NoDataScreenWidget(
                  onRefresh: () =>
                      provider.fetchImages(provider.selectedCategory),
                ),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: MasonryGridView.builder(
                    controller: _scrollController,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: provider.unsplashImages?.length,
                    itemBuilder: (context, index) {
                      final photo = provider.unsplashImages?[index];
                      return GestureDetector(
                        onTap: () => _utils.downloadImage(
                            photo?.urls?.full ?? '', context),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: photo?.urls?.regular ?? '',
                                  placeholder: (context, url) =>
                                      const ProductShimmer(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.broken_image),
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppPellet.whiteBackground),
                                      child: Text(
                                        photo?.likes.toString() ?? '',
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (provider.isFetching)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
              ],
            );
          default:
            return const LostPage();
        }
      },
    );
  }
}
