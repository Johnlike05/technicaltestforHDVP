import 'package:flutter/material.dart';
import 'package:technicaltestform/src/models/user_model.dart';
import 'package:technicaltestform/src/providers/user_provider.dart';

Color color1 = Colors.indigo;
Color color2 = Colors.deepPurple;

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final userProvider = new UserProvider();

  UserModel user = new UserModel();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final UserModel userData = ModalRoute.of(context).settings.arguments;

    if (userData != null) {
      user = userData;
    }
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
                width: width,
                height: height * .30,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    color1,
                    color2,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ))),
            _buildHeader(width, height, context),
            buildNotificationPanel(width, height),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(double width, double height, context) {
    return Positioned(
      top: 25,
      child: Container(
          width: width,
          height: height * .20,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 24.0,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'users');
                        }),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 18.0, 10.0, 2.0),
                  child: Text(
                    "${user.name} ${user.lastName}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ])),
    );
  }

  Widget buildNotificationPanel(double width, double height) {
    return Positioned(
      width: width,
      height: height * .70 - 40,
      top: height * 0.30 + 34,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Material(
                elevation: 1,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    buildBodyCardTitle(title: "User Data"),
                    Divider(
                      height: 3,
                      color: Colors.black87,
                    ),
                    buildBirthDatePlace(icon: Icons.calendar_today_outlined),
                    Divider(
                      height: 3,
                      color: Colors.black87,
                    ),
                    buildAddressPlace(Icons.place, context),
                  ],
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAddressPlace(IconData icon, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 10),
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Icon(
            icon,
            size: 30,
            color: Colors.white70,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Address",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 500,
              width: 500,
              child: ListView.builder(
                itemCount: user.address.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(" - ${user.address[i]["address"]}"),
                  );
                },
              ),
            )
          ],
        ),
        onTap: () {},
      ),
    );
  }

  Widget buildBirthDatePlace({IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 10),
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Icon(
            icon,
            size: 30,
            color: Colors.white70,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Birth Date",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${user.birthDate}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }

  Widget buildBodyCardTitle({String title}) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.indigo,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
