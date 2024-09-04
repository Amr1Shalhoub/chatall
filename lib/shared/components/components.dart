

//import 'dart:html';



import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger_design2/layout/shop_app/shop_app_cubit/cubit.dart';
import 'package:messenger_design2/models/shop_app/favorites_model.dart';
import 'package:messenger_design2/modules/news_app/web_view/web_view_screen.dart';
import 'package:messenger_design2/modules/shop_app/search/cubit/cubit.dart';
//import 'package:messenger_design2/modules/web_view/web_view_screen.dart';
import 'package:messenger_design2/shared/cubit/cubit.dart';
import 'package:messenger_design2/shared/styles/colors.dart';
//import 'package:messenger_design2/modules/login/login_screen.dart';
//import 'package:messenger_design2/modules/shop_app/search/cubit/cubit.dart';

class CustomButton extends StatelessWidget {
   CustomButton({
   required this.text,
    this.backgroundcolor=Colors.blue,
    required this.onpress

    }) ;


  VoidCallback onpress;
  Color backgroundcolor;
  String text;


  @override
  Widget build(BuildContext context) {
    return     Container(
      width: double.infinity,
      color:backgroundcolor,
      child: MaterialButton(
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        onPressed:onpress,

      ),
    );
  }
}












class defaultFormField extends StatelessWidget {
   TextEditingController controller;
   TextInputType type;
  //final Function() validate;
 //  Function? onChange;
    String label;
    IconData prefix;
     ValueChanged<String>? onChange;
     //FunctionStringCallback() validate;
  // ValueSetter validate;
   String? Function(String?)? validate;

   void Function(String)? onSubmit;
   bool isPassword;
   IconData? suffix;
   VoidCallback? sufficfunction;
   VoidCallback? ontap;
   bool isClickable;





   defaultFormField({
     required this.prefix,
     required this.type,
     required this.controller,
     required this.validate,
       this.onChange,
     required this.label,
     this.onSubmit,
     this.isPassword=false,
     this.suffix,
     this.sufficfunction,
     this.ontap,
     this.isClickable=true,
   }) ;

  @override
  Widget build(BuildContext context) {
    return         TextFormField(
      enabled:isClickable ,
      controller: controller,
      keyboardType: type,
      onChanged: onChange,
       onFieldSubmitted:onSubmit,
      obscureText: isPassword,
      onTap: ontap,



      //   print(value);
      //
      // },
   //   onChanged: onChange(),
     // validator: validate!(),
      validator:validate,

      decoration: InputDecoration(

          labelText: label,
          border:OutlineInputBorder(),
          prefixIcon:Icon(
            prefix
          ),
        suffixIcon:suffix !=null ? IconButton(  onPressed:sufficfunction , icon: Icon(suffix)) : null,

      ),
    );
  }
}



Widget defaultformfield(
{
  @required  TextEditingController? controller,
  @required TextInputType? type,
  Function? onSubmit,
  Function? onChange,
  @required Function? validate,
  @required String? label,
  @required IconData? prefix,





}
    )

{

  return        TextFormField(
    controller: controller,
    keyboardType: type,
   // onFieldSubmitted: onSubmit,
   // onChanged: onChange,
   // validator: validate,

    decoration: InputDecoration(

        labelText: 'Email',
        border:OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
        )

    ),
  );


}





Widget defaultButton (
{
  double width=double.infinity,
  Color background=Colors.blue,
  required VoidCallback function,
  //required  Function function,
  required String text,
  bool isUpperCase=false,
  




}
    )=>  Container(
  width: width,
  height: 40,
  color:background,
  child: MaterialButton(
      child: isUpperCase==true ? Text(
        text.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ):Text(text,style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),),
      onPressed:function,

  ),
);
Widget defaultButton1 (
    {
      double width=double.infinity,
      Color background=Colors.blue,
     required VoidCallback function,
     // required  Function function,
      required String text,
      bool isUpperCase=false,





    }
    )=>  Container(
  width: width,
  color:background,
  child: MaterialButton(
    child: isUpperCase==true ? Text(
      text.toUpperCase(),
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
    ):Text(text,style: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
    ),),
    onPressed:function,

  ),
);
Widget buildTasksItem(Map model,context)=>Dismissible(
  key: Key(model['id'].toString()),
  onDismissed: (direction)
  {
    AppCubit.get(context).deleteData(id:model['id'] );

  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        CircleAvatar(

          radius:40.0,

          child: Text(

              '${model['time']}'

          ),

        ),

        SizedBox(width: 20.0,),

        Expanded(

          child: Column(

            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(

                '${model['title']}',

                style: TextStyle(

                  fontSize: 18.0,

                  fontWeight: FontWeight.bold,



                ),

              ),

              SizedBox(height: 10.0,),

              Text(

                '${model['date']}',

                style: TextStyle(

                    fontSize: 18.0,

                    color: Colors.grey





                ),

              ),



            ],

          ),

        ),

        SizedBox(width: 20.0,),

        IconButton(

            onPressed:(){

              AppCubit.get(context).updateData(status: 'done', id:model['id'],);

            },

            icon:Icon(

              Icons.check_box,

              color: Colors.green,

            )

        ),

        IconButton(

            onPressed:(){

              AppCubit.get(context).updateData(status: 'archive', id:model['id'],);

            },

            icon:Icon(

              Icons.archive,

              color: Colors.black45,

            )

        ),







      ],

      // child: Text(

      //   'New Tasks',style:TextStyle(

      //   fontSize: 25.0,

      //   fontWeight: FontWeight.bold,

      // ),

      // ),

    ),

  ),
);
Widget myDivider()=>Padding(
  padding: const EdgeInsetsDirectional.only(start: 20.0),
  child:   Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey,
  ),
);


AppBar defaultAppBar({
  required  BuildContext context,
  String title ='',
  List<Widget>? actions,

})=>AppBar(
  leading:IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: (){
      Navigator.pop(context);
    },
  ),
  titleSpacing: 5.0,

  title: Text(
      title
  ),
  actions: actions,

);

Widget defaultTextbutton({
  required VoidCallback function,
 required String text,
})=>TextButton(
    onPressed: function,
    child: Text(text),
);




Widget buildArticleItem(article,context)=>InkWell(
  onTap: ()
  {
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(
  
  
  
    padding: const EdgeInsets.all(20.0),
  
  
  
    child: Row(
  
  
  
      children: [
  
  
  
        Container(
  
  
  
          width: 120.0,
  
  
  
          height: 120.0,
  
  
  
          decoration: BoxDecoration(
  
  
  
            borderRadius: BorderRadius.circular(10.0),
  
  
  
            image: DecorationImage(
  
  
  
              image: NetworkImage('${article['urlToImage']}'),
  
  
  
              fit: BoxFit.cover,
  
  
  
            ),
  
  
  
  
  
  
  
          ),
  
  
  
        ),
  
  
  
        SizedBox(width: 20.0,),
  
  
  
        Expanded(
  
  
  
          child: Container(
  
  
  
            height: 120.0,
  
  
  
            child: Column(
  
  
  
                mainAxisSize: MainAxisSize.min,
  
  
  
              crossAxisAlignment: CrossAxisAlignment.start,
  
  
  
              mainAxisAlignment: MainAxisAlignment.start,
  
  
  
              children: [
  
  
  
                Expanded(
  
  
  
                  child: Text(
  
  
  
                    '${article['title']}',
  
  
  
                    maxLines: 3,
  
  
  
                    overflow: TextOverflow.ellipsis,
  
  
  
                    style: Theme.of(context).textTheme.bodyText1,
  
  
  
  
  
  
  
                  ),
  
  
  
                ),
  
  
  
                Expanded(
  
  
  
                  child: Text(
  
  
  
                    '${article['publishedAt']}',
  
  
  
                    maxLines: 1,
  
  
  
                    style: TextStyle(
  
  
  
                      fontSize: 18.0,
  
  
  
                      color: Colors.grey,
  
  
  
                      fontWeight: FontWeight.w600,
  
  
  
                    ),
  
  
  
  
  
  
  
                  ),
  
  
  
                ),
  
  
  
              ],
  
  
  
            ),
  
  
  
          ),
  
  
  
        )
  
  
  
      ],
  
  
  
    ),
  
  
  
  ),
);
Widget articalBuilder(list,context,{isSearch=false})=>ConditionalBuilder(
  condition: list.length>0,//state is! NewsGetScienceLoadingState,
  builder: (context)=>ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context,index)=>buildArticleItem(list[index],context),
    separatorBuilder: (context,index)=>myDivider(),
    itemCount: 10,
  ),
  fallback: (context)=>isSearch ?Container(): Center(child: CircularProgressIndicator()),
);
void navigateTo(context,widget)=> Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context)=>widget,
  ),
);
void navigateAndFinish(context,Widget)=>Navigator.pushAndRemoveUntil(context,
  MaterialPageRoute(
    builder: (context)=>Widget,
  ),
    (Route<dynamic> route)=>false,

);

Widget BuildListProduct( model,String text,context,{bool isOloPrice=true})=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    height: 120.0,
    child: Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [

        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image:NetworkImage('${model.image}'),
              //fit: BoxFit.cover,
              width: 100,
              height: 120,



            ),
            if(model.discount !=0&&isOloPrice)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                color: Colors.red,
                child: Text(
                  'Discount',style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white

                ),
                ),
              ),
          ],
        ),
        SizedBox(width: 20.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model.name}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    height: 1.3
                ),
              ),
              Spacer(),
              Row(
                children:
                [
                  Text(
                    '${model.price}',


                    style: TextStyle(
                      fontSize: 16.0,
                      color: defaultColor,

                      height: 1.3,

                    ),
                  ),
                  SizedBox(width: 5.0,),
                  if(model.discount!=0&& isOloPrice)
                    Text(
                      '${model.oldPrice}',


                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,

                        height: 1.3,

                      ),
                    ),
                  Spacer(),
                  IconButton(
                    // padding: EdgeInsets.zero,
                    onPressed: ()
                    {
                      ShopCubit.get(context).ChangeFavorites(model!.id!);
                      SearchCubit.get(context).Search(text);
                      // print(model.id);
                    },
                    icon: CircleAvatar(
                      radius: 15,
                      backgroundColor:ShopCubit.get(context).favorites[model!.id]?? false ? defaultColor:Colors.grey,

                      //true ? defaultColor:Colors.grey,
                      //ShopCubit.get(context).favorites[model.id]! ?defaultColor:Colors.grey,
                      //ShopCubit.get(context)!.favorites[model.id] ? defaultColor : Colors.grey,
                      child: Icon(Icons.favorite_border,color: Colors.white,),
                    ),
                  ),
                ],

              ),
            ],
          ),
        ),
      ],

    ),
  ),
);



// void navigateAndFinish(context,Widget)=>Navigator.pushAndRemoveUntil(
//     context,
//     MaterialPageRoute(builder:(context)=>Widget )
//     newRoute,
//     {(route) => false}
//
// )


 // builder:(context)=>Widget;
