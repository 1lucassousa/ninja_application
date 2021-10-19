import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ninja_application/details.dart';
import 'package:ninja_application/ninja.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Ninja Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  Future request() async {
    var url = "https://naruto-api.herokuapp.com/api/v1/characters";

    var dio = Dio();

    var response = await dio.get(url);

    if (response.statusCode == 200) {
      return response.data;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Ninja> list = [];

    void inicializaLista(data) {
      list = (data as List).map((e) => Ninja.fromMap(e)).toList();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: Future(request),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            inicializaLista(snapshot.data);

            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(list[index].image),
                  ),
                  title: Text(list[index].name),
                  subtitle: Text(list[index].ocupacao + " | " + list[index].patenteNinja),
                  contentPadding: const EdgeInsets.all(5),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details(data: list[index])));
                  },
                );
              },
            );
          },
        ));
  }
}
