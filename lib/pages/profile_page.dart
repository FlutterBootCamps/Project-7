import 'package:cv_app/extension/colors.dart';
import 'package:cv_app/extension/spase.dart';
import 'package:cv_app/services/data_service.dart';
import 'package:cv_app/services/setup.dart';
import 'package:cv_app/widgets/purble_elevated_button.dart';
import 'package:cv_app/widgets/textfield_column_widget.dart';
import 'package:cv_app/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final servicelocater = DataInjection().locater.get<DataBase>();

    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Stack(
              children: [
                // Image.asset('assets/images/purble_background.png'),
                // Positioned(
                //   left: 140,
                //   top: 120,
                //   child: Center(
                //     child: Container(
                //       width: 120,
                //       height: 120,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(60),
                //           color: greyColor),
                //     ),
                //   ),
                // ),
                Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            purbleColor.withAlpha(130),
                            const Color.fromARGB(255, 209, 214, 219)
                          ]),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      )),
                ),
                const Positioned(
                    top: 60, right: 30, child: Icon(Icons.logout_outlined)),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      height: 120,
                      child: Stack(
                        // fit: StackFit.expand,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: purbleColor,
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/images/person.jpeg')),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.camera_alt_outlined,
                                  ),
                                  onPressed: () {},
                                )),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Change Picture"),
          ),
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFieldColumn(
                  label: "Email",
                  hinttext: "Maram@gmail.com",
                  controller:
                      TextEditingController(text: servicelocater.emailUser),
                  prefixIcon: const Icon(Icons.email),
                ),

                sizedBox30,
              ],
            ),
          )
        ]),
      ),
    );
  }
}
