// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MassengerScreen extends StatelessWidget {
  const MassengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://th.bing.com/th/id/OIP.pI9-rC8D3f2akYRWQhWo1AHaLt?pid=ImgDet&rs=1',
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Chat',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 17,
              child: Icon(
                Icons.edit,
                size: 17,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
          IconButton(
            
            icon: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 17,
              child: Icon(
                Icons.camera_alt,
                size: 17,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
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
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'search',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 110,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 25,
                  ),
                  itemCount: 10,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) => buildChatItem()),
                separatorBuilder: ((context, index) => SizedBox(
                      height: 30,
                    )),
                itemCount: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/OIP.pI9-rC8D3f2akYRWQhWo1AHaLt?pid=ImgDet&rs=1',
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(
                  bottom: 2,
                  end: 2,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 7,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ahmad Mohammad ali ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ',
                        style: TextStyle(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CircleAvatar(
                        radius: 2,
                      ),
                    ),
                    Text(
                      '03:45 pm',
                      style: TextStyle(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  Widget buildStoryItem() => Container(
        width: 60,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/OIP.pI9-rC8D3f2akYRWQhWo1AHaLt?pid=ImgDet&rs=1',
                  ),
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 2,
                    end: 2,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 7,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Ahmadof mohammad',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(),
            ),
          ],
        ),
      );
}
