import 'package:flutter/widgets.dart';

class ImageUtils {
  static Future<List<dynamic>> preloadNetworkImages(
      BuildContext context, List<String> imageUrls) async {
    List<dynamic> exceptions = [];
    await Future.wait(imageUrls.map((e) => precacheImage(
          NetworkImage(e),
          context,
          onError: (exception, stackTrace) {
            exceptions.add(exception);
          },
        )));
    return Future.value(exceptions);
  }
}
