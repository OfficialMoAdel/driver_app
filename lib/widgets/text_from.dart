import 'package:flutter/material.dart';

class textForm extends StatelessWidget {
  const textForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextFormField(
              onChanged: (value) {},
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: Icon(Icons.search),
              )),
        ),
      ),
    );
  }
}
