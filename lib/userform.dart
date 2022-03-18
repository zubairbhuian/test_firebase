import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_firebase/home.dart';

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

  // global Keys
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  // database
  Future pushUserData() async {
    CollectionReference dockUser =
        FirebaseFirestore.instance.collection("usersname");
    return dockUser.doc("Tabassum3").set({
      "name": _nameController.text,
      "email": _emailController.text,
      "pass": _passwordController.text,
      "phone": _phoneController.text,
    }).then((value) => Fluttertoast.showToast(
            msg: "Ensurt Data",
            backgroundColor: Colors.purple,
            textColor: Colors.white).then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=> const HomePage())))
        .catchError((err) => print(err)));
    // final josonData = {
    //   "name": _nameController.text,
    //   "email": _emailController.text,
    //   "pass": _passwordController.text,
    //   "phone": _phoneController.text,
    // };
    // await dockUser.set(josonData);
  }

  // Password
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Information"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: 'Enter Your Full Name',
                    // hintText: 'Enter Your Full Name',
                    border: OutlineInputBorder()),
                controller: _nameController,
                validator: (String? value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              // Email
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: 'Enter Your Email',
                    // hintText: 'Enter Your Email',
                    border: OutlineInputBorder()),
                controller: _emailController,
                validator: (String? value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                          .hasMatch(value)) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              // Password
              TextFormField(
                maxLength: 10,
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
                validator: (value) {
                  if (value!.isEmpty || value.length < 7) {
                    return "Your minimum password should be 7";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              // Age
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Enter Your Age',
                    // hintText: 'Enter Your Age',
                    border: OutlineInputBorder()),
                controller: _ageController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              // Phone Number
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    labelText: 'Enter Your Phone Number',
                    // hintText: 'Enter Your Phone Number',
                    border: OutlineInputBorder()),
                controller: _phoneController,
                validator: (value) {
                  // usa numbser r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$'
                  if (value!.isEmpty ||
                      !RegExp(r'^(?:\+?88|0088)?01[15-9]\d{8}$')
                          .hasMatch(value)) {
                    return "Enter your valid phone number";
                  } else {
                    return null;
                  }
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      pushUserData();
                    }
                  },
                  child: const Text("send"))
              //
            ],
          ),
        ),
      ),
    );
  }
}
