import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  static const String routeName = "/form";
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Form")),
        body: Stack(fit: StackFit.expand, children: [
          Image.asset("assets/form_bg.jpg", fit: BoxFit.cover, color: Colors.black.withOpacity(0.3), colorBlendMode: BlendMode.darken),
          MyForm(formKey: formKey, emailController: _emailController, fullNameController: _fullNameController, ageController: _ageController)
        ],
        )
    );
  }
}

class MyForm extends StatelessWidget {
  const MyForm({
    Key? key,
    required this.formKey,
    required TextEditingController emailController,
    required TextEditingController fullNameController,
    required TextEditingController ageController,
  }) : _emailController = emailController, _fullNameController = fullNameController, _ageController = ageController, super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController _emailController;
  final TextEditingController _fullNameController;
  final TextEditingController _ageController;

  _submit(){
    if(formKey.currentState!.validate()) {
      print('WELL DONE');

    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: "Enter Email", labelText: "Email")),
                  TextFormField(
                      controller: _fullNameController,
                      decoration: const InputDecoration(
                          hintText: "Enter Full Name",
                          labelText: "Full Name")),
                  TextFormField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: "Enter Age", labelText: "Age")),
                  const SizedBox(height:19),
                  OutlinedButton(onPressed: _submit, child: const Text("Submit"))
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
