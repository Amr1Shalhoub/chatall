import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        titleSpacing: 20,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://www.flowerwatch.com/assets/files/leader/rozen.jpg'),

            ),
            SizedBox(width: 15.0,),
            Text('Chats',
              style: TextStyle(
                color: Colors.black,

              ),
            )

          ],
        ),
        actions: [
          IconButton(onPressed:(){}, icon:
          CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.camera_alt,
              size: 16,
              color: Colors.white,
            ),
          ),
          ),
          IconButton(onPressed:(){}, icon:
          CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.edit,
              size: 16,
              color: Colors.white,
            ),
          ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[300],


                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.search,),
                    SizedBox(width: 15.0,),
                    Text(
                      'Search',
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
            Container(
              height: 100.0,
              child: ListView.separated(
              //  shrinkWrap: true, shrinkWrap helps us to build all the items on the screen at once
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return BuildStoryItem();

                  },
                itemCount: 5,
                separatorBuilder: (context,index)=>SizedBox(width: 20,),
              ),


            ),
            SizedBox(height: 40.0,),
            ListView.separated(

              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder:(context,index)=>BuildCharItem(),

                separatorBuilder:(context,index)=>SizedBox(height:20.0),


                itemCount: 15
                )
            /* SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      child: Column(

                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage('https://www.flowerwatch.com/assets/files/leader/rozen.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 3.0,
                                  end:3.0,
                                ),
                                child: CircleAvatar(
                                  radius: 5.0,
                                  backgroundColor: Colors.green,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                            'Amr Shalhoub',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.0
                            ),

                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Container(
                      width: 60,
                      child: Column(

                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage('https://www.flowerwatch.com/assets/files/leader/rozen.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 3.0,
                                  end:3.0,
                                ),
                                child: CircleAvatar(
                                  radius: 5.0,
                                  backgroundColor: Colors.green,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                            'Amr Shalhoub',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14.0
                            ),

                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Container(
                      width: 60,
                      child: Column(

                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage('https://www.flowerwatch.com/assets/files/leader/rozen.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 3.0,
                                  end:3.0,
                                ),
                                child: CircleAvatar(
                                  radius: 5.0,
                                  backgroundColor: Colors.green,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                            'Amr Shalhoub',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14.0
                            ),

                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Container(
                      width: 60,
                      child: Column(

                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage('https://www.flowerwatch.com/assets/files/leader/rozen.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 3.0,
                                  end:3.0,
                                ),
                                child: CircleAvatar(
                                  radius: 5.0,
                                  backgroundColor: Colors.green,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                            'Amr Shalhoub',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14.0
                            ),

                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Container(
                      width: 60,
                      child: Column(

                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage('https://www.flowerwatch.com/assets/files/leader/rozen.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 3.0,
                                  end:3.0,
                                ),
                                child: CircleAvatar(
                                  radius: 5.0,
                                  backgroundColor: Colors.green,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                            'Amr Shalhoub',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14.0
                            ),

                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Container(
                      width: 60,
                      child: Column(

                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage('https://www.flowerwatch.com/assets/files/leader/rozen.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 3.0,
                                  end:3.0,
                                ),
                                child: CircleAvatar(
                                  radius: 5.0,
                                  backgroundColor: Colors.green,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                            'Amr Shalhoub',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14.0
                            ),

                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Container(
                      width: 60,
                      child: Column(

                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage('https://www.flowerwatch.com/assets/files/leader/rozen.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 3.0,
                                  end:3.0,
                                ),
                                child: CircleAvatar(
                                  radius: 5.0,
                                  backgroundColor: Colors.green,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                            'Amr Shalhoub',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14.0
                            ),

                          )
                        ],
                      ),
                    ),
                  ],

                ),
              ),*/
/*
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20.0,),
                      Row(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage('https://www.flowerwatch.com/assets/files/leader/rozen.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 3.0,
                                  end:3.0,
                                ),
                                child: CircleAvatar(
                                  radius: 5.0,
                                  backgroundColor: Colors.green,
                                ),
                              )
                            ],
                          ),
                          SizedBox(width:20.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amr Shalhoub',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'hello',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,

                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Container(
                                        width: 6,
                                        height: 6,
                                        decoration: BoxDecoration(
                                          color:Colors.blue,
                                          shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Text(''
                                        '02:30 pm')
                                  ],

                                )
                              ],
                            ),
                          )

                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage('https://www.flowerwatch.com/assets/files/leader/rozen.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 3.0,
                                  end:3.0,
                                ),
                                child: CircleAvatar(
                                  radius: 5.0,
                                  backgroundColor: Colors.green,
                                ),
                              )
                            ],
                          ),
                          SizedBox(width:20.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amr Shalhoub',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'hello',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,

                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Container(
                                        width: 6,
                                        height: 6,
                                        decoration: BoxDecoration(
                                            color:Colors.blue,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Text(''
                                        '02:30 pm')
                                  ],

                                )
                              ],
                            ),
                          )

                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage('https://www.flowerwatch.com/assets/files/leader/rozen.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 3.0,
                                  end:3.0,
                                ),
                                child: CircleAvatar(
                                  radius: 5.0,
                                  backgroundColor: Colors.green,
                                ),
                              )
                            ],
                          ),
                          SizedBox(width:20.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amr Shalhoub',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'hello',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,

                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Container(
                                        width: 6,
                                        height: 6,
                                        decoration: BoxDecoration(
                                            color:Colors.blue,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Text(''
                                        '02:30 pm')
                                  ],

                                )
                              ],
                            ),
                          )

                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage('https://www.flowerwatch.com/assets/files/leader/rozen.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 3.0,
                                  end:3.0,
                                ),
                                child: CircleAvatar(
                                  radius: 5.0,
                                  backgroundColor: Colors.green,
                                ),
                              )
                            ],
                          ),
                          SizedBox(width:20.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amr Shalhoub',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'hello',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,

                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Container(
                                        width: 6,
                                        height: 6,
                                        decoration: BoxDecoration(
                                            color:Colors.blue,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Text(''
                                        '02:30 pm')
                                  ],

                                )
                              ],
                            ),
                          )

                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage('https://www.flowerwatch.com/assets/files/leader/rozen.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 3.0,
                                  end:3.0,
                                ),
                                child: CircleAvatar(
                                  radius: 5.0,
                                  backgroundColor: Colors.green,
                                ),
                              )
                            ],
                          ),
                          SizedBox(width:20.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amr Shalhoub',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'hello',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,

                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Container(
                                        width: 6,
                                        height: 6,
                                        decoration: BoxDecoration(
                                            color:Colors.blue,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Text(''
                                        '02:30 pm')
                                  ],

                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage('https://www.flowerwatch.com/assets/files/leader/rozen.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 3.0,
                                  end:3.0,
                                ),
                                child: CircleAvatar(
                                  radius: 5.0,
                                  backgroundColor: Colors.green,
                                ),
                              )
                            ],
                          ),
                          SizedBox(width:20.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amr Shalhoub',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'hello',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,

                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Container(
                                        width: 6,
                                        height: 6,
                                        decoration: BoxDecoration(
                                            color:Colors.blue,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Text(''
                                        '02:30 pm')
                                  ],

                                )
                              ],
                            ),
                          )

                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage('https://www.flowerwatch.com/assets/files/leader/rozen.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 3.0,
                                  end:3.0,
                                ),
                                child: CircleAvatar(
                                  radius: 5.0,
                                  backgroundColor: Colors.green,
                                ),
                              )
                            ],
                          ),
                          SizedBox(width:20.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amr Shalhoub',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'hello',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,

                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Container(
                                        width: 6,
                                        height: 6,
                                        decoration: BoxDecoration(
                                            color:Colors.blue,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Text(''
                                        '02:30 pm')
                                  ],

                                )
                              ],
                            ),
                          )

                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage('https://www.flowerwatch.com/assets/files/leader/rozen.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 3.0,
                                  end:3.0,
                                ),
                                child: CircleAvatar(
                                  radius: 5.0,
                                  backgroundColor: Colors.green,
                                ),
                              )
                            ],
                          ),
                          SizedBox(width:20.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amr Shalhoub',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'hello',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,

                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Container(
                                        width: 6,
                                        height: 6,
                                        decoration: BoxDecoration(
                                            color:Colors.blue,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Text(''
                                        '02:30 pm')
                                  ],

                                )
                              ],
                            ),
                          )

                        ],
                      ),
                    ],
                  ),
                ),
              ),*/
            ],

          ),
        ),
      ),

    );
  }
 Widget  BuildCharItem(){
    return          Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage('https://www.flowerwatch.com/assets/files/leader/rozen.jpg'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end:3.0,
              ),
              child: CircleAvatar(
                radius: 5.0,
                backgroundColor: Colors.green,
              ),
            )
          ],
        ),
        SizedBox(width:20.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Amr Shalhoub',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'hello',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                    ),
                  ),
                  SizedBox(width: 5.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color:Colors.blue,
                          shape: BoxShape.circle
                      ),
                    ),
                  ),
                  SizedBox(width: 5.0,),
                  Text(''
                      '02:30 pm')
                ],

              )
            ],
          ),
        )

      ],
    );
    /*return  Row(
      children: [
        Expanded(
          child: Text(
            'hello',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,

          ),
        ),
        SizedBox(width: 5.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
                color:Colors.blue,
                shape: BoxShape.circle
            ),
          ),
        ),
        SizedBox(width: 5.0,),
        Text(''
            '02:30 pm')
      ],

    );*/
  }
  Widget BuildStoryItem(){
    return   Container(
      width: 60,
      child: Column(

        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage('https://www.flowerwatch.com/assets/files/leader/rozen.jpg'),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end:3.0,
                ),
                child: CircleAvatar(
                  radius: 5.0,
                  backgroundColor: Colors.green,
                ),
              )
            ],
          ),
          SizedBox(height: 5.0,),
          Text(
            'Amr Shalhoub',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 14.0
            ),

          )
        ],
      ),
    );

  }
}
