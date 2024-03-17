 import 'package:flutter/material.dart';
import 'package:project8/widgets/textfieldwedget2.dart';

class ObjectivePage extends StatelessWidget {
  ObjectivePage({super.key});
 final TextEditingController fisrstController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController portfolioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff3f1ee),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 173, 27, 27), width: 5)),
            child: ListView(
              children: [
                TextfieldWidget2(
                  labelText: 'First Name',
                  controller: fisrstController,
                ),
                TextfieldWidget2(
                  labelText: 'Last Name',
                  controller: lastnameController,
                ),
                TextfieldWidget2(
                  labelText: 'Profession',
                  controller: professionController,
                ),
                TextfieldWidget2(
                  labelText: 'Email',
                  controller: emailController,
                ),
                TextfieldWidget2(
                  labelText: 'Phone Number',
                  controller: phoneController,
                ),
                TextfieldWidget2(
                  labelText: 'Country',
                  controller: countryController,
                ),
                TextfieldWidget2(
                  labelText: 'City',
                  controller: cityController,
                ),
                TextfieldWidget2(
                  labelText: 'Address',
                  controller: addressController,
                ),
                TextfieldWidget2(
                  labelText: 'Portfolio',
                  controller: portfolioController,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: const Text(
                    'Finish',
                    style: TextStyle(fontSize: 16, color: Color(0xffc5bbb9)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
