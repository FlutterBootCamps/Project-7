import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project8/bloc/cv_bloc.dart';
import 'package:project8/model/cv_model.dart';
import 'package:project8/service/database.dart';
import 'package:project8/view/edite_page.dart';
import 'package:project8/widgets/textcv.dart';

class CVWidget extends StatelessWidget {
  CVWidget({super.key, required this.personal});
  CV personal;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [ IconButton(onPressed: () async {
              final String userid = await getUserId();
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditCVPage(userid: userid),
                  ),);}, icon: const Icon(Icons.edit,color: Colors.red,)),
              IconButton(onPressed: () {
                        final bloc = context.read<CvBloc>();
                bloc.add(DeletEvent(personal.id)); 
                      }, icon: const Icon(Icons.delete,color: Colors.red,)),],),
        
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          height: 760,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 5)),
          child: Column(
            children: [
              Row(
                children: [
                  TextNameTitle(
                    text: personal.first,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextNameTitle(
                    text: personal.last,
                  ),
                  
                 
                ],
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child:  TextCVwidget(
                  text:
                      personal.objective,
                ),
              ),
              Container(
                height: 1,
                width: 340,
                color: Colors.black,
              ),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(8),
                      height: 600,
                      width: 225,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextTitelCV(
                            text: 'Profession',
                          ),
                          TextCVwidget(
                            text: personal.profession,
                          ),
                           const TextTitelCV(
                            text: 'SKILLS',
                          ),
                          TextCVwidget(
                                text: personal.skills,
                              ),
                          const TextTitelCV(
                            text: 'EXPERIENCE',
                          ),
                          TextCVwidget(
                                text: personal.position,
                              ),
                              TextCVwidget(
                                text: personal.company,
                              ),

                          const TextTitelCV(
                            text: 'EDUCATION',
                          ),
                          TextCVwidget(
                                text: personal.studyProgram,
                              ),
                          TextCVwidget(
                                text: personal.placeEducation,
                              ),
                              
                              TextCVwidget(
                                text: '${personal.gpa}',
                              ),
                             
                          const TextTitelCV(
                            text: 'Project',
                          ),
                          TextCVwidget(
                                text: personal.projectName,
                              ),
                          TextCVwidget(
                                text: personal.projectDescription,
                              ),
                        ],
                      )),
                  Container(
                      padding: const EdgeInsets.all(8),
                      height: 600,
                      width: 112,
                      color: Colors.grey[100],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextTitelCV(
                            text: 'CONTACT',
                          ),
                          const Iconwidget(
                            icon: Icons.phone,
                          ),
                          TextCVwidget(
                            text: '${personal.phone}',
                          ),
                          const Iconwidget(
                            icon: Icons.mail,
                          ),
                          TextCVwidget(
                            text: personal.email,
                          ),
                          const Iconwidget(
                            icon: Icons.add_link,
                          ),
                          TextCVwidget(
                            text: personal.portfolio,
                          ),
                          const Iconwidget(
                            icon: Icons.location_on_sharp,
                          ),
                          Row(
                            children: [
                              TextCVwidget(
                                text: personal.address,
                              ),
                              const TextCVwidget(
                                text: ',',
                              ),
                              TextCVwidget(
                                text: personal.city,
                              ),
                              const TextCVwidget(
                                text: ',',
                              ),
                              TextCVwidget(
                                text: personal.country,
                              ),
                            ],
                          ),
                         
                          const TextTitelCV(
                            text: 'REFERENS',
                          ),
                          TextCVwidget(
                                text: personal.organization,
                              ),
                        ],
                      ))
                ],
              )
            ],
          ), //TextCVwidget(text: '',),
        ),
      ],
    );
  }
}

class CVWidgetedit extends StatelessWidget {
  CVWidgetedit({super.key, required this.personal});
  CV personal;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [ IconButton(onPressed: () async {
              final String userid = await getUserId();
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditCVPage(userid: userid),
                  ),);}, icon: const Icon(Icons.edit,color: Colors.red,)),
              IconButton(onPressed: () {
                        final bloc = context.read<CvBloc>();
                bloc.add(DeletEvent(personal.id)); 
                      }, icon: const Icon(Icons.delete,color: Colors.red,)),],),
        
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          height: 760,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 5)),
          child: Column(
            children: [
              Row(
                children: [
                  TextNameTitle(
                    text: personal.first,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextNameTitle(
                    text: personal.last,
                  ),
                  
                 
                ],
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child:  TextCVwidget(
                  text:
                      personal.objective,
                ),
              ),
              Container(
                height: 1,
                width: 340,
                color: Colors.black,
              ),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(8),
                      height: 600,
                      width: 225,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextTitelCV(
                            text: 'Profession',
                          ),
                          TextCVwidget(
                            text: personal.profession,
                          ),
                           const TextTitelCV(
                            text: 'SKILLS',
                          ),
                          TextCVwidget(
                                text: personal.skills,
                              ),
                          const TextTitelCV(
                            text: 'EXPERIENCE',
                          ),
                          TextCVwidget(
                                text: personal.position,
                              ),
                              TextCVwidget(
                                text: personal.company,
                              ),

                          const TextTitelCV(
                            text: 'EDUCATION',
                          ),
                          TextCVwidget(
                                text: personal.studyProgram,
                              ),
                          TextCVwidget(
                                text: personal.placeEducation,
                              ),
                              
                              TextCVwidget(
                                text: '${personal.gpa}',
                              ),
                             
                          const TextTitelCV(
                            text: 'Project',
                          ),
                          TextCVwidget(
                                text: personal.projectName,
                              ),
                          TextCVwidget(
                                text: personal.projectDescription,
                              ),
                        ],
                      )),
                  Container(
                      padding: const EdgeInsets.all(8),
                      height: 600,
                      width: 112,
                      color: Colors.grey[100],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextTitelCV(
                            text: 'CONTACT',
                          ),
                          const Iconwidget(
                            icon: Icons.phone,
                          ),
                          TextCVwidget(
                            text: '${personal.phone}',
                          ),
                          const Iconwidget(
                            icon: Icons.mail,
                          ),
                          TextCVwidget(
                            text: personal.email,
                          ),
                          const Iconwidget(
                            icon: Icons.add_link,
                          ),
                          TextCVwidget(
                            text: personal.portfolio,
                          ),
                          const Iconwidget(
                            icon: Icons.location_on_sharp,
                          ),
                          Row(
                            children: [
                              TextCVwidget(
                                text: personal.address,
                              ),
                              const TextCVwidget(
                                text: ',',
                              ),
                              TextCVwidget(
                                text: personal.city,
                              ),
                              const TextCVwidget(
                                text: ',',
                              ),
                              TextCVwidget(
                                text: personal.country,
                              ),
                            ],
                          ),
                         
                          const TextTitelCV(
                            text: 'REFERENS',
                          ),
                          TextCVwidget(
                                text: personal.organization,
                              ),
                        ],
                      ))
                ],
              )
            ],
          ), //TextCVwidget(text: '',),
        ),
      ],
    );
  }
}