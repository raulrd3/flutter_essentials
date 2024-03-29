import 'package:flutter/material.dart';
import 'package:mtech_tut/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:mtech_tut/pages/login_page.dart';
import 'dart:convert';

import 'package:mtech_tut/utils/constants.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var myText = "Change My Name";
  // TextEditingController _nameController = TextEditingController();

  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome App"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
            ),
            onPressed: () {
              Constants.prefs.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
          ),
        ],
      ),
      body: data != null
          ? ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(data[index]["title"]),
                    subtitle: Text("ID: ${data[index]["id"]}"),
                    leading: Image.network(data[index]["url"]));
              },
              itemCount: data.length,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // myText = _nameController.text;
          // Need to call setState to update the state with changes w/logic above
          setState(() {});
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
