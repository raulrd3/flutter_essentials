import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

void main() {
  // WidgetsApp //MaterialApp //CupertinoApp
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(primarySwatch: Colors.purple),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myText = "Change My Name";
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome App"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/laptop.jpg",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    myText,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter some text.",
                        labelText: "Name",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Raul Rodriguez III"),
              accountEmail: Text("hi@raulrodrigueziii.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage("https://www.fillmurray.com/300/300"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Raul Rodriguez III"),
              subtitle: Text("Developer"),
              trailing: Icon(Icons.edit),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("hi@raulrodrigueziii.com"),
              trailing: Icon(Icons.edit),
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myText = _nameController.text;
          // Need to call setState to update the state with changes w/logic above
          setState(() {});
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
