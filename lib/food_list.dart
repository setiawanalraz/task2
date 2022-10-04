import 'package:flutter/material.dart';
import 'data.dart';

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
            color: Colors.white70,
            child: Column(
              children: [
                Image.network(
                  data[index]["image"],
                  loadingBuilder: (context, child, progress) {
                    return progress == null ? child : LinearProgressIndicator();
                  },
                ),
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
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
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
