
class PostModel{

  late String name;
  late String uId;
  late String image;
  late String dateTime;
  late String text;
  late String postImage;







  PostModel({

    this.name='',
    this.image='',

    this.uId='',
    this.dateTime='',

    this.text='',

    this.postImage='',



  });
  PostModel.fromjson(Map<String,dynamic> json)
  {
    name=json['name'];
    image=json['image'];
    uId=json['uId'];
    dateTime=json['dateTime'];
    text=json['text'];
    postImage=json['postImage'];


  }
  Map<String,dynamic> toMap()
  {
    return {
      'name':name,
      'image':image,
      'uId':uId,
      'dateTime':dateTime,
      'text':text,
      'postImage':postImage,
    };
  }




}















