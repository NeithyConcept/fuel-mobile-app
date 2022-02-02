import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vitemoncarburant/app/core/utils/global.dart';
import 'package:vitemoncarburant/app/data/models/search/records/point.dart';
import 'package:vitemoncarburant/app/data/models/search/records/record.dart';
import 'package:vitemoncarburant/app/data/services/geolocation_service.dart';
import 'package:vitemoncarburant/app/modules/location/widgets/station_prices.dart';

class StationItemInfo extends StatefulWidget {

  final Record record;

  StationItemInfo(this.record, {Key? key}) : super(key: key);

  @override
  _StationItemInfoState createState() => _StationItemInfoState();
}

class _StationItemInfoState extends State<StationItemInfo> {

  late GeolocationService _geolocationService;
  double distance = -1;
  StreamSubscription<double?>? geoStream;

  @override
  void initState() {
    super.initState();
    _geolocationService = GeolocationService();
  }

  @override
  void dispose() {
    if(geoStream != null) geoStream!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Point? stationPosition = widget.record.recordField.point;

    if(stationPosition != null) {
      geoStream = _geolocationService.distanceFromCurrent(stationPosition.latitude, stationPosition.longitude)
          .asStream().listen((value) => distance = value ?? -1);
    }

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 290, minWidth: 250),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 5,
            children: [
              if (widget.record.recordField.brand != null) Text(widget.record.recordField.brand as String, style: TextStyle(fontSize: 14)),
              if(distance > -1) Text("~" + Utils.parseMeterDistance(distance), style: TextStyle(fontSize: 14)),
            ],
          ),
          Text(widget.record.recordField.name ?? widget.record.recordField.city,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                  decoration: widget.record.recordField.name != null ? TextDecoration.none : TextDecoration.lineThrough),
              overflow: TextOverflow.fade,
              softWrap: false),
          SizedBox(height: 15),
          StationPrices(widget.record.recordField.fuels)
        ],
      ),
    );
  }
}
