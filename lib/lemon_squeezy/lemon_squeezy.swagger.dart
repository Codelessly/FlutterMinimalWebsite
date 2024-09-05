// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;
import 'lemon_squeezy.enums.swagger.dart' as enums;
export 'lemon_squeezy.enums.swagger.dart';

part 'lemon_squeezy.swagger.chopper.dart';
part 'lemon_squeezy.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class LemonSqueezy extends ChopperService {
  static LemonSqueezy create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$LemonSqueezy(client);
    }

    final newClient = ChopperClient(
        services: [_$LemonSqueezy()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$LemonSqueezy(newClient);
  }

  ///Retrieve a product
  ///@param id ID of the product to retrieve
  Future<chopper.Response<ProductsIdGet$Response>> productsIdGet(
      {required String? id}) {
    generatedMapping.putIfAbsent(
        ProductsIdGet$Response, () => ProductsIdGet$Response.fromJsonFactory);

    return _productsIdGet(id: id);
  }

  ///Retrieve a product
  ///@param id ID of the product to retrieve
  @Get(path: '/products/{id}')
  Future<chopper.Response<ProductsIdGet$Response>> _productsIdGet(
      {@Path('id') required String? id});

  ///List all products
  ///@param filter[store_id] Only return products belonging to the store with this ID.
  Future<chopper.Response<ProductsGet$Response>> productsGet(
      {int? filterStoreId}) {
    generatedMapping.putIfAbsent(
        ProductsGet$Response, () => ProductsGet$Response.fromJsonFactory);

    return _productsGet(filterStoreId: filterStoreId);
  }

  ///List all products
  ///@param filter[store_id] Only return products belonging to the store with this ID.
  @Get(path: '/products')
  Future<chopper.Response<ProductsGet$Response>> _productsGet(
      {@Query('filter[store_id]') int? filterStoreId});
}

@JsonSerializable(explicitToJson: true)
class Product {
  const Product({
    this.type,
    this.id,
    this.attributes,
    this.relationships,
    this.links,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  static const toJsonFactory = _$ProductToJson;
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'attributes')
  final Product$Attributes? attributes;
  @JsonKey(name: 'relationships')
  final Product$Relationships? relationships;
  @JsonKey(name: 'links')
  final Product$Links? links;
  static const fromJsonFactory = _$ProductFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.attributes, attributes) ||
                const DeepCollectionEquality()
                    .equals(other.attributes, attributes)) &&
            (identical(other.relationships, relationships) ||
                const DeepCollectionEquality()
                    .equals(other.relationships, relationships)) &&
            (identical(other.links, links) ||
                const DeepCollectionEquality().equals(other.links, links)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(attributes) ^
      const DeepCollectionEquality().hash(relationships) ^
      const DeepCollectionEquality().hash(links) ^
      runtimeType.hashCode;
}

extension $ProductExtension on Product {
  Product copyWith(
      {String? type,
      String? id,
      Product$Attributes? attributes,
      Product$Relationships? relationships,
      Product$Links? links}) {
    return Product(
        type: type ?? this.type,
        id: id ?? this.id,
        attributes: attributes ?? this.attributes,
        relationships: relationships ?? this.relationships,
        links: links ?? this.links);
  }

  Product copyWithWrapped(
      {Wrapped<String?>? type,
      Wrapped<String?>? id,
      Wrapped<Product$Attributes?>? attributes,
      Wrapped<Product$Relationships?>? relationships,
      Wrapped<Product$Links?>? links}) {
    return Product(
        type: (type != null ? type.value : this.type),
        id: (id != null ? id.value : this.id),
        attributes: (attributes != null ? attributes.value : this.attributes),
        relationships:
            (relationships != null ? relationships.value : this.relationships),
        links: (links != null ? links.value : this.links));
  }
}

@JsonSerializable(explicitToJson: true)
class ProductsIdGet$Response {
  const ProductsIdGet$Response({
    this.jsonapi,
    this.links,
    this.data,
  });

  factory ProductsIdGet$Response.fromJson(Map<String, dynamic> json) =>
      _$ProductsIdGet$ResponseFromJson(json);

  static const toJsonFactory = _$ProductsIdGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$ProductsIdGet$ResponseToJson(this);

  @JsonKey(name: 'jsonapi')
  final ProductsIdGet$Response$Jsonapi? jsonapi;
  @JsonKey(name: 'links')
  final ProductsIdGet$Response$Links? links;
  @JsonKey(name: 'data')
  final Product? data;
  static const fromJsonFactory = _$ProductsIdGet$ResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProductsIdGet$Response &&
            (identical(other.jsonapi, jsonapi) ||
                const DeepCollectionEquality()
                    .equals(other.jsonapi, jsonapi)) &&
            (identical(other.links, links) ||
                const DeepCollectionEquality().equals(other.links, links)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(jsonapi) ^
      const DeepCollectionEquality().hash(links) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $ProductsIdGet$ResponseExtension on ProductsIdGet$Response {
  ProductsIdGet$Response copyWith(
      {ProductsIdGet$Response$Jsonapi? jsonapi,
      ProductsIdGet$Response$Links? links,
      Product? data}) {
    return ProductsIdGet$Response(
        jsonapi: jsonapi ?? this.jsonapi,
        links: links ?? this.links,
        data: data ?? this.data);
  }

  ProductsIdGet$Response copyWithWrapped(
      {Wrapped<ProductsIdGet$Response$Jsonapi?>? jsonapi,
      Wrapped<ProductsIdGet$Response$Links?>? links,
      Wrapped<Product?>? data}) {
    return ProductsIdGet$Response(
        jsonapi: (jsonapi != null ? jsonapi.value : this.jsonapi),
        links: (links != null ? links.value : this.links),
        data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class ProductsGet$Response {
  const ProductsGet$Response({
    this.meta,
    this.jsonapi,
    this.links,
    this.data,
  });

  factory ProductsGet$Response.fromJson(Map<String, dynamic> json) =>
      _$ProductsGet$ResponseFromJson(json);

  static const toJsonFactory = _$ProductsGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$ProductsGet$ResponseToJson(this);

  @JsonKey(name: 'meta')
  final ProductsGet$Response$Meta? meta;
  @JsonKey(name: 'jsonapi')
  final ProductsGet$Response$Jsonapi? jsonapi;
  @JsonKey(name: 'links')
  final ProductsGet$Response$Links? links;
  @JsonKey(name: 'data', defaultValue: <Product>[])
  final List<Product>? data;
  static const fromJsonFactory = _$ProductsGet$ResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProductsGet$Response &&
            (identical(other.meta, meta) ||
                const DeepCollectionEquality().equals(other.meta, meta)) &&
            (identical(other.jsonapi, jsonapi) ||
                const DeepCollectionEquality()
                    .equals(other.jsonapi, jsonapi)) &&
            (identical(other.links, links) ||
                const DeepCollectionEquality().equals(other.links, links)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(meta) ^
      const DeepCollectionEquality().hash(jsonapi) ^
      const DeepCollectionEquality().hash(links) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $ProductsGet$ResponseExtension on ProductsGet$Response {
  ProductsGet$Response copyWith(
      {ProductsGet$Response$Meta? meta,
      ProductsGet$Response$Jsonapi? jsonapi,
      ProductsGet$Response$Links? links,
      List<Product>? data}) {
    return ProductsGet$Response(
        meta: meta ?? this.meta,
        jsonapi: jsonapi ?? this.jsonapi,
        links: links ?? this.links,
        data: data ?? this.data);
  }

  ProductsGet$Response copyWithWrapped(
      {Wrapped<ProductsGet$Response$Meta?>? meta,
      Wrapped<ProductsGet$Response$Jsonapi?>? jsonapi,
      Wrapped<ProductsGet$Response$Links?>? links,
      Wrapped<List<Product>?>? data}) {
    return ProductsGet$Response(
        meta: (meta != null ? meta.value : this.meta),
        jsonapi: (jsonapi != null ? jsonapi.value : this.jsonapi),
        links: (links != null ? links.value : this.links),
        data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Attributes {
  const Product$Attributes({
    this.storeId,
    this.name,
    this.slug,
    this.description,
    this.status,
    this.statusFormatted,
    this.thumbUrl,
    this.largeThumbUrl,
    this.price,
    this.priceFormatted,
    this.fromPrice,
    this.toPrice,
    this.payWhatYouWant,
    this.buyNowUrl,
    this.createdAt,
    this.updatedAt,
    this.testMode,
  });

  factory Product$Attributes.fromJson(Map<String, dynamic> json) =>
      _$Product$AttributesFromJson(json);

  static const toJsonFactory = _$Product$AttributesToJson;
  Map<String, dynamic> toJson() => _$Product$AttributesToJson(this);

  @JsonKey(name: 'store_id')
  final int? storeId;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(
    name: 'status',
    toJson: product$AttributesStatusNullableToJson,
    fromJson: product$AttributesStatusNullableFromJson,
  )
  final enums.Product$AttributesStatus? status;
  @JsonKey(name: 'status_formatted')
  final String? statusFormatted;
  @JsonKey(name: 'thumb_url')
  final String? thumbUrl;
  @JsonKey(name: 'large_thumb_url')
  final String? largeThumbUrl;
  @JsonKey(name: 'price')
  final int? price;
  @JsonKey(name: 'price_formatted')
  final String? priceFormatted;
  @JsonKey(name: 'from_price')
  final int? fromPrice;
  @JsonKey(name: 'to_price')
  final int? toPrice;
  @JsonKey(name: 'pay_what_you_want')
  final bool? payWhatYouWant;
  @JsonKey(name: 'buy_now_url')
  final String? buyNowUrl;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'test_mode')
  final bool? testMode;
  static const fromJsonFactory = _$Product$AttributesFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Attributes &&
            (identical(other.storeId, storeId) ||
                const DeepCollectionEquality()
                    .equals(other.storeId, storeId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.slug, slug) ||
                const DeepCollectionEquality().equals(other.slug, slug)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.statusFormatted, statusFormatted) ||
                const DeepCollectionEquality()
                    .equals(other.statusFormatted, statusFormatted)) &&
            (identical(other.thumbUrl, thumbUrl) ||
                const DeepCollectionEquality()
                    .equals(other.thumbUrl, thumbUrl)) &&
            (identical(other.largeThumbUrl, largeThumbUrl) ||
                const DeepCollectionEquality()
                    .equals(other.largeThumbUrl, largeThumbUrl)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.priceFormatted, priceFormatted) ||
                const DeepCollectionEquality()
                    .equals(other.priceFormatted, priceFormatted)) &&
            (identical(other.fromPrice, fromPrice) ||
                const DeepCollectionEquality()
                    .equals(other.fromPrice, fromPrice)) &&
            (identical(other.toPrice, toPrice) ||
                const DeepCollectionEquality()
                    .equals(other.toPrice, toPrice)) &&
            (identical(other.payWhatYouWant, payWhatYouWant) ||
                const DeepCollectionEquality()
                    .equals(other.payWhatYouWant, payWhatYouWant)) &&
            (identical(other.buyNowUrl, buyNowUrl) ||
                const DeepCollectionEquality()
                    .equals(other.buyNowUrl, buyNowUrl)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.testMode, testMode) ||
                const DeepCollectionEquality()
                    .equals(other.testMode, testMode)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(storeId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(slug) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(statusFormatted) ^
      const DeepCollectionEquality().hash(thumbUrl) ^
      const DeepCollectionEquality().hash(largeThumbUrl) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(priceFormatted) ^
      const DeepCollectionEquality().hash(fromPrice) ^
      const DeepCollectionEquality().hash(toPrice) ^
      const DeepCollectionEquality().hash(payWhatYouWant) ^
      const DeepCollectionEquality().hash(buyNowUrl) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(testMode) ^
      runtimeType.hashCode;
}

extension $Product$AttributesExtension on Product$Attributes {
  Product$Attributes copyWith(
      {int? storeId,
      String? name,
      String? slug,
      String? description,
      enums.Product$AttributesStatus? status,
      String? statusFormatted,
      String? thumbUrl,
      String? largeThumbUrl,
      int? price,
      String? priceFormatted,
      int? fromPrice,
      int? toPrice,
      bool? payWhatYouWant,
      String? buyNowUrl,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? testMode}) {
    return Product$Attributes(
        storeId: storeId ?? this.storeId,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        description: description ?? this.description,
        status: status ?? this.status,
        statusFormatted: statusFormatted ?? this.statusFormatted,
        thumbUrl: thumbUrl ?? this.thumbUrl,
        largeThumbUrl: largeThumbUrl ?? this.largeThumbUrl,
        price: price ?? this.price,
        priceFormatted: priceFormatted ?? this.priceFormatted,
        fromPrice: fromPrice ?? this.fromPrice,
        toPrice: toPrice ?? this.toPrice,
        payWhatYouWant: payWhatYouWant ?? this.payWhatYouWant,
        buyNowUrl: buyNowUrl ?? this.buyNowUrl,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        testMode: testMode ?? this.testMode);
  }

  Product$Attributes copyWithWrapped(
      {Wrapped<int?>? storeId,
      Wrapped<String?>? name,
      Wrapped<String?>? slug,
      Wrapped<String?>? description,
      Wrapped<enums.Product$AttributesStatus?>? status,
      Wrapped<String?>? statusFormatted,
      Wrapped<String?>? thumbUrl,
      Wrapped<String?>? largeThumbUrl,
      Wrapped<int?>? price,
      Wrapped<String?>? priceFormatted,
      Wrapped<int?>? fromPrice,
      Wrapped<int?>? toPrice,
      Wrapped<bool?>? payWhatYouWant,
      Wrapped<String?>? buyNowUrl,
      Wrapped<DateTime?>? createdAt,
      Wrapped<DateTime?>? updatedAt,
      Wrapped<bool?>? testMode}) {
    return Product$Attributes(
        storeId: (storeId != null ? storeId.value : this.storeId),
        name: (name != null ? name.value : this.name),
        slug: (slug != null ? slug.value : this.slug),
        description:
            (description != null ? description.value : this.description),
        status: (status != null ? status.value : this.status),
        statusFormatted: (statusFormatted != null
            ? statusFormatted.value
            : this.statusFormatted),
        thumbUrl: (thumbUrl != null ? thumbUrl.value : this.thumbUrl),
        largeThumbUrl:
            (largeThumbUrl != null ? largeThumbUrl.value : this.largeThumbUrl),
        price: (price != null ? price.value : this.price),
        priceFormatted: (priceFormatted != null
            ? priceFormatted.value
            : this.priceFormatted),
        fromPrice: (fromPrice != null ? fromPrice.value : this.fromPrice),
        toPrice: (toPrice != null ? toPrice.value : this.toPrice),
        payWhatYouWant: (payWhatYouWant != null
            ? payWhatYouWant.value
            : this.payWhatYouWant),
        buyNowUrl: (buyNowUrl != null ? buyNowUrl.value : this.buyNowUrl),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
        testMode: (testMode != null ? testMode.value : this.testMode));
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Relationships {
  const Product$Relationships({
    this.store,
    this.variants,
  });

  factory Product$Relationships.fromJson(Map<String, dynamic> json) =>
      _$Product$RelationshipsFromJson(json);

  static const toJsonFactory = _$Product$RelationshipsToJson;
  Map<String, dynamic> toJson() => _$Product$RelationshipsToJson(this);

  @JsonKey(name: 'store')
  final Product$Relationships$Store? store;
  @JsonKey(name: 'variants')
  final Product$Relationships$Variants? variants;
  static const fromJsonFactory = _$Product$RelationshipsFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Relationships &&
            (identical(other.store, store) ||
                const DeepCollectionEquality().equals(other.store, store)) &&
            (identical(other.variants, variants) ||
                const DeepCollectionEquality()
                    .equals(other.variants, variants)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(store) ^
      const DeepCollectionEquality().hash(variants) ^
      runtimeType.hashCode;
}

extension $Product$RelationshipsExtension on Product$Relationships {
  Product$Relationships copyWith(
      {Product$Relationships$Store? store,
      Product$Relationships$Variants? variants}) {
    return Product$Relationships(
        store: store ?? this.store, variants: variants ?? this.variants);
  }

  Product$Relationships copyWithWrapped(
      {Wrapped<Product$Relationships$Store?>? store,
      Wrapped<Product$Relationships$Variants?>? variants}) {
    return Product$Relationships(
        store: (store != null ? store.value : this.store),
        variants: (variants != null ? variants.value : this.variants));
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Links {
  const Product$Links({
    this.self,
  });

  factory Product$Links.fromJson(Map<String, dynamic> json) =>
      _$Product$LinksFromJson(json);

  static const toJsonFactory = _$Product$LinksToJson;
  Map<String, dynamic> toJson() => _$Product$LinksToJson(this);

  @JsonKey(name: 'self')
  final String? self;
  static const fromJsonFactory = _$Product$LinksFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Links &&
            (identical(other.self, self) ||
                const DeepCollectionEquality().equals(other.self, self)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(self) ^ runtimeType.hashCode;
}

extension $Product$LinksExtension on Product$Links {
  Product$Links copyWith({String? self}) {
    return Product$Links(self: self ?? this.self);
  }

  Product$Links copyWithWrapped({Wrapped<String?>? self}) {
    return Product$Links(self: (self != null ? self.value : this.self));
  }
}

@JsonSerializable(explicitToJson: true)
class ProductsIdGet$Response$Jsonapi {
  const ProductsIdGet$Response$Jsonapi({
    this.version,
  });

  factory ProductsIdGet$Response$Jsonapi.fromJson(Map<String, dynamic> json) =>
      _$ProductsIdGet$Response$JsonapiFromJson(json);

  static const toJsonFactory = _$ProductsIdGet$Response$JsonapiToJson;
  Map<String, dynamic> toJson() => _$ProductsIdGet$Response$JsonapiToJson(this);

  @JsonKey(name: 'version')
  final String? version;
  static const fromJsonFactory = _$ProductsIdGet$Response$JsonapiFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProductsIdGet$Response$Jsonapi &&
            (identical(other.version, version) ||
                const DeepCollectionEquality().equals(other.version, version)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(version) ^ runtimeType.hashCode;
}

extension $ProductsIdGet$Response$JsonapiExtension
    on ProductsIdGet$Response$Jsonapi {
  ProductsIdGet$Response$Jsonapi copyWith({String? version}) {
    return ProductsIdGet$Response$Jsonapi(version: version ?? this.version);
  }

  ProductsIdGet$Response$Jsonapi copyWithWrapped({Wrapped<String?>? version}) {
    return ProductsIdGet$Response$Jsonapi(
        version: (version != null ? version.value : this.version));
  }
}

@JsonSerializable(explicitToJson: true)
class ProductsIdGet$Response$Links {
  const ProductsIdGet$Response$Links({
    this.self,
  });

  factory ProductsIdGet$Response$Links.fromJson(Map<String, dynamic> json) =>
      _$ProductsIdGet$Response$LinksFromJson(json);

  static const toJsonFactory = _$ProductsIdGet$Response$LinksToJson;
  Map<String, dynamic> toJson() => _$ProductsIdGet$Response$LinksToJson(this);

  @JsonKey(name: 'self')
  final String? self;
  static const fromJsonFactory = _$ProductsIdGet$Response$LinksFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProductsIdGet$Response$Links &&
            (identical(other.self, self) ||
                const DeepCollectionEquality().equals(other.self, self)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(self) ^ runtimeType.hashCode;
}

extension $ProductsIdGet$Response$LinksExtension
    on ProductsIdGet$Response$Links {
  ProductsIdGet$Response$Links copyWith({String? self}) {
    return ProductsIdGet$Response$Links(self: self ?? this.self);
  }

  ProductsIdGet$Response$Links copyWithWrapped({Wrapped<String?>? self}) {
    return ProductsIdGet$Response$Links(
        self: (self != null ? self.value : this.self));
  }
}

@JsonSerializable(explicitToJson: true)
class ProductsGet$Response$Meta {
  const ProductsGet$Response$Meta({
    this.page,
  });

  factory ProductsGet$Response$Meta.fromJson(Map<String, dynamic> json) =>
      _$ProductsGet$Response$MetaFromJson(json);

  static const toJsonFactory = _$ProductsGet$Response$MetaToJson;
  Map<String, dynamic> toJson() => _$ProductsGet$Response$MetaToJson(this);

  @JsonKey(name: 'page')
  final ProductsGet$Response$Meta$Page? page;
  static const fromJsonFactory = _$ProductsGet$Response$MetaFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProductsGet$Response$Meta &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(page) ^ runtimeType.hashCode;
}

extension $ProductsGet$Response$MetaExtension on ProductsGet$Response$Meta {
  ProductsGet$Response$Meta copyWith({ProductsGet$Response$Meta$Page? page}) {
    return ProductsGet$Response$Meta(page: page ?? this.page);
  }

  ProductsGet$Response$Meta copyWithWrapped(
      {Wrapped<ProductsGet$Response$Meta$Page?>? page}) {
    return ProductsGet$Response$Meta(
        page: (page != null ? page.value : this.page));
  }
}

@JsonSerializable(explicitToJson: true)
class ProductsGet$Response$Jsonapi {
  const ProductsGet$Response$Jsonapi({
    this.version,
  });

  factory ProductsGet$Response$Jsonapi.fromJson(Map<String, dynamic> json) =>
      _$ProductsGet$Response$JsonapiFromJson(json);

  static const toJsonFactory = _$ProductsGet$Response$JsonapiToJson;
  Map<String, dynamic> toJson() => _$ProductsGet$Response$JsonapiToJson(this);

  @JsonKey(name: 'version')
  final String? version;
  static const fromJsonFactory = _$ProductsGet$Response$JsonapiFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProductsGet$Response$Jsonapi &&
            (identical(other.version, version) ||
                const DeepCollectionEquality().equals(other.version, version)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(version) ^ runtimeType.hashCode;
}

extension $ProductsGet$Response$JsonapiExtension
    on ProductsGet$Response$Jsonapi {
  ProductsGet$Response$Jsonapi copyWith({String? version}) {
    return ProductsGet$Response$Jsonapi(version: version ?? this.version);
  }

  ProductsGet$Response$Jsonapi copyWithWrapped({Wrapped<String?>? version}) {
    return ProductsGet$Response$Jsonapi(
        version: (version != null ? version.value : this.version));
  }
}

@JsonSerializable(explicitToJson: true)
class ProductsGet$Response$Links {
  const ProductsGet$Response$Links({
    this.first,
    this.last,
  });

  factory ProductsGet$Response$Links.fromJson(Map<String, dynamic> json) =>
      _$ProductsGet$Response$LinksFromJson(json);

  static const toJsonFactory = _$ProductsGet$Response$LinksToJson;
  Map<String, dynamic> toJson() => _$ProductsGet$Response$LinksToJson(this);

  @JsonKey(name: 'first')
  final String? first;
  @JsonKey(name: 'last')
  final String? last;
  static const fromJsonFactory = _$ProductsGet$Response$LinksFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProductsGet$Response$Links &&
            (identical(other.first, first) ||
                const DeepCollectionEquality().equals(other.first, first)) &&
            (identical(other.last, last) ||
                const DeepCollectionEquality().equals(other.last, last)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(first) ^
      const DeepCollectionEquality().hash(last) ^
      runtimeType.hashCode;
}

extension $ProductsGet$Response$LinksExtension on ProductsGet$Response$Links {
  ProductsGet$Response$Links copyWith({String? first, String? last}) {
    return ProductsGet$Response$Links(
        first: first ?? this.first, last: last ?? this.last);
  }

  ProductsGet$Response$Links copyWithWrapped(
      {Wrapped<String?>? first, Wrapped<String?>? last}) {
    return ProductsGet$Response$Links(
        first: (first != null ? first.value : this.first),
        last: (last != null ? last.value : this.last));
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Relationships$Store {
  const Product$Relationships$Store({
    this.links,
  });

  factory Product$Relationships$Store.fromJson(Map<String, dynamic> json) =>
      _$Product$Relationships$StoreFromJson(json);

  static const toJsonFactory = _$Product$Relationships$StoreToJson;
  Map<String, dynamic> toJson() => _$Product$Relationships$StoreToJson(this);

  @JsonKey(name: 'links')
  final Product$Relationships$Store$Links? links;
  static const fromJsonFactory = _$Product$Relationships$StoreFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Relationships$Store &&
            (identical(other.links, links) ||
                const DeepCollectionEquality().equals(other.links, links)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(links) ^ runtimeType.hashCode;
}

extension $Product$Relationships$StoreExtension on Product$Relationships$Store {
  Product$Relationships$Store copyWith(
      {Product$Relationships$Store$Links? links}) {
    return Product$Relationships$Store(links: links ?? this.links);
  }

  Product$Relationships$Store copyWithWrapped(
      {Wrapped<Product$Relationships$Store$Links?>? links}) {
    return Product$Relationships$Store(
        links: (links != null ? links.value : this.links));
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Relationships$Variants {
  const Product$Relationships$Variants({
    this.links,
  });

  factory Product$Relationships$Variants.fromJson(Map<String, dynamic> json) =>
      _$Product$Relationships$VariantsFromJson(json);

  static const toJsonFactory = _$Product$Relationships$VariantsToJson;
  Map<String, dynamic> toJson() => _$Product$Relationships$VariantsToJson(this);

  @JsonKey(name: 'links')
  final Product$Relationships$Variants$Links? links;
  static const fromJsonFactory = _$Product$Relationships$VariantsFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Relationships$Variants &&
            (identical(other.links, links) ||
                const DeepCollectionEquality().equals(other.links, links)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(links) ^ runtimeType.hashCode;
}

extension $Product$Relationships$VariantsExtension
    on Product$Relationships$Variants {
  Product$Relationships$Variants copyWith(
      {Product$Relationships$Variants$Links? links}) {
    return Product$Relationships$Variants(links: links ?? this.links);
  }

  Product$Relationships$Variants copyWithWrapped(
      {Wrapped<Product$Relationships$Variants$Links?>? links}) {
    return Product$Relationships$Variants(
        links: (links != null ? links.value : this.links));
  }
}

@JsonSerializable(explicitToJson: true)
class ProductsGet$Response$Meta$Page {
  const ProductsGet$Response$Meta$Page({
    this.currentPage,
    this.from,
    this.lastPage,
    this.perPage,
    this.to,
    this.total,
  });

  factory ProductsGet$Response$Meta$Page.fromJson(Map<String, dynamic> json) =>
      _$ProductsGet$Response$Meta$PageFromJson(json);

  static const toJsonFactory = _$ProductsGet$Response$Meta$PageToJson;
  Map<String, dynamic> toJson() => _$ProductsGet$Response$Meta$PageToJson(this);

  @JsonKey(name: 'currentPage')
  final int? currentPage;
  @JsonKey(name: 'from')
  final int? from;
  @JsonKey(name: 'lastPage')
  final int? lastPage;
  @JsonKey(name: 'perPage')
  final int? perPage;
  @JsonKey(name: 'to')
  final int? to;
  @JsonKey(name: 'total')
  final int? total;
  static const fromJsonFactory = _$ProductsGet$Response$Meta$PageFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProductsGet$Response$Meta$Page &&
            (identical(other.currentPage, currentPage) ||
                const DeepCollectionEquality()
                    .equals(other.currentPage, currentPage)) &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.lastPage, lastPage) ||
                const DeepCollectionEquality()
                    .equals(other.lastPage, lastPage)) &&
            (identical(other.perPage, perPage) ||
                const DeepCollectionEquality()
                    .equals(other.perPage, perPage)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(currentPage) ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(lastPage) ^
      const DeepCollectionEquality().hash(perPage) ^
      const DeepCollectionEquality().hash(to) ^
      const DeepCollectionEquality().hash(total) ^
      runtimeType.hashCode;
}

extension $ProductsGet$Response$Meta$PageExtension
    on ProductsGet$Response$Meta$Page {
  ProductsGet$Response$Meta$Page copyWith(
      {int? currentPage,
      int? from,
      int? lastPage,
      int? perPage,
      int? to,
      int? total}) {
    return ProductsGet$Response$Meta$Page(
        currentPage: currentPage ?? this.currentPage,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        perPage: perPage ?? this.perPage,
        to: to ?? this.to,
        total: total ?? this.total);
  }

  ProductsGet$Response$Meta$Page copyWithWrapped(
      {Wrapped<int?>? currentPage,
      Wrapped<int?>? from,
      Wrapped<int?>? lastPage,
      Wrapped<int?>? perPage,
      Wrapped<int?>? to,
      Wrapped<int?>? total}) {
    return ProductsGet$Response$Meta$Page(
        currentPage:
            (currentPage != null ? currentPage.value : this.currentPage),
        from: (from != null ? from.value : this.from),
        lastPage: (lastPage != null ? lastPage.value : this.lastPage),
        perPage: (perPage != null ? perPage.value : this.perPage),
        to: (to != null ? to.value : this.to),
        total: (total != null ? total.value : this.total));
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Relationships$Store$Links {
  const Product$Relationships$Store$Links({
    this.related,
    this.self,
  });

  factory Product$Relationships$Store$Links.fromJson(
          Map<String, dynamic> json) =>
      _$Product$Relationships$Store$LinksFromJson(json);

  static const toJsonFactory = _$Product$Relationships$Store$LinksToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Relationships$Store$LinksToJson(this);

  @JsonKey(name: 'related')
  final String? related;
  @JsonKey(name: 'self')
  final String? self;
  static const fromJsonFactory = _$Product$Relationships$Store$LinksFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Relationships$Store$Links &&
            (identical(other.related, related) ||
                const DeepCollectionEquality()
                    .equals(other.related, related)) &&
            (identical(other.self, self) ||
                const DeepCollectionEquality().equals(other.self, self)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(related) ^
      const DeepCollectionEquality().hash(self) ^
      runtimeType.hashCode;
}

extension $Product$Relationships$Store$LinksExtension
    on Product$Relationships$Store$Links {
  Product$Relationships$Store$Links copyWith({String? related, String? self}) {
    return Product$Relationships$Store$Links(
        related: related ?? this.related, self: self ?? this.self);
  }

  Product$Relationships$Store$Links copyWithWrapped(
      {Wrapped<String?>? related, Wrapped<String?>? self}) {
    return Product$Relationships$Store$Links(
        related: (related != null ? related.value : this.related),
        self: (self != null ? self.value : this.self));
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Relationships$Variants$Links {
  const Product$Relationships$Variants$Links({
    this.related,
    this.self,
  });

  factory Product$Relationships$Variants$Links.fromJson(
          Map<String, dynamic> json) =>
      _$Product$Relationships$Variants$LinksFromJson(json);

  static const toJsonFactory = _$Product$Relationships$Variants$LinksToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Relationships$Variants$LinksToJson(this);

  @JsonKey(name: 'related')
  final String? related;
  @JsonKey(name: 'self')
  final String? self;
  static const fromJsonFactory = _$Product$Relationships$Variants$LinksFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Relationships$Variants$Links &&
            (identical(other.related, related) ||
                const DeepCollectionEquality()
                    .equals(other.related, related)) &&
            (identical(other.self, self) ||
                const DeepCollectionEquality().equals(other.self, self)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(related) ^
      const DeepCollectionEquality().hash(self) ^
      runtimeType.hashCode;
}

extension $Product$Relationships$Variants$LinksExtension
    on Product$Relationships$Variants$Links {
  Product$Relationships$Variants$Links copyWith(
      {String? related, String? self}) {
    return Product$Relationships$Variants$Links(
        related: related ?? this.related, self: self ?? this.self);
  }

  Product$Relationships$Variants$Links copyWithWrapped(
      {Wrapped<String?>? related, Wrapped<String?>? self}) {
    return Product$Relationships$Variants$Links(
        related: (related != null ? related.value : this.related),
        self: (self != null ? self.value : this.self));
  }
}

String? product$AttributesStatusNullableToJson(
    enums.Product$AttributesStatus? product$AttributesStatus) {
  return product$AttributesStatus?.value;
}

String? product$AttributesStatusToJson(
    enums.Product$AttributesStatus product$AttributesStatus) {
  return product$AttributesStatus.value;
}

enums.Product$AttributesStatus product$AttributesStatusFromJson(
  Object? product$AttributesStatus, [
  enums.Product$AttributesStatus? defaultValue,
]) {
  return enums.Product$AttributesStatus.values
          .firstWhereOrNull((e) => e.value == product$AttributesStatus) ??
      defaultValue ??
      enums.Product$AttributesStatus.swaggerGeneratedUnknown;
}

enums.Product$AttributesStatus? product$AttributesStatusNullableFromJson(
  Object? product$AttributesStatus, [
  enums.Product$AttributesStatus? defaultValue,
]) {
  if (product$AttributesStatus == null) {
    return null;
  }
  return enums.Product$AttributesStatus.values
          .firstWhereOrNull((e) => e.value == product$AttributesStatus) ??
      defaultValue;
}

String product$AttributesStatusExplodedListToJson(
    List<enums.Product$AttributesStatus>? product$AttributesStatus) {
  return product$AttributesStatus?.map((e) => e.value!).join(',') ?? '';
}

List<String> product$AttributesStatusListToJson(
    List<enums.Product$AttributesStatus>? product$AttributesStatus) {
  if (product$AttributesStatus == null) {
    return [];
  }

  return product$AttributesStatus.map((e) => e.value!).toList();
}

List<enums.Product$AttributesStatus> product$AttributesStatusListFromJson(
  List? product$AttributesStatus, [
  List<enums.Product$AttributesStatus>? defaultValue,
]) {
  if (product$AttributesStatus == null) {
    return defaultValue ?? [];
  }

  return product$AttributesStatus
      .map((e) => product$AttributesStatusFromJson(e.toString()))
      .toList();
}

List<enums.Product$AttributesStatus>?
    product$AttributesStatusNullableListFromJson(
  List? product$AttributesStatus, [
  List<enums.Product$AttributesStatus>? defaultValue,
]) {
  if (product$AttributesStatus == null) {
    return defaultValue;
  }

  return product$AttributesStatus
      .map((e) => product$AttributesStatusFromJson(e.toString()))
      .toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
          body: DateTime.parse((response.body as String).replaceAll('"', ''))
              as ResultType);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
