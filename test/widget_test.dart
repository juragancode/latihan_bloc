import 'package:equatable/equatable.dart';

void main() {
  Orang orang1 = Orang("John", 35);
  Orang orang2 = Orang("John", 35);

  print(orang1 == orang2);
  print(orang1.hashCode);
  print(orang2.hashCode);
}

class Orang extends Equatable {
  String nama;
  int umur;
  Orang(this.nama, this.umur);

  @override
  List<Object?> get props => [nama, umur];
}

  //-------------- TANPA EQUATABLE --------------
  // class Orang {
  // String nama;
  // int umur;
  // Orang(this.nama, this.umur);

  // @override
  // int get hashCode => nama.hashCode;

  // @override
  // bool operator ==(Object other) {
  //   return identical(this, other) ||
  //       other is Orang && this.nama == other.nama && this.umur == other.umur;
  // }

