import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:vitemoncarburant/app/data/models/search/records/point.dart';
import 'package:vitemoncarburant/app/data/models/search/records/record.dart';

class StationItemMap extends StatefulWidget {

  final AvailableMap? map;
  final Record record;

  StationItemMap(this.map, this.record, {Key? key}) : super(key: key);

  @override
  _StationItemMapState createState() => _StationItemMapState();
}

class _StationItemMapState extends State<StationItemMap> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async => await _launchMap(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 25,
            children: [
              if(widget.map?.icon != null) SvgPicture.asset(widget.map!.icon, height: 50),
              if(widget.map?.mapName != null) Text(widget.map!.mapName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
            ],
          ),
          Icon(Icons.navigate_next_rounded, size: 40)
        ],
      ),
    );
  }

  Future<void> _launchMap() async {

    Point? point = widget.record.recordField.point;

    await EasyLoading.show(status: 'Chargement ...', maskType: EasyLoadingMaskType.black);

    if(point != null && widget.map != null) {
      await EasyLoading.dismiss();
      await widget.map!.showMarker(
          coords: Coords(point.latitude, point.longitude),
          title: widget.record.recordField.address
      );
    } else {
      await EasyLoading.showError('Aucune coordonnée enregistrée\npour cette adresse', duration: Duration(seconds: 2));
    }
  }
}
