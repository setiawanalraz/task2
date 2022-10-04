import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task2/food_list.dart';

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
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Famous Foods",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                background: Image.network(
                  "https://images.pexels.com/photos/1640773/pexels-photo-1640773.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    return progress == null ? child : LinearProgressIndicator();
                  },
                  semanticLabel: "Sliver App Bar",
                ),
                centerTitle: true,
              ),
              backgroundColor: Colors.black26,
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
