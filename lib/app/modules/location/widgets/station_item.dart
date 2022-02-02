import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:vitemoncarburant/app/core/values/colors.dart';
import 'package:vitemoncarburant/app/core/values/size.dart';
import 'package:vitemoncarburant/app/data/models/search/records/record.dart';
import 'package:vitemoncarburant/app/modules/location/widgets/station_item_info.dart';
import 'package:vitemoncarburant/app/modules/location/widgets/station_item_map.dart';
import 'package:vitemoncarburant/app/widgets/modal_bottom_sheet_builder.dart';

class StationItem extends StatefulWidget {
  final Record record;

  StationItem(this.record, {Key? key}) : super(key: key);

  @override
  _StationItemState createState() => _StationItemState();
}

class _StationItemState extends State<StationItem> {

  late List<AvailableMap> availableMap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await _onTapItem(context),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration:
        BoxDecoration(color: grey, borderRadius: BorderRadius.circular(6)),
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          children: [
            StationItemInfo(widget.record),
            SizedBox(
              width: 25,
              child: Icon(Icons.arrow_forward_ios_rounded, size: 32),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onTapItem(context) async {

    availableMap = await MapLauncher.installedMaps;

    ModalBottomSheetBuilder(
      context: context,
      hapticFeedback: true,
      child: Container(
        padding: container,
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Wrap(
          runSpacing: 15,
          children: availableMap.map((e) => StationItemMap(e, widget.record)).toList(),
        )
      )
    );
  }
}
