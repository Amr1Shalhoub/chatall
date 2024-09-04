import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:messenger_design2/layout/shop_app/shop_app_cubit/cubit.dart';
import 'package:messenger_design2/layout/shop_app/shop_app_cubit/states.dart';
import 'package:messenger_design2/models/shop_app/categories_model.dart';
import 'package:messenger_design2/models/shop_app/home_model.dart';
import 'package:messenger_design2/shared/components/constants.dart';
import 'package:messenger_design2/shared/styles/colors.dart';

class ProductsScreen extends StatelessWidget {
  //const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(

      listener: (context,state)
      {
        if(state is ShopSuccessChangeFavoritesState)
        {
          if(!state.model.status)
          {
            ScaffoldMessenger.of(context).showSnackBar(ShowSnackBar2('${state.model.message}'));


          //  Scaffold.of(context).ShowSnackBar1();
           // builder:(context)=>

         //  Scaffold.of(context). ShowSnackBar1(context);

           // SnackBar mySnackBar=SnackBar(content:Text('Hello') );


            // Fluttertoast.showToast(
            //     msg: "${state.model.message}",
            //     toastLength: Toast.LENGTH_LONG,
            //     gravity: ToastGravity.BOTTOM,
            //     timeInSecForIosWeb: 3,
            //     backgroundColor: Colors.red,
            //     textColor: Colors.white,
            //     fontSize: 16.0
            // );
          }


        }


      },
        builder: (context,state)
        {
          return ConditionalBuilder(
              condition:
              ShopCubit.get(context).homeModel.status!=false&&ShopCubit.get(context).categoriesModel.status!=false&&state is! ShopErrorGetCategoriesState&&state is! ShopErrorHomeDataState&&token!=null&&ShopCubit.get(context).userModel.data.token!=null,
             // state is ShopSuccessHomeDataState,
              builder: (context)=>ProductsBuilder(ShopCubit.get(context).homeModel,ShopCubit.get(context).categoriesModel,context),
              fallback: (context)=>Center(child: CircularProgressIndicator())
          );


        },


    );


    //   Center(
    //   child: Text
    //     ('Products Screen',
    //   style: Theme.of(context).textTheme.bodyText1,
    //
    //     ),
    // );
  }


  Widget ProductsBuilder(HomeModel model,CategoriesModel categoriesModel,context)=>SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        CarouselSlider(
          items:model.data.banners.map((e) =>
    Image(
    image: NetworkImage('${e.image}'),
    width: double.infinity,
    fit: BoxFit.cover,
    ),

    ).toList(),

          options: CarouselOptions(

            height: 250.0,
            initialPage: 0,
            viewportFraction: 1.0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,





          ),
        ),
        SizedBox(height: 10.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categories',style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w800,
              ),
              ),
              SizedBox(height: 10.0,),
       Container(
               height: 100.0,
               child: ListView.separated(
                 physics: BouncingScrollPhysics(),

                 scrollDirection: Axis.horizontal,

                   itemBuilder: (context,index)=>buildCategoryItem( categoriesModel.data.data[index]),
                   separatorBuilder: (context,index)=>SizedBox(width: 10.0,),
                   itemCount:categoriesModel.data.data.length,

               ),
       ),
              SizedBox(height: 30.0,),
              Text('New Products',style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w800,
              ),

              ),
            ],
          ),
        ),
        SizedBox(height: 10.0,),
        Container(
          color: Colors.grey[300],
          child: GridView.count(crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 1/1.55,
            physics: NeverScrollableScrollPhysics(),

            children:List.generate(model.data.products.length, (index) =>buildGridProduct(model.data.products[index],context),
            ),


          ),
        ),

      ],
    ),
  );
  Widget buildGridProduct(ProductModel model,context)=> Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [

        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image:NetworkImage('${model.image}'),
              width: double.infinity,
              height: 200.0,



            ),
            if(model.discount !=0)
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
        Padding(
          padding: const EdgeInsets.all(12.0),
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
              Row(
                children:
                [
                  Text(
                    '${model.price.round()}',


                    style: TextStyle(
                      fontSize: 16.0,
                      color: defaultColor,

                      height: 1.3,

                    ),
                  ),
                  SizedBox(width: 5.0,),
                  if(model.discount!=0)
                    Text(
                      '${model.old_price.round()}',


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
                      ShopCubit.get(context).ChangeFavorites(model.id);
                      print(model.id);
                    },
                    icon: CircleAvatar(
                      radius: 15,
                      backgroundColor:  ShopCubit.get(context).favorites[model.id]! ?defaultColor:Colors.grey,
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
  );


Widget buildCategoryItem(DataModel Model)=> Stack(
  alignment: AlignmentDirectional.bottomCenter,

  children:
  [
    Image(
      image:NetworkImage(Model.image),
      width: 100,
      height:100,
      fit:BoxFit.cover,
    ),
    Container(
      color: Colors.black.withOpacity(0.8),
      width: 100,
      child: Text(
        '${Model.name}',
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style:
        TextStyle(

          color: Colors.white,
        ),
      ),
    )


  ],
);

void ShowSnackBar(context,text)
{
  final snackBar=SnackBar(content: Text('$text',style: TextStyle(
    color: Colors.white,
    fontSize: 16.0,

  ),
    textAlign: TextAlign.center,
  ),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 3),
  );
 // Scaffold.of(context)..ShowSnackBar(snackBar,'');
}

Widget ShowSnackBar1(context)=>SnackBar(content: Text('Hello',style: TextStyle(color: Colors.white,fontSize: 16.0),

textAlign: TextAlign.center,

),
  backgroundColor: Colors.red,
  duration: Duration(seconds: 3),
);



SnackBar ShowSnackBar2(text)
{
  SnackBar snackbar= SnackBar(content: Text('$text',
    style: TextStyle(
        color: Colors.white,
        fontSize: 16.0


    ),



  ),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 3),

  );
  return snackbar;
}






}
