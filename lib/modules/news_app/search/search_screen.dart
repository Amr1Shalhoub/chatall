import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/layout/cubit/cubit.dart';
import 'package:messenger_design2/layout/cubit/states.dart';
import 'package:messenger_design2/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  //const SearchScreen({Key? key}) : super(key: key);
var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var list =NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(

          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  prefix: Icons.search,
                  type: TextInputType.text,
                  controller: searchController,
                  validate: ( value)
                  {
                    if(value!.isEmpty)
                    {return 'Search must not be empty';}
                    return null;

                  },
                  onChange: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                  label: 'Search',
                ),
              ),
              Expanded(child: articalBuilder(list, context,isSearch: true)),
            ],
          ),
        );
      },

    );
  }
}
