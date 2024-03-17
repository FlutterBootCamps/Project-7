import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:try_auth_suba/api/serves.dart';
import 'package:try_auth_suba/model/cv_model.dart';
import 'package:try_auth_suba/setup/git_it.dart';

class CVRepository {
  Future<CV?> readCV() async {
    try {
      // Load CV data from a file or fetch it from an API
      // For demonstration purposes, we'll use a sample JSON string
      final jsonString = await rootBundle.loadString('assets/sample_cv.json');
      final Map<String, dynamic> cvData = json.decode(jsonString);

      // Convert JSON data to CV object
      return CV.fromJson(cvData);
    } catch (e) {
      print('Error reading CV: $e');
      return null;
    }
  }

  Future<void> updateCV(CV updatedCV) async {
    // Convert updated CV object to JSON
    final Map<String, dynamic> updatedData = updatedCV.toJson();

    // Update CV data in the file or send it to an API
    // For demonstration purposes, we'll print the updated JSON data
    print(json.encode(updatedData));
  }

  Future<void> deleteCV() async {
    // Delete CV data from the file or send a delete request to an API
    print('CV deleted');
  }
}
