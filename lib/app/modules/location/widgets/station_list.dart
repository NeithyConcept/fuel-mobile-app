import 'package:flutter/material.dart';
import 'package:vitemoncarburant/app/data/models/search/search.dart';
import 'package:vitemoncarburant/app/modules/location/widgets/station_item.dart';

class StationList extends StatefulWidget {
  final Search search;

  StationList(this.search, {Key? key}) : super(key: key);

  @override
  _StationListState createState() => _StationListState();
}

class _StationListState extends State<StationList> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 15,
      children: widget.search.records.map((e) => StationItem(e)).toList(),
    );
  }
}
