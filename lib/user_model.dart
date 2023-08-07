class UserModel {
  String? email;
  String? phone;
  String? firstName;
  String? lastName;
  String? birthdate;
  String? patientID;
  String?  registrationNumber;
  String? about;
  String?  education ;
  String?  addrees;
  String? uId;
  String? image;
  String? cover;
  String? bio;
  bool? isEmailVerified ;

  UserModel(
      {
        this.uId,
        this.phone,
        this.firstName,
        this.lastName,
        this.email,
        this.image,
        this.cover,
        this.bio,
        this.isEmailVerified,
        this.birthdate,
        this.patientID,
        this.registrationNumber,
        this.about,
        this.education,
        this.addrees,

      });

  UserModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    registrationNumber = json['registrationNumber'];
    about = json['about'];
    education = json['education'];
    addrees = json['addrees'];
    patientID = json['patientID'];
    birthdate=json['birthdate'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
    isEmailVerified = json['isEmailVerified'];
  }
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'patientID': patientID,
      'birthdate':birthdate ,
      'registrationNumber' :registrationNumber,
     'about':about,
      'education' :education ,
      'addrees' : addrees,
      'uId': uId,
      'image': image,
      'cover': cover,
      'bio': bio,
      'isEmailVerified': isEmailVerified,
    };
  }
}