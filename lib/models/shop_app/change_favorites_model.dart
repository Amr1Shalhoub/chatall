class ChangeFavoritesModel
{
  bool status=false;
  String message='';




  //ChangeFavoritesModel({this.status=false,this.message=''});

  ChangeFavoritesModel.fromJson(Map<String,dynamic>json)
  {
    status=json['status'];

    message=json['message'];
  }

}