import 'package:flutter/material.dart';
import 'package:ninja_application/ninja.dart';

class Details extends StatelessWidget {
  const Details({Key? key, required this.data}) : super(key: key);

  final Ninja data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(data.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text(data.name)),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.about.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Text((index + 1).toString() + " - " + data.about[index]),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
