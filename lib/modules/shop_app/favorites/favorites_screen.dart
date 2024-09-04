import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/models/shop_app/favorites_model.dart';
import 'package:messenger_design2/shared/styles/colors.dart';

import '../../../layout/shop_app/shop_app_cubit/cubit.dart';
import '../../../layout/shop_app/shop_app_cubit/states.dart';
import '../../../shared/components/components.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        return ConditionalBuilder(
          condition: state is! ShopLoadingGetFavoritesState,
          builder:(context)=> ListView.separated(
            itemBuilder: (context,index)=> BuildFavItem(
               // ShopCubit.get(context).favoritesModel.data!.data![index]
              ShopCubit.get(context).favoritesModel.data!.data![index],context
            ),
            separatorBuilder: (context,index)=>myDivider(),
            itemCount: ShopCubit.get(context).favoritesModel.data!.data!.length,
            //ShopCubit.get(context).categoriesModel.data.data.length,
          ),
          fallback:(context)=> Center(child: CircularProgressIndicator()),
        );
      },

    );
  }

  Widget BuildFavItem(FavoritesData model,context)=>Padding(
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
                image:NetworkImage('${model.product?.image}'),
                //fit: BoxFit.cover,
                width: 100,
                height: 120,



              ),
              if(model.product?.discount !=0)
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
                  '${model.product?.name}',
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
                      '${model.product?.price}',


                      style: TextStyle(
                        fontSize: 16.0,
                        color: defaultColor,

                        height: 1.3,

                      ),
                    ),
                    SizedBox(width: 5.0,),
                    if(model.product?.discount!=0)
                      Text(
                        '${model.product?.oldPrice}',


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
                         ShopCubit.get(context).ChangeFavorites(model.product!.id!);
                        // print(model.id);
                      },
                      icon: CircleAvatar(
                        radius: 15,
                        backgroundColor:ShopCubit.get(context).favorites[model.product!.id]!? defaultColor:Colors.grey,

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
}
