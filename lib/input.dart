import 'package:flutter/material.dart';
import 'package:precwithbebehans/add.dart';
import 'package:precwithbebehans/boxes.dart';
import 'package:precwithbebehans/data.dart';

class Inputscreen extends StatefulWidget {
  const Inputscreen({super.key});

  @override
  State<Inputscreen> createState() => _InputscreenState();
}

class _InputscreenState extends State<Inputscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Addscreen()));
          }, icon: Icon(Icons.add))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Input'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Addscreen()));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: dataBox.length,
            itemBuilder: (BuildContext context, int index) {
              Data datagetter = dataBox.getAt(index);
              return Dismissible(
                background: Container(
                  alignment: Alignment.centerRight,
                  color: Colors.red,
                  child: Icon(Icons.delete),
                ),
                key: Key(datagetter.name),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) {
                  setState(() {
                    dataBox.deleteAt(index);
                  });
                },
                child: Card(
                  child: ListTile(
                    title: Text(datagetter.name),
                    subtitle: Text(datagetter.address),
                    trailing: Text(datagetter.id),
                  ),
                ),
              );
            },
          ),)
        ],
      ),
    );
  }
}