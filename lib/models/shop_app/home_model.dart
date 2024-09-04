class HomeModel
{
  bool status=false;
 late HomeDataModel data;
 HomeModel({this.status=false,});
 // BannerModel? Banner;


 //late BannerModel Banner;

//  HomeModel({
//    this.status=false,
//    this.data
//
// });

  HomeModel.fromJson(Map<String,dynamic> json)
  {

    status=json['status']??false;
    data=HomeDataModel.fromJson(json['data']);
  }



}



class HomeDataModel
{


   //List <BannerModel> banners= as List<BannerModel>;
// List<ProductModel> products=  as List<ProductModel>;
  //List <BannerModel>? banners;
 //List<ProductModel>? products;
// List<dynamic>banners=[];
 //List<dynamic>products=[];
 // var banners=List<BannerModel>.filled(0,null, growable:true);
  //List<Map<BannerModel,dynamic>> banners=[];
//  List<Map<BannerModel,dynamic>> products=[];
//List <BannerModel>banners=new List<BannerModel>();
 // List<Map<String,dynamic>>banners=<Map<String,dynamic>>[];
//List<Map<String,dynamic>>products=<Map<String,dynamic>>[];
//Set<BannerModel>banners=<BannerModel>[] as Set<BannerModel>;
//Set<ProductModel>products=<ProductModel>[] as Set<ProductModel>;
List<BannerModel>banners=[];
List<ProductModel>products=[];



 // List<BannerModel>banners;

 // List<ProductModel>products;




  //List<dynamic>banners=[];
 // List<dynamic>products=[];
   //List<BannerModel>? banners1=[];
 //  List<ProductModel>? products1=[];
 //BannerModel? Banners;
  // BannerModel? banners1=;
//HomeDataModel({required this.banners,required this.products,});


 HomeDataModel.fromJson( Map<String,dynamic> json)
 {
  // banners.add(BannerModel());
   //banners=<BannerModel>[];
 //  products=<ProductModel>[];


   json['banners'].forEach  ( (element) {
     //assert(element != null);
    // dynamic banners1=banners.contains(BannerModel(id: element.id,image: element.image));
    // element=banners1;
    // List<BannerModel> banners1=[element];
    // BannerModel Banner=new BannerModel();



      banners.add( BannerModel.fromJson(element));
      //insert(0, element);


      //banners1=banners.cast<BannerModel>();
     });
     json['products'].forEach((element){
      // assert(element != null);
      // dynamic products1=products;
       products.add( ProductModel.fromJson(element));
       //insert(0,element);

      // products1=products.cast<ProductModel>();
     });}






  // late List<BannerModel> banners=[];
  // late List<ProductModel> products=[];
  // HomeDataModel({required this.banners,required this.products});


  // factory HomeDataModel.fromJson(Map<String, dynamic> json) =>
  //     HomeDataModel(
  //       banners: json["banners"] == null ? [] : json["banners"],
  //     );
  // Map<String, dynamic> toJson() => {
  //   "banners": banners == null ? [] : banners,
  // };



  //HomeDataModel({this.banners,this.products});
 // late BannerModel Banner;
 //late BannerModel Banner1;




  //This is the correct right now
 // late List <dynamic> banners=[];
 // late List<dynamic> products=[];
 // HomeDataModel({required this.banners,required this.products,});
 //
 //
 //  HomeDataModel.fromJson(Map<String,dynamic> json)
 //  {
 //
 //
 //    json['banners'].forEach((element){
 //        banners.add(element) ;
 //      });
 //      json['products'].forEach((element){
 //        products.add(element);
 //      });

//This is the correct right now

//This is the experement

  // Map<String, dynamic> banners=[] as Map<String,dynamic>;
 //  Map<String, dynamic> products=[] as Map<String,dynamic>;
  //List<ProductModel> products=[] ;
 // late Map<String, dynamic> BannerModel;
 // late Map<String, dynamic> products;
 // late BannerModel Banner;
 // late ProductModel Product;
 //
 //
 //  HomeDataModel.fromJson(Map<String,dynamic> json)
 // {
 //   Banner=BannerModel.fromJson(json['banner']);
 //   Product=ProductModel.fromJson(json['product']);
 //
 //
 //
 //
 //
 //
 //   // json['banners'].forEach((element){
 //   //   (banners.add(element) ) as Map<String,dynamic>;
 //   //   }) as Map<String,dynamic>;
 //   //   json['products'].forEach((element){
 //   //     products.add(element);
 //   //   });
 //
 //
 //  }
  //This is the experement
  //
  //
  //
  //   json['banners'].forEach((element){
  //    // banners.asMap().addAll(<String,dynamic>element);
  //     //banners.add.runtimeType;
  //     banners.add(element);
  //   });
  //   json['products'].forEach((element){
  //    // products.add.runtimeType;
  //     //products.asMap().addAll(element);
  //   });






    // banners=json['banners'];
    // products=json['products'];
    // json['banners'].forEach((element){
    //   banners.add(element) ;
    // });
    // json['products'].forEach((element){
    //   products.add(element);
    // });
  }


class BannerModel
{
   int id =0;
    String image='';




 BannerModel(
{
  this.id=0,
  this.image='',
}
     );

  BannerModel.fromJson(Map<String,dynamic> json)
  {
    id=json['id']??0;
    image=json['image']??'';



  }
}
 class ProductModel
{
  int id=0;
  dynamic price=0;
  dynamic old_price=0;
  dynamic discount=0;
  String image='';
  String name='';
  bool in_favorites=false;
  bool in_cart=false;
  ProductModel({

   this.id=0,
    this.price=0,
    this.old_price=0,
    this.discount=0,
    this.name='',
    this.image='',
    this.in_favorites=false,
    this.in_cart=false,



});

  ProductModel.fromJson(Map<String,dynamic> json)
  {
    id=json['id']??0;
    price=json['price']??0;
    old_price=json['old_price']??0;
    discount=json['discount']??0;
    image=json['image']??'';
    name=json['name']??'';
    in_favorites=json['in_favorites']??false;
    in_cart=json['in_cart']??false;

  }
}
