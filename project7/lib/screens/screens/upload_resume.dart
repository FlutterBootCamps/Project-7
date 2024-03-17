import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase1/screens/screens/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Uploadresume extends StatefulWidget {
  const Uploadresume({super.key});

  @override
  State<Uploadresume> createState() => _UploadresumeState();
}

TextEditingController fnameController = TextEditingController();
TextEditingController lnameController = TextEditingController();
TextEditingController EducationController = TextEditingController();
TextEditingController DescController = TextEditingController();
TextEditingController WorkController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();

//---------------- create CV
/*
Future<void> createResume(
  BuildContext context, {
  required String fname,
  required String lname,
  required String Education,
  required String work_experience,
  required String decs,
  required String city,
  required String email,
  required String phone,
}) async {
  try {
    final response = await Supabase.instance.client.from('resume').insert([
      {
        'fname': fname,
        'lname': lname,
        'decs': decs,
        'job': Education,
        'country': work_experience,
        'city': city,
        'email': email,
        'phone': phone,
      },
    ]);
    if (response == null) {
      print('Response is null');
    } else if (response.error != null) {
      print('Insert failed: ${response.error!.message}');
      print(response);
    } else {
      print('Inserted successfully.');
      print(response);
    }
  } catch (e) {
    print(e);
  }
}
*/
Future<void> createResume(
  BuildContext context, {
   required String fname,
  required String lname,
  required String Education,
  required String work_experience,
  required String decs,
  required String city,
  required String email,
  required String phone,
}) async {
  try {
    final response = await Supabase.instance.client.from('resume').insert([
      {
        'user_id2': Supabase.instance.client.auth.currentUser!.id,
        'fname': fname,
        'lname': lname,
        'decs': decs,
        'job': Education,
        'country': work_experience,
        'city': city,
        'email': email,
        'phone': phone,
      },
    ]);
    if (response == null) {
      print('Response is null');
    } else if (response.error != null) {
      print('Insert failed: ${response.error!.message}');
      print(response);
    } else {
      print('Inserted successfully.');
      print(response);
    }
  } catch (e) {
    print(e);
  }
}


var formKey = GlobalKey<FormState>();

class _UploadresumeState extends State<Uploadresume> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Upload Resume'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
                child: Column(
              children: [
                Text('Upload Your Resume Data',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    )),
                SizedBox(
                  height: 20,
                ),
                //-------------- First Name
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: fnameController,
                        decoration: InputDecoration(
                          
                          hintText: 'First Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter First Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    //-------- Last Name
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: TextFormField(
                          controller: lnameController,
                          decoration: const InputDecoration(
                            
                            hintText: 'Last Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Last Name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                // --------------Education
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: TextFormField(
                    controller: EducationController,
                    decoration: const InputDecoration(
                      hintText: 'Education',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Education';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: TextFormField(
                    maxLines: 3,
                    maxLength: 200,
                    controller: DescController,
                    decoration: const InputDecoration(
                      hintText: 'Skills And Projects,',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Skills And Projects,';
                      }
                      return null;
                    },
                  ),
                ),
                // --------------Work Experience
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: TextFormField(
                    controller: WorkController,
                    decoration: const InputDecoration(
                     
                      hintText: 'Work Experience',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Work Experience';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      
                      hintText: 'City',
                      border: OutlineInputBorder(),
                    ),
                    controller: cityController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter City';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      
                      hintText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter E-mail';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      
                      hintText: 'Phone',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Phone';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                //-----------------safe data
                GestureDetector(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      createResume(context,
                          fname: fnameController.text,
                          lname: lnameController.text,
                          work_experience: WorkController.text,
                          city: cityController.text,
                          email: emailController.text,
                          Education: EducationController.text,
                          decs: DescController.text,
                          phone: phoneController.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreem(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.deepPurple,
                    ),
                    width: double.infinity,
                    child: Text(
                      'Upload Resume',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
               
              ],
            )),
          ),
        ),
      ),
    );
  }
}
