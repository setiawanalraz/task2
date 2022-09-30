import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 240,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Famous Foods",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                background: Image.network(
                  "https://images.pexels.com/photos/1640773/pexels-photo-1640773.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  fit: BoxFit.cover,
                ),
                centerTitle: true,
              ),
              backgroundColor: Colors.black12,
              floating: true,
            ),
          ],
          body: FoodLists(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FoodLists extends StatefulWidget {
  @override
  State<FoodLists> createState() => _FoodListsState();
}

class _FoodListsState extends State<FoodLists> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(20),
            height: 350,
            color: Colors.black12,
            child: Column(
              children: [
                Image.network(data[index]["image"]),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  // alignment: WrapAlignment.start,
                  spacing: 8,
                  runSpacing: 4,
                  direction: Axis.horizontal,
                  children: [
                    Text(
                      data[index]["name"],
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        Text(
                          data[index]["likes"].toString(),
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.comment,
                          color: Colors.blue,
                        ),
                        Text(
                          data[index]["comments"].toString(),
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
