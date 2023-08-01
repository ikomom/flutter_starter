import 'package:flutter_starter/test_getx/news/model/MovieModel.dart';
import 'package:flutter_starter/test_getx/news/service/ApiService.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  var isLoading = true.obs;
  // title: '',
  // shareUrl: '',
  // author: '',
  // itemCover: '',
  // hotValue: 0,
  // hotWords: '',
  // playCount: 0,
  // diggCount: 0,
  // commentCount: 0,

  // ignore: deprecated_member_use
    var movieList = List<MovieModel>.empty().obs;

  @override
  void onInit() {
    fetchMovie();
    super.onInit();
  }

  void fetchMovie() async {
    try {
      isLoading(true);
      var movie = await ApiService.fetchMovie();
      if (movie != null) {
        movieList.assignAll(movie);
      }
    } finally {
      isLoading(false);
    }
  }
}
