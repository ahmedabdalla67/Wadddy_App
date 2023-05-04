import 'package:first_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Track Code',
        style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            defaultTextForm(
                controller: searchController,
                type: TextInputType.text,
                text: 'track code',
                prefix: Icons.search,
                valid: (String? value)
                {
                  if(value!.isEmpty) {
                    return 'search must not be empty';
                  }
                  return null;
                },
                onChange: (String value)
                {

                }
            ),
          ],
        ),
      ),
    );
  }
}
