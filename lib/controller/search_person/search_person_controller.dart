import 'package:get/get.dart';
import 'package:movie/model/search_person/result.dart';
import 'package:movie/services/search_person/search_person_api_service.dart';

class SearchPersonController extends GetxController{
  var resultPersonData = <Result>[].obs;
  var isLoading = false.obs;

  Future getSearchPersonData({required query})async{
    try{
      isLoading(true);
      var personData = await SearchPersonApiService().remoteSearchPersonData(query: query);
      resultPersonData(personData.results);
    }catch(e){
      //
    }finally{
      isLoading(false);
    }
  }
}