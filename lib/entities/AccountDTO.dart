class AccountDTO {
  int? id;
  int? roleDTOID;
  String? roleName;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? image;
  String? active;
  bool? status;
  int? countNoCommentBill;
  String? eeeee;

  AccountDTO({
    this.id,
    this.roleDTOID,
    this.roleName,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.image,
    this.active,
    this.status,
    this.countNoCommentBill,
    this.eeeee,
  });

  AccountDTO.fromMap(Map<String, dynamic> map) {

      id: map['id'];
      roleDTOID: map['roleDTOID'];
      roleName: map['roleName'];
      firstName: map['firstName'];
      lastName: map['lastName'];
      email: map['email'];
      password: map['password'];
      phone: map['phone'];
      image: map['image'];
      active: map['active'];
      status: map['status'];
      countNoCommentBill: map['countNoCommentBill'];
      eeeee: map['eeeee'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id ?? 0,
      'roleDTOID': roleDTOID,
      'roleName': roleName,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phone': phone,
      'image': image,
      'active': active,
      'status': status,
      'countNoCommentBill': countNoCommentBill,
      'eeeee': eeeee,
    };
  }
}
