import 'package:flutter/material.dart';
import 'package:technicaltestform/src/models/user_model.dart';
import 'package:technicaltestform/src/providers/user_provider.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final userProvider = new UserProvider();

  //initstate para que se listen los usuarios cada vez que entra a esta vista
  @override
  void initState() {
    _createList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Users",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        letterSpacing: 1.0,
                        fontFamily: "Calibre-Semibold",
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 2.0, 16.0, 10.0),
              child: Container(
                  width: width, height: height * .80, child: _createList()),
            ),
          ],
        ),
      ),
      floatingActionButton: _createButtom(context),
    );
  }

  Widget _createList() {
    return FutureBuilder(
      future: userProvider.loadUsers(),
      builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
        if (snapshot.hasData) {
          final users = snapshot.data;

          return Container(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, i) => _createItem(context, users[i]),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _createItem(BuildContext context, UserModel user) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              child: Material(
                child: Center(
                  child: Text(
                    '${user.name.substring(0, 1)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(150),
              ),
            ),
            title: Text(
              "${user.name} ${user.lastName}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Birth Date: ${user.birthDate}",
              textAlign: TextAlign.start,
            ),
            isThreeLine: true,
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.pushNamed(context, 'user', arguments: user),
          ),
        ],
      ),
    );
  }

  _createButtom(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.indigo,
      onPressed: () => Navigator.pushNamed(context, 'create_user'),
    );
  }
}
