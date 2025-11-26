import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  final String? id;
  final String title;
  final Timestamp? createdAt;
  final String? description;
  final num? price;

  TodoModel({
    this.id,
    required this.title,
    this.createdAt,
    this.description,
    this.price,
  });

  TodoModel copyWith({
    String? id,
    String? title,
    Timestamp? createdAt,
    String? description,
    num? price,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

 Map<String, dynamic> toMap() {
  return {
    'id': id,
    'title': title,
    'createdAt': createdAt,
    'description': description ?? '',
    'price': price,
  };
}



  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id']?.toString(),
      title: map['title']?.toString() ?? "",
      createdAt: map['createdAt'] is Timestamp 
    ? map['createdAt'] 
    : Timestamp.now(),

      description: map['description']?.toString() ?? "",
      price: map['price'] is num ? map['price'] : 0,
    );
  }
}
