import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart'
;
class User extends Equatable {
final List<dynamic> imageUrls;
final String name;
final int strength;
final String sugars;

const User({
  required this.imageUrls,
  required this.name,
  required this.strength,
  required this.sugars,
});

@override
List<Object> get props => [name, strength, sugars, imageUrls];
static User fromSnapshot(DocumentSnapshot snap) {
  User user = User(name: snap['name'],
  strength: snap['strength'],
  sugars: snap['sugars'],
  imageUrls: snap['imageUrls'],
   );
   return user;
}
}


