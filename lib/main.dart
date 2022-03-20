import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase/user.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const GetUserName(),
    );
  }
}

class GetUserName extends StatefulWidget {
  const GetUserName({Key? key}) : super(key: key);

  @override
  State<GetUserName> createState() => _GetUserNameState();
}

class _GetUserNameState extends State<GetUserName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello there')),
      body: StreamBuilder<List<User>>(
          stream: readUsers(),
          builder: (context, e) {
            if (e.hasError) {
              final User = e.data!;
            }else(){
              
            }
          }),
    );
    return ListView();
    Stream<List<User>> readUsers() =>
        FirebaseFirestore.instance.collection('usersname').snapshots().map(
            (event) => event.docs.map((e) => User.fromJson(e.data())).toList());
  }
}
