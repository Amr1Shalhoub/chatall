import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:messenger_design2/layout/shop_app/shop_app_cubit/cubit.dart';
import 'package:messenger_design2/modules/shop_app/search/cubit/cubit.dart';
import 'package:messenger_design2/modules/shop_app/search/cubit/states.dart';
import 'package:messenger_design2/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  //const SearchScreen({Key? key}) : super(key: key);
  var formkey=GlobalKey<FormState>();
  var searchController=TextEditingController();
  var text;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>SearchCubit(),

      child: BlocConsumer<SearchCubit,SearchStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          return Scaffold(
            appBar: AppBar(),
            body:Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultFormField(
                        prefix: Icons.search,
                        type: TextInputType.text,
                        controller: searchController,
                        validate: ( value)
                        {
                          if(value!.isEmpty)
                            {
                              return 'Enter a text to search';
                            }
                          return null;
                        },
                        label: 'Search',
                      onSubmit: (String value)
                      {
                        text=value;
                        SearchCubit.get(context).Search(value);
                      },

                    ),
                    SizedBox(height: 10.0,),
                    if(state is SearchLoadingState)
                    LinearProgressIndicator(),
                    SizedBox(height: 10.0,),
                    if(state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context,index)=> BuildListProduct(
                          // ShopCubit.get(context).favoritesModel.data!.data![index]

                            SearchCubit.get(context).model.data!.data![index], text,context,isOloPrice: false
                        ),
                        separatorBuilder: (context,index)=>myDivider(),
                        itemCount: SearchCubit.get(context).model.data!.data!.length,
                        //ShopCubit.get(context).categoriesModel.data.data.length,
                      ),
                    ),



                  ],
                ),
              ),
            )
          );

        },

      ),
    );
  }
}
