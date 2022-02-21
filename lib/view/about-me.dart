import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
                child: Text("Name : Bhupesh Sen",
                    style: Theme.of(context).textTheme.headline1)),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text("Mobile : 7974430255",
                    style: Theme.of(context).textTheme.headline1)),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text("Email : Bhupeshsen11@gmail.com",
                    style: Theme.of(context).textTheme.headline1)),
          ],
        ),
      ),
    );
  }
}
