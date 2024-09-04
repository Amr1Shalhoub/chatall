
class SocialUserModel{

 late String name;
late  String email;
 late String phone;
 late String uId;
 late String image;
 late String cover;

 late String bio;




 SocialUserModel({

   this.email='',
   this.name='',
   this.phone='',
   this.image='',
   this.cover='',

   this.uId='',
   this.bio='',


 });
 SocialUserModel.fromjson(Map<String,dynamic> json)
 {
   email=json['email'];
   name=json['name'];
   phone=json['phone'];
   image=json['image'];
   cover=json['cover'];

   bio=json['bio'];

   uId=json['uId'];

 }
 Map<String,dynamic> toMap()
 {
   return {
     'name':name,
     'email':email,
     'phone':phone,
     'image':image,
     'cover':cover,
     'bio':bio,
     'uId':uId,



   };
 }




}















