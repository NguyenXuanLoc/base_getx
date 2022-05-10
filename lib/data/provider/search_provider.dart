import 'package:docsify/config/constant.dart';
import 'package:docsify/data/provider/api_result.dart';
import 'package:docsify/data/provider/base_provider.dart';

class SearchProvider extends BaseProvider {
  static final SearchProvider instance = SearchProvider._internal();

  factory SearchProvider() => instance;

  SearchProvider._internal() {
    initProvider();
  }

  Future<ApiResult> searchDoctor({int from = 0,
    int size = 10,
    String city = '',
    String query = '',
    String sort = 'rate_desc'}) async {
    var queryParam = {
      ApiKey.from: from.toString(),
      ApiKey.size: size.toString(),
      ApiKey.city: city,
      ApiKey.query: query,
      ApiKey.sort: sort
    };
    return await GET('search/doctor/search', queryParam: queryParam);
  }

  Future<ApiResult> getDoctorRatingLatest({String status = 'approved',
    int limit = 10,
    int offset = 0,
    int vote = 0}) async {
    var queryParam = {
      ApiKey.status: status,
      ApiKey.limit: limit.toString(),
      ApiKey.offset: offset.toString(),
      ApiKey.vote: vote.toString()
    };
    return await GET('public/ratings/latest', queryParam: queryParam);
  }
}
