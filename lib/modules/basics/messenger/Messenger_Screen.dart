// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/10/09/00/55/lotus-978659_960_720.jpg'),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
                'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.camera_alt,
                  size: 20.0,
                  color: Colors.white,
                ),
              ),
          ),
          IconButton(
            onPressed: (){},
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                size: 17.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[400],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Search',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 15.0,
                  ),
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildStoryItem(),
                  itemCount: 6,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 20.0,
                ),
                itemBuilder: (context, index) => buildChatItem(),
                itemCount: 10,
              ),

            ],
          ),
        ),
      ),
    );
  }
  //Build item
  Widget buildChatItem(){
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://pbs.twimg.com/media/EgMXj2cX0AAXfg7.jpg',
              ),
              radius: 30.0,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 4.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ahmed Emad',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'hello here you are hello here you are hello here you are hello here you are ',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                      height: 4.0,
                      width: 4.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    '12:00 Pm',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget buildStoryItem(){
    return Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                    'images/ahmed.jpg'
                ),
                radius: 30.0,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom:3.0,
                  end: 2.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
          Text(
            'Ahmed Abdalla Mohemedy',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
