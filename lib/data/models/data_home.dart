class DataHomeModel {
  String? fullname;
  String? photoProfile;
  String? email;
  String? masakan;
  String? gambarMasakan;
  String? category;
  String? masDaerah;
  String? tag;
  String? youtube;

  DataHomeModel(
      {this.fullname,
      this.photoProfile,
      this.email,
      this.masakan,
      this.gambarMasakan,
      this.category,
      this.masDaerah,
      this.tag,
      this.youtube});

  DataHomeModel.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    photoProfile = json['photo_profile'];
    email = json['email'];
    masakan = json['masakan'];
    gambarMasakan = json['gambar_masakan'];
    category = json['category'];
    masDaerah = json['mas_daerah'];
    tag = json['tag'];
    youtube = json['youtube'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['photo_profile'] = this.photoProfile;
    data['email'] = this.email;
    data['masakan'] = this.masakan;
    data['gambar_masakan'] = this.gambarMasakan;
    data['category'] = this.category;
    data['mas_daerah'] = this.masDaerah;
    data['tag'] = this.tag;
    data['youtube'] = this.youtube;
    return data;
  }
}
