import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:precwithbebehans/boxes.dart';
import 'package:precwithbebehans/data.dart';

class Addscreen extends StatefulWidget {
  const Addscreen({super.key});

  @override
  State<Addscreen> createState() => _AddscreenState();
}

var namecon = TextEditingController();
var addcon = TextEditingController();
var idcon = TextEditingController();

class _AddscreenState extends State<Addscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Gap(10),
            TextFormField(
              controller: namecon,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: const Text("Name"),
              ),
            ),
            Gap(10),
            TextFormField(
              controller: addcon,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: const Text("Address"),
              ),
            ),
            Gap(10),
            TextFormField(
              controller: idcon,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: const Text("ID"),
              ),
            ),
            Gap(20),
            ElevatedButton(onPressed: (){
              setState(() {
                dataBox.put('key_${namecon.text}', Data(name: namecon.text, address: addcon.text, id: idcon.text));
              });
            }, child: const Text("Add")),
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
          ),),
          Gap(100),
          Center(child: Text(dataBox.length.toString(), style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),))
          ],
        ),
      ),
    );
  }
}