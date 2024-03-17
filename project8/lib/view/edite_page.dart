import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project8/bloc/cv_bloc.dart';
import 'package:project8/model/cv_model.dart';

class EditCVPage extends StatelessWidget {
  final String userid;

  const EditCVPage({Key? key, required this.userid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit CV'),
      ),
      body: BlocBuilder<CvBloc, CvState>(
        builder: (context, state) {
          if (state is DisplayState) {
            final cv = state.cvlist.firstWhere((cv) => cv.userid == userid);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    initialValue: cv.first,
                    decoration: const InputDecoration(labelText: 'First Name'),
                    onChanged: (value) => cv.first = value,
                  ),
                  TextFormField(
                    initialValue: cv.last,
                    decoration: const InputDecoration(labelText: 'Last Name'),
                    onChanged: (value) => cv.last = value,
                  ),
                  // Add text form fields for other CV fields
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Dispatch edit event
                      final bloc = context.read<CvBloc>();
                      bloc.add(EditEvent(cv));
                      // Navigate back to previous page
                      Navigator.pop(context);
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}