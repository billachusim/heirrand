import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String? orderNumber;
  String? userId;
  String? customerName;
  String? customerPhone;
  String? itemsDescription;
  String? deliveryAddress;
  String? pickUpAddress;
  int? numberOfItems;
  Timestamp? dateOfOrder;
  String? statusOfOrder;
  String? totalForOrder;
  String? anyMoreInfo;
  String? vehicleType;

  OrderModel({
    this.orderNumber,
    this.userId,
    this.customerName,
    this.customerPhone,
    this.itemsDescription,
    this.deliveryAddress,
    this.pickUpAddress,
    this.numberOfItems,
    this.dateOfOrder,
    this.statusOfOrder,
    this.totalForOrder,
    this.anyMoreInfo,
    this.vehicleType,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderNumber: map['orderNumber'] ?? '',
      userId: map['userId'] ?? '',
      customerName: map['customerName'] ?? '',
      customerPhone: map['customerPhone'] ?? '',
      itemsDescription: map['itemsDescription'] ?? '',
      anyMoreInfo: map['anyMoreInfo'] ?? '',
      pickUpAddress: map['pickUpAddress'] ?? '',
      deliveryAddress: map['deliveryAddress'] ?? '',
      numberOfItems: map['numberOfItems'] ?? 0,
      dateOfOrder: map['dateOfOrder'],
      statusOfOrder: map['statusOfOrder'] ?? '',
      totalForOrder: map['totalForOrder'] ?? '',
      vehicleType: map['vehicleType'] ?? '',
    );
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderNumber: json['orderNumber'] ?? '',
      userId: json['userId'] ?? '',
      customerName: json['customerName'] ?? '',
      customerPhone: json['customerPhone'] ?? '',
      itemsDescription: json['itemsDescription'] ?? '',
      anyMoreInfo: json['anyMoreInfo'] ?? '',
      pickUpAddress: json['pickUpAddress'] ?? '',
      deliveryAddress: json['deliveryAddress'] ?? '',
      numberOfItems: json['numberOfItems'] ?? 0,
      dateOfOrder: json['dateOfOrder'],
      statusOfOrder: json['statusOfOrder'] ?? '',
      totalForOrder: json['totalForOrder'] ?? '',
    );
  }

  ///converts the Timestamp in each session to a DateTime Object
  DateTime? get dateTime => dateOfOrder!.toDate();
}
