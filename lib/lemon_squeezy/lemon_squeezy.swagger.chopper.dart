// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lemon_squeezy.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$LemonSqueezy extends LemonSqueezy {
  _$LemonSqueezy([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = LemonSqueezy;

  @override
  Future<Response<ProductsIdGet$Response>> _productsIdGet(
      {required String? id}) {
    final Uri $url = Uri.parse('/products/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<ProductsIdGet$Response, ProductsIdGet$Response>($request);
  }

  @override
  Future<Response<ProductsGet$Response>> _productsGet({int? filterStoreId}) {
    final Uri $url = Uri.parse('/products');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter[store_id]': filterStoreId
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ProductsGet$Response, ProductsGet$Response>($request);
  }
}
