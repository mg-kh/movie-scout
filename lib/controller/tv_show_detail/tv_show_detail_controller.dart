import 'package:get/get.dart';
import 'package:movie/model/tv_show_detail/last_episode_to_air.dart';
import 'package:movie/model/tv_show_detail/next_episode_to_air.dart';
import 'package:movie/model/tv_show_detail/tv_show_detail.dart';
import 'package:movie/services/tv_show_detail/tv_show_detail_api_service.dart';

class TvShowDetailController extends GetxController {
  var tvShowDetailData = TvShowDetail(
    backdropPath: null,
    createdBy: null,
    episodeRunTime: null,
    firstAirDate: null,
    genres: null,
    homepage: null,
    id: null,
    inProduction: null,
    languages: null,
    lastAirDate: null,
    lastEpisodeToAir: LastEpisodeToAir(
      airDate: null,
      episodeNumber: null,
      id: null,
      name: null,
      overview: null,
      productionCode: null,
      seasonNumber: null,
      stillPath: null,
      voteAverage: null,
      voteCount: null,
    ),
    name: null,
    nextEpisodeToAir: NextEpisodeToAir(
      airDate: null,
      episodeNumber: null,
      id: null,
      name: null,
      overview: null,
      productionCode: null,
      seasonNumber: null,
      stillPath: null,
      voteAverage: null,
      voteCount: null,
    ),
    networks: null,
    numberOfEpisodes: null,
    numberOfSeasons: null,
    originCountry: null,
    originalLanguage: null,
    originalName: null,
    overview: null,
    popularity: null,
    posterPath: null,
    productionCompanies: null,
    productionCountries: null,
    seasons: null,
    spokenLanguages: null,
    status: null,
    tagline: null,
    type: null,
    voteAverage: null,
    voteCount: null,
  ).obs;
  var isLoading = false.obs;

  Future getTvShowDetailData({required tvId}) async {
    try {
      isLoading(true);
      var data =
          await TvShowDetailApiService().remoteGetTvShowDetailData(tvId: tvId);
      tvShowDetailData(data);
    } catch (e) {
      //
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getTvShowDetailData(tvId: Get.parameters['id']);
  }
}
