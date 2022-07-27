import 'package:json_annotation/json_annotation.dart';

part 'account_info.g.dart';

@JsonSerializable(explicitToJson: true)
class PersonInfo {
  int? id;
  String? email;
  String? password;
  String? fullname;
  String? phone;
  bool? gender;
  String? address;
  int? stationId;
  String? avatar;
  bool? isAdmin;
  Station? station;
  List<PackageOrders>? packageOrders;

  PersonInfo({this.id, this.email, this.password, this.fullname, this.phone, this.gender, this.address, this.stationId, this.avatar, this.isAdmin, this.station, this.packageOrders});

  factory PersonInfo.fromJson(Map<String, dynamic> json) => _$PersonInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Station {
  int? id;
  String? title;
  String? address;
  String? description;
  int? slotId;
  Slot? slot;
  List<String>? accounts;
  List<DeliveryTrips>? deliveryTrips;
  List<Workings>? workings;

  Station({this.id, this.title, this.address, this.description, this.slotId, this.slot, this.accounts, this.deliveryTrips, this.workings});

  factory Station.fromJson(Map<String, dynamic> json) => _$StationFromJson(json);

  Map<String, dynamic> toJson() => _$StationToJson(this);
}

@JsonSerializable()
class Slot {
  int? id;
  String? title;
  String? startTime;
  String? endTime;
  List<Orders>? orders;
  List<String>? stations;
  List<TimeFrames>? timeFrames;

  Slot({this.id, this.title, this.startTime, this.endTime, this.orders, this.stations, this.timeFrames});

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);

  Map<String, dynamic> toJson() => _$SlotToJson(this);
}

@JsonSerializable()
class Orders {
  int? id;
  int? pacakeOrderId;
  int? slotId;
  int? collectionId;
  int? deliveryTripId;
  String? day;
  String? status;
  List<OrderDetails>? orderDetails;

  Orders({this.id, this.pacakeOrderId, this.slotId, this.collectionId, this.deliveryTripId, this.day, this.status, this.orderDetails});

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersToJson(this);
}

@JsonSerializable()
class OrderDetails {
  int? productId;
  int? orderId;
  int? amount;
  int? price;
  Product? product;

  OrderDetails({this.productId, this.orderId, this.amount, this.price, this.product});

  factory OrderDetails.fromJson(Map<String, dynamic> json) => _$OrderDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);
}

@JsonSerializable()
class Product {
  int? id;
  String? img;
  String? title;
  String? description;
  String? active;
  int? categoryId;
  int? supplierId;
  Category? category;
  Supplier? supplier;
  List<String>? orderDetails;
  List<ProductInCollections>? productInCollections;

  Product({this.id, this.img, this.title, this.description, this.active, this.categoryId, this.supplierId, this.category, this.supplier, this.orderDetails, this.productInCollections});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Category {
  int? id;
  String? img;
  String? title;
  String? description;
  bool? active;
  List<String>? categoryInPackages;
  List<String>? products;

  Category({this.id, this.img, this.title, this.description, this.active, this.categoryInPackages, this.products});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Supplier {
  int? id;
  String? companyName;
  List<String>? products;

  Supplier({this.id, this.companyName, this.products});

  factory Supplier.fromJson(Map<String, dynamic> json) => _$SupplierFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierToJson(this);
}

@JsonSerializable()
class ProductInCollections {
  int? productId;
  int? collectionId;

  ProductInCollections({this.productId, this.collectionId});

  factory ProductInCollections.fromJson(Map<String, dynamic> json) => _$ProductInCollectionsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductInCollectionsToJson(this);
}

@JsonSerializable()
class TimeFrames {
  int? id;
  int? slotId;
  List<PackageItems>? packageItems;

  TimeFrames({this.id, this.slotId, this.packageItems});

  factory TimeFrames.fromJson(Map<String, dynamic> json) => _$TimeFramesFromJson(json);

  Map<String, dynamic> toJson() => _$TimeFramesToJson(this);
}
@JsonSerializable()
class PackageItems {
  int? packageId;
  int? collectionId;
  int? dayMode;
  int? timeFramId;
  Collection? collection;

  PackageItems({this.packageId, this.collectionId, this.dayMode, this.timeFramId, this.collection});

  factory PackageItems.fromJson(Map<String, dynamic> json) => _$PackageItemsFromJson(json);

  Map<String, dynamic> toJson() => _$PackageItemsToJson(this);
}

@JsonSerializable()
class Collection {
  int? id;
  int? productId;
  String? description;
  List<String>? packageItems;
  List<ProductInCollections>? productInCollections;

  Collection({this.id, this.productId, this.description, this.packageItems, this.productInCollections});

  factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}

@JsonSerializable()
class DeliveryTrips {
  int? id;
  int? deliveryManId;
  int? storeId;
  int? stationId;
  DeliveryMan? deliveryMan;
  Store? store;
  List<Orders>? orders;

  DeliveryTrips({this.id, this.deliveryManId, this.storeId, this.stationId, this.deliveryMan, this.store, this.orders});

  factory DeliveryTrips.fromJson(Map<String, dynamic> json) => _$DeliveryTripsFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryTripsToJson(this);
}

@JsonSerializable()
class DeliveryMan {
  int? id;
  String? img;
  String? username;
  String? password;
  String? fullName;
  String? phone;
  List<String>? deliveryTrips;
  List<String>? workings;

  DeliveryMan({this.id, this.img, this.username, this.password, this.fullName, this.phone, this.deliveryTrips, this.workings});

  factory DeliveryMan.fromJson(Map<String, dynamic> json) => _$DeliveryManFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryManToJson(this);
}

@JsonSerializable()
class Store {
  int? id;
  String? address;
  String? title;
  List<String>? deliveryTrips;

  Store({this.id, this.address, this.title, this.deliveryTrips});

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}

@JsonSerializable()
class Workings {
  int? stationId;
  int? deliveryManId;
  DeliveryMan? deliveryMan;

  Workings({this.stationId, this.deliveryManId, this.deliveryMan});

  factory Workings.fromJson(Map<String, dynamic> json) => _$WorkingsFromJson(json);

  Map<String, dynamic> toJson() => _$WorkingsToJson(this);
}

@JsonSerializable()
class PackageOrders {
  int? id;
  String? startTime;
  String? endTime;
  String? fullName;
  int? stationId;
  String? phone;
  String? email;
  String? description;
  int? paymentId;
  int? customerId;
  int? packageId;
  int? total;
  Package? package;
  Payment? payment;
  List<Orders>? orders;

  PackageOrders({this.id, this.startTime, this.endTime, this.fullName, this.stationId, this.phone, this.email, this.description, this.paymentId, this.customerId, this.packageId, this.total, this.package, this.payment, this.orders});

  factory PackageOrders.fromJson(Map<String, dynamic> json) => _$PackageOrdersFromJson(json);

  Map<String, dynamic> toJson() => _$PackageOrdersToJson(this);
}

@JsonSerializable()
class Package {
  int? id;
  String? title;
  String? img;
  String? description;
  int? price;
  List<CategoryInPackages>? categoryInPackages;
  List<PackageItems>? packageItems;
  List<String>? packageOrders;

  Package({this.id, this.title, this.img, this.description, this.price, this.categoryInPackages, this.packageItems, this.packageOrders});

  factory Package.fromJson(Map<String, dynamic> json) => _$PackageFromJson(json);

  Map<String, dynamic> toJson() => _$PackageToJson(this);
}

@JsonSerializable()
class CategoryInPackages {
  int? categoryId;
  int? packageId;
  Category? category;

  CategoryInPackages({this.categoryId, this.packageId, this.category});

  factory CategoryInPackages.fromJson(Map<String, dynamic> json) => _$CategoryInPackagesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryInPackagesToJson(this);
}

@JsonSerializable()
class Payment {
  int? id;
  List<String>? packageOrders;

  Payment({this.id, this.packageOrders});

  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
