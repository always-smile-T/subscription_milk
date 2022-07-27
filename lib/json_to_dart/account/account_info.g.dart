// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonInfo _$PersonInfoFromJson(Map<String, dynamic> json) => PersonInfo(
      id: json['id'] as int?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      fullname: json['fullname'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as bool?,
      address: json['address'] as String?,
      stationId: json['stationId'] as int?,
      avatar: json['avatar'] as String?,
      isAdmin: json['isAdmin'] as bool?,
      station: json['station'] == null
          ? null
          : Station.fromJson(json['station'] as Map<String, dynamic>),
      packageOrders: (json['packageOrders'] as List<dynamic>?)
          ?.map((e) => PackageOrders.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PersonInfoToJson(PersonInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'fullname': instance.fullname,
      'phone': instance.phone,
      'gender': instance.gender,
      'address': instance.address,
      'stationId': instance.stationId,
      'avatar': instance.avatar,
      'isAdmin': instance.isAdmin,
      'station': instance.station?.toJson(),
      'packageOrders': instance.packageOrders?.map((e) => e.toJson()).toList(),
    };

Station _$StationFromJson(Map<String, dynamic> json) => Station(
      id: json['id'] as int?,
      title: json['title'] as String?,
      address: json['address'] as String?,
      description: json['description'] as String?,
      slotId: json['slotId'] as int?,
      slot: json['station'] == null
          ? null
          : Slot.fromJson(json['station'] as Map<String, dynamic>),
      accounts: (json['accounts'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      deliveryTrips: (json['deliveryTrips'] as List<dynamic>?)
          ?.map((e) => DeliveryTrips.fromJson(e as Map<String, dynamic>))
          .toList(),
      workings: (json['workings'] as List<dynamic>?)
          ?.map((e) => Workings.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StationToJson(Station instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'address': instance.address,
      'description': instance.description,
      'slotId': instance.slotId,
      'station': instance.slot?.toJson(),
      'accounts': instance.accounts,
      'deliveryTrips': instance.deliveryTrips?.map((e) => e.toJson()).toList(),
      'workings': instance.workings?.map((e) => e.toJson()).toList(),
    };

Slot _$SlotFromJson(Map<String, dynamic> json) => Slot(
      id: json['id'] as int?,
      title: json['title'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => Orders.fromJson(e as Map<String, dynamic>))
          .toList(),
      stations: (json['stations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      timeFrames: (json['timeFrames'] as List<dynamic>?)
          ?.map((e) => TimeFrames.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SlotToJson(Slot instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'orders': instance.orders,
      'stations': instance.stations,
      'timeFrames': instance.timeFrames,
    };

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
      id: json['id'] as int?,
      pacakeOrderId: json['pacakeOrderId'] as int?,
      slotId: json['slotId'] as int?,
      collectionId: json['collectionId'] as int?,
      deliveryTripId: json['deliveryTripId'] as int?,
      day: json['day'] as String?,
      status: json['status'] as String?,
      orderDetails: (json['orderDetails'] as List<dynamic>?)
          ?.map((e) => OrderDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'id': instance.id,
      'pacakeOrderId': instance.pacakeOrderId,
      'slotId': instance.slotId,
      'collectionId': instance.collectionId,
      'deliveryTripId': instance.deliveryTripId,
      'day': instance.day,
      'status': instance.status,
      'orderDetails': instance.orderDetails,
    };

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) => OrderDetails(
      productId: json['productId'] as int?,
      orderId: json['orderId'] as int?,
      amount: json['amount'] as int?,
      price: json['price'] as int?,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'orderId': instance.orderId,
      'amount': instance.amount,
      'price': instance.price,
      'product': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int?,
      img: json['img'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      active: json['active'] as String?,
      categoryId: json['categoryId'] as int?,
      supplierId: json['supplierId'] as int?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      supplier: json['supplier'] == null
          ? null
          : Supplier.fromJson(json['supplier'] as Map<String, dynamic>),
      orderDetails: (json['orderDetails'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      productInCollections: (json['productInCollections'] as List<dynamic>?)
          ?.map((e) => ProductInCollections.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'title': instance.title,
      'description': instance.description,
      'active': instance.active,
      'categoryId': instance.categoryId,
      'supplierId': instance.supplierId,
      'category': instance.category,
      'supplier': instance.supplier,
      'orderDetails': instance.orderDetails,
      'productInCollections': instance.productInCollections,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int?,
      img: json['img'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      active: json['active'] as bool?,
      categoryInPackages: (json['categoryInPackages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'title': instance.title,
      'description': instance.description,
      'active': instance.active,
      'categoryInPackages': instance.categoryInPackages,
      'products': instance.products,
    };

Supplier _$SupplierFromJson(Map<String, dynamic> json) => Supplier(
      id: json['id'] as int?,
      companyName: json['companyName'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SupplierToJson(Supplier instance) => <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'products': instance.products,
    };

ProductInCollections _$ProductInCollectionsFromJson(
        Map<String, dynamic> json) =>
    ProductInCollections(
      productId: json['productId'] as int?,
      collectionId: json['collectionId'] as int?,
    );

Map<String, dynamic> _$ProductInCollectionsToJson(
        ProductInCollections instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'collectionId': instance.collectionId,
    };

TimeFrames _$TimeFramesFromJson(Map<String, dynamic> json) => TimeFrames(
      id: json['id'] as int?,
      slotId: json['slotId'] as int?,
      packageItems: (json['packageItems'] as List<dynamic>?)
          ?.map((e) => PackageItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TimeFramesToJson(TimeFrames instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slotId': instance.slotId,
      'packageItems': instance.packageItems,
    };

PackageItems _$PackageItemsFromJson(Map<String, dynamic> json) => PackageItems(
      packageId: json['packageId'] as int?,
      collectionId: json['collectionId'] as int?,
      dayMode: json['dayMode'] as int?,
      timeFramId: json['timeFramId'] as int?,
      collection: json['collection'] == null
          ? null
          : Collection.fromJson(json['collection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PackageItemsToJson(PackageItems instance) =>
    <String, dynamic>{
      'packageId': instance.packageId,
      'collectionId': instance.collectionId,
      'dayMode': instance.dayMode,
      'timeFramId': instance.timeFramId,
      'collection': instance.collection,
    };

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      id: json['id'] as int?,
      productId: json['productId'] as int?,
      description: json['description'] as String?,
      packageItems: (json['packageItems'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      productInCollections: (json['productInCollections'] as List<dynamic>?)
          ?.map((e) => ProductInCollections.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'description': instance.description,
      'packageItems': instance.packageItems,
      'productInCollections': instance.productInCollections,
    };

DeliveryTrips _$DeliveryTripsFromJson(Map<String, dynamic> json) =>
    DeliveryTrips(
      id: json['id'] as int?,
      deliveryManId: json['deliveryManId'] as int?,
      storeId: json['storeId'] as int?,
      stationId: json['stationId'] as int?,
      deliveryMan: json['deliveryMan'] == null
          ? null
          : DeliveryMan.fromJson(json['deliveryMan'] as Map<String, dynamic>),
      store: json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => Orders.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeliveryTripsToJson(DeliveryTrips instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deliveryManId': instance.deliveryManId,
      'storeId': instance.storeId,
      'stationId': instance.stationId,
      'deliveryMan': instance.deliveryMan,
      'store': instance.store,
      'orders': instance.orders,
    };

DeliveryMan _$DeliveryManFromJson(Map<String, dynamic> json) => DeliveryMan(
      id: json['id'] as int?,
      img: json['img'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      fullName: json['fullName'] as String?,
      phone: json['phone'] as String?,
      deliveryTrips: (json['deliveryTrips'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      workings: (json['workings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DeliveryManToJson(DeliveryMan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'username': instance.username,
      'password': instance.password,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'deliveryTrips': instance.deliveryTrips,
      'workings': instance.workings,
    };

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      id: json['id'] as int?,
      address: json['address'] as String?,
      title: json['title'] as String?,
      deliveryTrips: (json['deliveryTrips'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'title': instance.title,
      'deliveryTrips': instance.deliveryTrips,
    };

Workings _$WorkingsFromJson(Map<String, dynamic> json) => Workings(
      stationId: json['stationId'] as int?,
      deliveryManId: json['deliveryManId'] as int?,
      deliveryMan: json['deliveryMan'] == null
          ? null
          : DeliveryMan.fromJson(json['deliveryMan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkingsToJson(Workings instance) => <String, dynamic>{
      'stationId': instance.stationId,
      'deliveryManId': instance.deliveryManId,
      'deliveryMan': instance.deliveryMan,
    };

PackageOrders _$PackageOrdersFromJson(Map<String, dynamic> json) =>
    PackageOrders(
      id: json['id'] as int?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      fullName: json['fullName'] as String?,
      stationId: json['stationId'] as int?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      description: json['description'] as String?,
      paymentId: json['paymentId'] as int?,
      customerId: json['customerId'] as int?,
      packageId: json['packageId'] as int?,
      total: json['total'] as int?,
      package: json['package'] == null
          ? null
          : Package.fromJson(json['package'] as Map<String, dynamic>),
      payment: json['payment'] == null
          ? null
          : Payment.fromJson(json['payment'] as Map<String, dynamic>),
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => Orders.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PackageOrdersToJson(PackageOrders instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'fullName': instance.fullName,
      'stationId': instance.stationId,
      'phone': instance.phone,
      'email': instance.email,
      'description': instance.description,
      'paymentId': instance.paymentId,
      'customerId': instance.customerId,
      'packageId': instance.packageId,
      'total': instance.total,
      'package': instance.package,
      'payment': instance.payment,
      'orders': instance.orders,
    };

Package _$PackageFromJson(Map<String, dynamic> json) => Package(
      id: json['id'] as int?,
      title: json['title'] as String?,
      img: json['img'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      categoryInPackages: (json['categoryInPackages'] as List<dynamic>?)
          ?.map((e) => CategoryInPackages.fromJson(e as Map<String, dynamic>))
          .toList(),
      packageItems: (json['packageItems'] as List<dynamic>?)
          ?.map((e) => PackageItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      packageOrders: (json['packageOrders'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PackageToJson(Package instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'img': instance.img,
      'description': instance.description,
      'price': instance.price,
      'categoryInPackages': instance.categoryInPackages,
      'packageItems': instance.packageItems,
      'packageOrders': instance.packageOrders,
    };

CategoryInPackages _$CategoryInPackagesFromJson(Map<String, dynamic> json) =>
    CategoryInPackages(
      categoryId: json['categoryId'] as int?,
      packageId: json['packageId'] as int?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryInPackagesToJson(CategoryInPackages instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'packageId': instance.packageId,
      'category': instance.category,
    };

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      id: json['id'] as int?,
      packageOrders: (json['packageOrders'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'id': instance.id,
      'packageOrders': instance.packageOrders,
    };
