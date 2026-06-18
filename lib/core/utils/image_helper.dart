import 'package:mymovies/core/config/api_config.dart';

class ImageHelper {
  static String getImageUrl(String path) {
    return '${ApiConfig.imageBaseUrl}$path';
  }
}
