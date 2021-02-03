import 'package:flutter/material.dart';
import 'package:school_flutter/navigation_drawer/navigationDrawer.dart';


class Section extends StatefulWidget {
  @override
  _SectionState createState() => _SectionState();
}

class _SectionState extends State<Section> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Section')],
    );

  }
}