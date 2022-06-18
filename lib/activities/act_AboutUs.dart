import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takichaiproject/components/comp_songcard.dart';
import 'package:about/about.dart';
import 'package:pubspec/pubspec.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AboutPage(
                values: {
                  'version': "1.0",
                  'buildNumber': "1.0",
                  'year': DateTime.now().year.toString(),
                  'author': "Kenny, Daniel, Leonardo, Juan Diego, Roger",
                },
                title: const Text('About'),
                applicationVersion:
                    'Version {{ version }}, build #{{ buildNumber }}',
                applicationDescription: const Text(
                  "Takichai es una App Móvil que permite la difusión musical, busca brindar a los artistas independientes la mejor opción respecto al promocionarse y hacer llegar sus obras a más público. ",
                  textAlign: TextAlign.justify,
                ),
                applicationIcon: Image.asset('../../assets/images/unmsm-logo.png'),
                applicationLegalese: 'Copyright © {{ author }}, {{ year }}',
                children: const <Widget>[
        MarkdownPageListTile(
          filename: 'README.md',
          title: Text('View Readme'),
          icon: Icon(Icons.all_inclusive),
        ),
        MarkdownPageListTile(
          filename: 'CHANGELOG.md',
          title: Text('View Changelog'),
          icon: Icon(Icons.view_list),
        ),
        MarkdownPageListTile(
          filename: 'LICENSE.md',
          title: Text('View License'),
          icon: Icon(Icons.description),
        ),
        MarkdownPageListTile(
          filename: 'CONTRIBUTING.md',
          title: Text('Contributing'),
          icon: Icon(Icons.share),
        ),
        MarkdownPageListTile(
          filename: 'CODE_OF_CONDUCT.md',
          title: Text('Code of conduct'),
          icon: Icon(Icons.sentiment_satisfied),
        ),
        LicensesPageListTile(
          title: Text('Open source Licenses'),
          icon: Icon(Icons.favorite),
        ),
      ],)
                );
  }
}
