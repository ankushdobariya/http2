import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http2/data.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
  home: postapi(),));
}

class postapi extends StatefulWidget {


  @override
  State<postapi> createState() => _postapiState();
}

class _postapiState extends State<postapi> {

  List<mydata> list = [];
  mydata? m;

  getdata() async {
    var url = Uri.parse('https://ankushflutter.000webhostapp.com/demo1.php');
    var response = await http.post(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map<String, dynamic> result = jsonDecode(response.body);

    setState(() {
      m = mydata.fromJson(result);
    });
  }
  //


  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
                itemCount: m!.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${m!.data![index].id}"),

                  );
                },),
        );
    }
  }
