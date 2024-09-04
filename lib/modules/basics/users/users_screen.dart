import 'package:flutter/material.dart';
import 'package:messenger_design2/models/user/user_model.dart';


class UsersScreen extends StatelessWidget {
  List<UserModel> users = [

    UserModel(id: 1, name: 'Karam Aldamaksi', phone: '09885865665'),
    UserModel(id: 2, name: 'Alaa Amer', phone: '09565656558'),
    UserModel(id: 3, name: ' Odai Alarbeed', phone: '0954548154'),
    UserModel(id: 4, name: 'Ammar Mohsen', phone: ' 0944856566'),
    UserModel(id: 5, name: 'Ammar Alkattan', phone: '09885865665'),
    UserModel(id: 6, name: 'Ammar Kenaan', phone: '09885865665'),
    UserModel(id: 7, name: 'Zidon Alakel', phone: '09885865665'),
    UserModel(id: 8, name: 'Assel Abo ismaeel', phone: '09885865665'),

  ];
 // const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(
          'Users',style:
          TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,

          ),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context,index)=>buildUserItem(users[index]),
          separatorBuilder: (context,index)=>Padding(
            padding: const EdgeInsetsDirectional.only(start: 20.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount: users.length,
      )

    );
  }
  // 1. build item
  // 2. build list
  // 3. add item to list
  Widget buildUserItem(UserModel user){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.0,
            child: Text('${user.id}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),

            ),

          ),
          SizedBox(width: 20.0,),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${user.name}',style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              )
                ,
              ),
              Text('${user.phone}',style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              )
                ,
              ),

            ],
          )
        ],
      ),
    );
  }
}
