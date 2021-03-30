import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:technicaltestform/src/providers/user_provider.dart';
import 'package:technicaltestform/src/models/user_model.dart';
import 'package:technicaltestform/src/pages/add_address_page.dart';

class CreateUser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}

Color color1 = Colors.indigo;
Color color2 = Colors.deepPurple;

UserModel user = new UserModel();

final userProvider = new UserProvider();

class _CreateUserState extends State<CreateUser> {
  List<DynamicAddress> listDynamic = [DynamicAddress()];
  List<String> pivotList = [];

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create User"),

      ),
      body: _createUser(),
    );
  }

  Widget _createUser() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 1.0,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            padding: EdgeInsets.symmetric(vertical: 15.0),
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 30.0,
                  offset: Offset(0.0, 4.0),
                  spreadRadius: 3.0,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(15.0, 1, 10.0, 10.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Text(
                      "User Name",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    SizedBox(height: 7.0),
                    _crearNombre(),
                    SizedBox(height: 15.0),
                    Text(
                      "User Lastname",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    SizedBox(height: 7.0),
                    _crearApellido(),
                    SizedBox(height: 15.0),
                    Text(
                      "Birth Date",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    SizedBox(height: 7.0),
                    CrearFecha(),
                    SizedBox(height: 15.0),
                    Text(
                      "Adresses",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    SizedBox(height: 7.0),
                    _createButtomes(),
                    SizedBox(height: 10.0),
                    SingleChildScrollView(child: _crearAddressess()),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(110, 8, 1, 8),
                      child: _botonCrearEvento(),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _createButtomes() {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              addDynamic();
            },
            child: Container(
              height: 30,
              width: 30,
              child: Material(
                borderRadius: BorderRadius.circular(100),
                color: Colors.green,
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
        SizedBox(
          width: 15,
        ),
        GestureDetector(
            onTap: () {
              removeDynamic();
            },
            child: Container(
              height: 30,
              width: 30,
              child: Material(
                child: Center(
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
                borderRadius: BorderRadius.circular(100),
                color: Colors.red,
              ),
            )),
      ],
    );
  }

  Widget _crearAddress() {
    return Container(
      child: TextFormField(
        onSaved: (value) => user.name = value,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(14.0),
            // hintText: 'Nombre user',
            prefixIcon: Icon(
              Icons.account_circle,
              color: Colors.indigo,
            ),
            labelText: 'Add Address',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
      ),
    );
  }

  Widget _crearNombre() {
    return Container(
      child: TextFormField(
        onSaved: (value) => user.name = value,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(14.0),
            prefixIcon: Icon(
              Icons.account_circle,
              color: Colors.indigo,
            ),
            labelText: 'Name User',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
      ),
    );
  }

  Widget _crearApellido() {
    return Container(
      child: TextFormField(
        onSaved: (value) => user.lastName = value,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(14.0),
            prefixIcon: Icon(
              Icons.account_circle,
              color: Colors.indigo,
            ),
            labelText: 'Lastname User',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
      ),
    );
  }

  Widget _botonCrearEvento() {
    return Container(
      width: 210.0,
      height: 55.0,
      decoration: ShapeDecoration(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        gradient: LinearGradient(colors: [color1, color2]),
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.send,
              color: Colors.white,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Create User",
              style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
        onPressed: () {
          _submit();
        },
      ),
    );
  }

  addDynamic() {
    listDynamic.add(new DynamicAddress());
    setState(() {});
  }

  removeDynamic() {
    listDynamic.removeLast();
    setState(() {});
  }

  Widget _crearAddressess() {
    return Container(
      width: 180,
      height: listDynamic.length == 1 ? 180 : 200,
      child: Column(
        children: [
          new Flexible(
            child: new ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: listDynamic.length,
                itemBuilder: (_, index) {
                  return Container(
                    height: 70,
                    child: listDynamic[index],
                  );
                }),
          ),
        ],
      ),
    );
  }

  void _submit() {
    formKey.currentState.save();
    print(user.name);
    print(user.lastName);
    print(user.birthDate);
    transformList();
    userProvider.crearUser(user, pivotList);

    Navigator.pushNamed(context, 'users');
  }

  transformList() {
    listDynamic.forEach((widget) => pivotList.add(widget.controller.text));
  }
}

class CrearFecha extends StatelessWidget {
  final format = DateFormat("dd/MM/yyyy");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DateTimeField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(14.0),
          labelText: "Birth Date",
          prefixIcon: Icon(
            Icons.date_range,
            color: Colors.indigo,
          ),
        ),
        format: format,
        onSaved: (DateTime value) {
          user.birthDate = value.toString();
        },
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime.now());
        },
      ),
    ]);
  }
}
