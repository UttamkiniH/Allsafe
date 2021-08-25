import 'package:allsafe/models/hospital-details.dart';
import 'package:allsafe/screens/information.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DataSearch extends SearchDelegate<String> {
  List<Hospital> hospitals;

  final recentHospitals = [
    'Akash Hospital',
    'Sir C V Raman General Hopsital Indiranagar',
    'East Point Hospital',
    'MVJ Medical College And Research Hospital',
    'Dr B R Ambedkar Medical College',
    'EMPLOYEES STATE INSURANCE CORPORATION Peenya',
    'Supriya Hospital'
  ];

  DataSearch(List<Hospital> hospitals) {
    this.hospitals = hospitals;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: Colors.black,
        ),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
            showSuggestions(context);
          }
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            color: Colors.black87,
            icon: AnimatedIcons.menu_arrow,
            progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(child: null);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? recentHospitals
        : hospitals.where((hospital) {
            final hospitalLower = hospital.hospital_name.toLowerCase();
            final queryLower = query.toLowerCase();

            return hospitalLower.startsWith(queryLower);
          }).map((Hospital hospital) {
            return hospital.hospital_name;
          }).toList();

    return buildSuggestionsSuccess(suggestions);
  }

  Widget buildSuggestionsSuccess(List<String> suggestions) => ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          final queryText = suggestion.substring(0, query.length);
          final remainingText = suggestion.substring(query.length);
            return ListTile(
            onTap: () {
              query = suggestion;
              showResults(context);
              // 3. Navigate to Result Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      Information(suggestion, hospitals),
                ),
              );
            },
            leading: Icon(
              Icons.local_hospital,
              color: primaryColor,
            ),
            title: RichText(
              text: TextSpan(
                  text: queryText,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                      text: remainingText,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ]),
            ),
          );
        },
      );
}
