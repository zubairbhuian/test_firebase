import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('user info'),
        ),
        body: UserInformation(),
      ),
    );
  }
}

// class GetUserName extends StatefulWidget {
//   const GetUserName({Key? key}) : super(key: key);

//   @override
//   State<GetUserName> createState() => _GetUserNameState();
// }

// class _GetUserNameState extends State<GetUserName> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Hello there')),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('usersname').snapshots(),
//         builder: (_, snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(
//               child: Text('Loading'),
//             );
//           }else{
//            return GridView.builder(
//               scrollDirection: Axis.vertical,
//               itemCount:snapshot.data.,
//               gridDelegate: gridDelegate,
//               itemBuilder: itemBuilder
//               )
//           }
//         },
//       ),
//     );
//   }
// }
class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('usersname').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;

            return ListTile(
              title: Text(data['email']),
              subtitle: Text(data['name']),
            );
          }).toList(),
        );
      },
    );
  }
}
