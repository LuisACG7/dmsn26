class CastDAO {

  int? idCast;
  String? nameCast;
  String? birthCast;
  String? gender;

  CastDAO({this.idCast,this.nameCast,this.birthCast,this.gender,});

  factory CastDAO.fromMap(Map<String,dynamic> cast){
    return CastDAO(
      idCast: cast['idCast'],
      nameCast: cast['nameCast'],
      birthCast: cast['birthCast'],
      gender: cast['gender']
    );
  }
}