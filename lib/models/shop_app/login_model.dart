

class ShopLoginModel
{
 late   String message;
 late bool status;
 late UserData data;
ShopLoginModel.fromJson(Map<String,dynamic> json)
{
  status=json['status'];
  message=json['message']??'';
 // data=(json['data'] !=null ?  UserData.fromJson(json['data']): null) as UserData;
 // data=(json['data'] !=null ?  UserData.fromJson(json['data']): {'': dynamic }) as UserData;
  //data=json['data'] !=null ? UserData.fromJson(json['data']):UserData.fromJson(json['data']) ;
  if (json['data'] !=null) {
    data = UserData.fromJson(json['data']);
  } else {
    data = UserData();
  }



  // if (json['data'] !=null) {
  //   data = UserData.fromJson(json['data']);
  // } else {
  //   data = null!;
  // }
}

}
class UserData
{
  int   id=0;
   String name='';
 String email='';
 String phone='';
  String image='';
   int points=1000;
   int  credit=1000;
   String? token;

 UserData({
   this.id=0,
   this.email='',
   this.name='',
   this.phone='',
   this.image='',
   this.credit=1000,
   this.points=1000,

   this.token='',
 }



     );
 UserData.fromJson(Map<String,dynamic> json)
 {
   id=json['id'];
   email=json['email'];
   name=json['name'];
   phone=json['phone'];
   image=json['image'];
   credit=json['credit']??0;
   points=json['points']??0;
   token=json['token'];
 }
}