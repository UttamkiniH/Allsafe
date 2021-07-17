import 'package:allsafe/screens/screens.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DataSearch extends SearchDelegate<String> {
  final hospitals = [
    'Apollo Hospitals Enterprises LTD Blood Bank',
    'Vydehi Institute of Medical Science Hospital',
    'Sparsh Hospital Blood Centre',
    'Indian Red Cross Society, Karnataka Red Cross Blood Bank Bengaluru',
    'Sagar Hospital',
    'Sri Jayadeva institute of cardiovascular sciences & research, Bengaluru',
    'yelahanka lions blood bank',
    'Dr.B.R.Ambedkar Medical College Hospital blood bank',
    'St. John\'s Medical College and Hospital',
    'ESIC Model Hospital Blood bank, Bangalore',
    'Sri Sathya Sai Institute of Higher Medical Sciences',
    'Kidwai Memorial Institute of Oncology Blood Bank, Bangalore',
    'M/S Sri Siddhartha Medical College & Hospital Blood Bank',
    'Vikram Hospital blood storage center BSU',
    'BGS Global Hospitals',
    'Sparsh super speciality Hospital Blood Bank',
    'Sri. Shankara Cancer Hospital and Research Centre',
    'Rajarajeshwari Medical College Hospital',
    'Health Care Global Enterprises LTD',
    'Mediscope Blood Bank',
    'Shrimaan Harnamdas Kapoor Blood Bank Bangalore',
    'People Tree Hospital Blood Storage Center (BSU)',
    'Bangalore Lions Service Trust, Lions Blood Bank',
    'M/S East Point Hospital Blood Bank',
  ];

  final recentHospitals = [
    'BGS Global Hospitals',
    'Sparsh super speciality Hospital Blood Bank',
    'Sri. Shankara Cancer Hospital and Research Centre',
    'Rajarajeshwari Medical College Hospital',
    'Health Care Global Enterprises LTD',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear,color: Colors.black,),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          color: Colors.black87,
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return HomeScreen();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentHospitals
        : hospitals.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
          leading: Icon(Icons.local_hospital,color:primaryColor,),
          title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
                    children: [
                       TextSpan(
                        text: suggestionList[index].substring(query.length),
                        style: TextStyle(color: Colors.black54)) 
                    ]),
          )),
      itemCount: suggestionList.length,
    );
  }
}
