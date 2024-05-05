import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_1/contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  List<Contact> contacts = List.empty(growable: true);
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Contact List'
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:  [
            const SizedBox(height: 10,),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Contact name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                )
              ),
             ),
             const SizedBox(height: 10,),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: const InputDecoration(
                hintText: 'Contact number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                )
              ),
             ),
             const SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    String name = nameController.text.trim();
                    String number = numberController.text.trim();
                    if(name.isNotEmpty && number.isNotEmpty){
                      setState(() {
                        nameController.text = '';
                        numberController.text = '';
                        contacts.add(Contact(name: name, number: number));
                      });
                    }
                  }, 
                child: const Text('Save')),
                ElevatedButton(onPressed: (){
                  String name = nameController.text.trim();
                    String number = numberController.text.trim();
                    if(name.isNotEmpty && number.isNotEmpty){
                      setState(() {
                        nameController.text = '';
                        numberController.text = '';

                        contacts[selectedIndex].name = name;
                        contacts[selectedIndex].number = number;
                      });
                    }
                }, child: const Text('Update'))
              ],
             ),

             const SizedBox(height: 10,),

             contacts.isEmpty ? const Text(
              'No contact yet!',
              style: TextStyle(
                fontSize: 22
              ),
              ) :
             Expanded(
              child:  ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) => getRow(index)
              )
            )
          ],
        ),
      )
    );
  }
  
  Widget getRow(int index) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          contacts[index].name[0],
          style: const TextStyle(fontWeight: FontWeight.bold),
          ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(contacts[index].name, style: const TextStyle(fontWeight: FontWeight.bold),),
          Text(contacts[index].number),
        ],
      ),
      trailing: SizedBox(
        width: 70,
        child: Row(
          children: [

            InkWell(
              onTap: (){
                nameController.text = contacts[index].name;
                numberController.text = contacts[index].number;
                setState(() {
                  selectedIndex = index;
                });
              },
              child: const Icon(Icons.edit)
            ),
            InkWell(
              onTap: (){
                setState(() {
                  contacts.removeAt(index);
                });
              },
              child: const Icon(Icons.delete)
            )
          ],
        ),
      ),
    );
  }
}