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
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _ageController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // Password
  bool _hidePassword = true;

  // Data Function
  var userData = {
    'name': 12,
    'email': "zu@gmail.com",
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  labelText: 'Enter Your Full Name',
                  // hintText: 'Enter Your Full Name',
                  border: OutlineInputBorder()),
              controller: _nameController,
            ),
            const SizedBox(
              height: 15,
            ),
            // Email
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: 'Enter Your Email',
                  // hintText: 'Enter Your Email',
                  border: OutlineInputBorder()),
              controller: _emailController,
            ),
            const SizedBox(
              height: 15,
            ),
            // Password
            TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: _hidePassword,
              
              decoration: InputDecoration(
                  labelText: 'Enter Your Password',
                  // hintText: 'Enter Your Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: InkWell(
                    child: _hidePassword == true
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onTap: () => setState(() {
                      _hidePassword = !_hidePassword;
                    }),
                  )),
              controller: _passwordController,
              
            ),
            const SizedBox(
              height: 15,
            ),
            // Age
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Enter Your Age',
                  // hintText: 'Enter Your Age',
                  border: OutlineInputBorder()),
              controller: _ageController,
            ),
            const SizedBox(
              height: 15,
            ),
            // Phone Number
            TextField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  labelText: 'Enter Your Phone Number',
                  // hintText: 'Enter Your Phone Number',
                  border: OutlineInputBorder()),
              controller: _phoneController,
              
            ),
            //
          ],
        ),
      ),
    );
  }
}
