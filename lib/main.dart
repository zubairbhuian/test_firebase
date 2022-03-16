import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(title: const Text("User Information")),
        body: UserForm(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.send),
        ),
      )),
    );
  }
}

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  // Password
  bool _hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
                hintText: 'Enter Your Full Name', border: OutlineInputBorder()),
            controller: _nameController,
          ),
          const SizedBox(
            height: 10,
          ),
          // Email
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                hintText: 'Enter Your Email', border: OutlineInputBorder()),
            controller: _emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          // Password
          TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: _hidePassword,
            decoration: InputDecoration(
                hintText: 'Enter Your Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _hidePassword = !_hidePassword;
                      });
                    },
                    icon: const Icon(Icons.visibility))),
            controller: _passwordController,
          ),
          const SizedBox(
            height: 10,
          ),
          // Age
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                hintText: 'Enter Your Age', border: OutlineInputBorder()),
            controller: _ageController,
          ),
          const SizedBox(
            height: 10,
          ),
          // Phone Number
          TextField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
                hintText: 'Enter Your Phone Number',
                border: OutlineInputBorder()),
            controller: _phoneController,
          ),
          //
        ],
      ),
    );
  }
}
