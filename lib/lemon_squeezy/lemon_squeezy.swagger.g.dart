// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lemon_squeezy.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      type: json['type'] as String?,
      id: json['id'] as String?,
      attributes: json['attributes'] == null
          ? null
          : Product$Attributes.fromJson(
              json['attributes'] as Map<String, dynamic>),
      relationships: json['relationships'] == null
          ? null
          : Product$Relationships.fromJson(
              json['relationships'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : Product$Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'attributes': instance.attributes?.toJson(),
      'relationships': instance.relationships?.toJson(),
      'links': instance.links?.toJson(),
    };

ProductsIdGet$Response _$ProductsIdGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ProductsIdGet$Response(
      jsonapi: json['jsonapi'] == null
          ? null
          : ProductsIdGet$Response$Jsonapi.fromJson(
              json['jsonapi'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : ProductsIdGet$Response$Links.fromJson(
              json['links'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Product.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsIdGet$ResponseToJson(
        ProductsIdGet$Response instance) =>
    <String, dynamic>{
      'jsonapi': instance.jsonapi?.toJson(),
      'links': instance.links?.toJson(),
      'data': instance.data?.toJson(),
    };

ProductsGet$Response _$ProductsGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ProductsGet$Response(
      meta: json['meta'] == null
          ? null
          : ProductsGet$Response$Meta.fromJson(
              json['meta'] as Map<String, dynamic>),
      jsonapi: json['jsonapi'] == null
          ? null
          : ProductsGet$Response$Jsonapi.fromJson(
              json['jsonapi'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : ProductsGet$Response$Links.fromJson(
              json['links'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ProductsGet$ResponseToJson(
        ProductsGet$Response instance) =>
    <String, dynamic>{
      'meta': instance.meta?.toJson(),
      'jsonapi': instance.jsonapi?.toJson(),
      'links': instance.links?.toJson(),
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

Product$Attributes _$Product$AttributesFromJson(Map<String, dynamic> json) =>
    Product$Attributes(
      storeId: (json['store_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      status: product$AttributesStatusNullableFromJson(json['status']),
      statusFormatted: json['status_formatted'] as String?,
      thumbUrl: json['thumb_url'] as String?,
      largeThumbUrl: json['large_thumb_url'] as String?,
      price: (json['price'] as num?)?.toInt(),
      priceFormatted: json['price_formatted'] as String?,
      fromPrice: (json['from_price'] as num?)?.toInt(),
      toPrice: (json['to_price'] as num?)?.toInt(),
      payWhatYouWant: json['pay_what_you_want'] as bool?,
      buyNowUrl: json['buy_now_url'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      testMode: json['test_mode'] as bool?,
    );

Map<String, dynamic> _$Product$AttributesToJson(Product$Attributes instance) =>
    <String, dynamic>{
      'store_id': instance.storeId,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'status': product$AttributesStatusNullableToJson(instance.status),
      'status_formatted': instance.statusFormatted,
      'thumb_url': instance.thumbUrl,
      'large_thumb_url': instance.largeThumbUrl,
      'price': instance.price,
      'price_formatted': instance.priceFormatted,
      'from_price': instance.fromPrice,
      'to_price': instance.toPrice,
      'pay_what_you_want': instance.payWhatYouWant,
      'buy_now_url': instance.buyNowUrl,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'test_mode': instance.testMode,
    };

Product$Relationships _$Product$RelationshipsFromJson(
        Map<String, dynamic> json) =>
    Product$Relationships(
      store: json['store'] == null
          ? null
          : Product$Relationships$Store.fromJson(
              json['store'] as Map<String, dynamic>),
      variants: json['variants'] == null
          ? null
          : Product$Relationships$Variants.fromJson(
              json['variants'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Product$RelationshipsToJson(
        Product$Relationships instance) =>
    <String, dynamic>{
      'store': instance.store?.toJson(),
      'variants': instance.variants?.toJson(),
    };

Product$Links _$Product$LinksFromJson(Map<String, dynamic> json) =>
    Product$Links(
      self: json['self'] as String?,
    );

Map<String, dynamic> _$Product$LinksToJson(Product$Links instance) =>
    <String, dynamic>{
      'self': instance.self,
    };

ProductsIdGet$Response$Jsonapi _$ProductsIdGet$Response$JsonapiFromJson(
        Map<String, dynamic> json) =>
    ProductsIdGet$Response$Jsonapi(
      version: json['version'] as String?,
    );

Map<String, dynamic> _$ProductsIdGet$Response$JsonapiToJson(
        ProductsIdGet$Response$Jsonapi instance) =>
    <String, dynamic>{
      'version': instance.version,
    };

ProductsIdGet$Response$Links _$ProductsIdGet$Response$LinksFromJson(
        Map<String, dynamic> json) =>
    ProductsIdGet$Response$Links(
      self: json['self'] as String?,
    );

Map<String, dynamic> _$ProductsIdGet$Response$LinksToJson(
        ProductsIdGet$Response$Links instance) =>
    <String, dynamic>{
      'self': instance.self,
    };

ProductsGet$Response$Meta _$ProductsGet$Response$MetaFromJson(
        Map<String, dynamic> json) =>
    ProductsGet$Response$Meta(
      page: json['page'] == null
          ? null
          : ProductsGet$Response$Meta$Page.fromJson(
              json['page'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsGet$Response$MetaToJson(
        ProductsGet$Response$Meta instance) =>
    <String, dynamic>{
      'page': instance.page?.toJson(),
    };

ProductsGet$Response$Jsonapi _$ProductsGet$Response$JsonapiFromJson(
        Map<String, dynamic> json) =>
    ProductsGet$Response$Jsonapi(
      version: json['version'] as String?,
    );

Map<String, dynamic> _$ProductsGet$Response$JsonapiToJson(
        ProductsGet$Response$Jsonapi instance) =>
    <String, dynamic>{
      'version': instance.version,
    };

ProductsGet$Response$Links _$ProductsGet$Response$LinksFromJson(
        Map<String, dynamic> json) =>
    ProductsGet$Response$Links(
      first: json['first'] as String?,
      last: json['last'] as String?,
    );

Map<String, dynamic> _$ProductsGet$Response$LinksToJson(
        ProductsGet$Response$Links instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
    };

Product$Relationships$Store _$Product$Relationships$StoreFromJson(
        Map<String, dynamic> json) =>
    Product$Relationships$Store(
      links: json['links'] == null
          ? null
          : Product$Relationships$Store$Links.fromJson(
              json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Product$Relationships$StoreToJson(
        Product$Relationships$Store instance) =>
    <String, dynamic>{
      'links': instance.links?.toJson(),
    };

Product$Relationships$Variants _$Product$Relationships$VariantsFromJson(
        Map<String, dynamic> json) =>
    Product$Relationships$Variants(
      links: json['links'] == null
          ? null
          : Product$Relationships$Variants$Links.fromJson(
              json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Product$Relationships$VariantsToJson(
        Product$Relationships$Variants instance) =>
    <String, dynamic>{
      'links': instance.links?.toJson(),
    };

ProductsGet$Response$Meta$Page _$ProductsGet$Response$Meta$PageFromJson(
        Map<String, dynamic> json) =>
    ProductsGet$Response$Meta$Page(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      from: (json['from'] as num?)?.toInt(),
      lastPage: (json['lastPage'] as num?)?.toInt(),
      perPage: (json['perPage'] as num?)?.toInt(),
      to: (json['to'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductsGet$Response$Meta$PageToJson(
        ProductsGet$Response$Meta$Page instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'from': instance.from,
      'lastPage': instance.lastPage,
      'perPage': instance.perPage,
      'to': instance.to,
      'total': instance.total,
    };

Product$Relationships$Store$Links _$Product$Relationships$Store$LinksFromJson(
        Map<String, dynamic> json) =>
    Product$Relationships$Store$Links(
      related: json['related'] as String?,
      self: json['self'] as String?,
    );

Map<String, dynamic> _$Product$Relationships$Store$LinksToJson(
        Product$Relationships$Store$Links instance) =>
    <String, dynamic>{
      'related': instance.related,
      'self': instance.self,
    };

Product$Relationships$Variants$Links
    _$Product$Relationships$Variants$LinksFromJson(Map<String, dynamic> json) =>
        Product$Relationships$Variants$Links(
          related: json['related'] as String?,
          self: json['self'] as String?,
        );

Map<String, dynamic> _$Product$Relationships$Variants$LinksToJson(
        Product$Relationships$Variants$Links instance) =>
    <String, dynamic>{
      'related': instance.related,
      'self': instance.self,
    };
