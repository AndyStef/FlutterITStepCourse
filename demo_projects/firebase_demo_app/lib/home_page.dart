import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  final Function() onSignOut;

  const HomePage({
    Key? key,
    required this.onSignOut,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final CollectionReference _products = FirebaseFirestore.instance.collection('products');

  Future<void> _logOut() async {
    await FirebaseAuth.instance.signOut();
    widget.onSignOut();
  }

  Future<void> _deleteProduct(String documentId) async {
    await _products.doc(documentId).delete();

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Your product was deleted successfully')));
  }

  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'edit';
      _nameController.text = documentSnapshot['name'];
      _priceController.text = documentSnapshot['price'].toString();
    }

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (buildContext) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 200,
            left: 20,
            right: 20,
            //bottom: MediaQuery.of(buildContext).viewInsets.bottom + 20,
            bottom: 20,
          ),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(hintText: 'Enter name'),
              ),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(hintText: 'Enter price'),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (action == 'create') {
                    await _products.add({
                      "name": _nameController.text,
                      "price": double.tryParse(_priceController.text),
                    });
                  } else {
                    await _products.doc(documentSnapshot!.id).update({
                      "name": _nameController.text,
                      "price": double.tryParse(_priceController.text),
                    });
                  }

                  _nameController.text = '';
                  _priceController.text = '';

                  Navigator.of(context).pop();
                },
                child: Text(action),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
        actions: [
          IconButton(
            onPressed: _logOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _products.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                var price = documentSnapshot['price'];
                var priceTitle = price == 0 ? 'Безцінно' : price.toString();
                return Card(
                  child: ListTile(
                    title: Text(documentSnapshot['name']),
                    subtitle: Text(priceTitle),
                    trailing: SizedBox(
                      width: 100.0,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => _createOrUpdate(documentSnapshot),
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () => _deleteProduct(documentSnapshot.id),
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          // else if (streamSnapshot.data.docs.isEmpty) {
          //   return const Center(
          //     child: Text('No data yet. Press plus to add new data'),
          //   );
          // }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _createOrUpdate();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
