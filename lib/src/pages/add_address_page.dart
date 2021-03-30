import 'package:flutter/material.dart';

class AddAddres extends StatefulWidget {
  @override
  _AddAddresState createState() => _AddAddresState();
}

class _AddAddresState extends State<AddAddres> {
  List<DynamicAddress> listDynamic = [];
  addDynamic() {
    listDynamic.add(new DynamicAddress());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          children: [
            new Flexible(
              child: new ListView.builder(
                  itemCount: listDynamic.length,
                  itemBuilder: (_, index) => listDynamic[index]),
            ),
            new Container(
                child: new RaisedButton(
                    onPressed: null, child: new Text('Submit'))),
            new FloatingActionButton(
                onPressed: addDynamic, child: new Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}

class DynamicAddress extends StatelessWidget {
  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: new TextField(
        controller: controller,
        decoration: new InputDecoration(
            prefixIcon: Icon(
              Icons.add_location_alt_rounded,
              color: Colors.indigo,
            ),
            hintText: 'Enter address'),
      ),
    );
  }
}
