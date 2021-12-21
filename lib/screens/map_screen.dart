import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocore/base.dart';
import 'dart:ui';
import 'package:latlong2/latlong.dart';
import 'package:geocore/crs.dart';
import 'package:geocore/geo.dart';

class MapScreen extends StatefulWidget {
  static const routeName = "mapScreen";

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final MapController controller;
  late final LatLngBounds asd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if (mounted) {
    // asd = LatLngBounds(LatLng(34.40086810657827,31.454637975880882),LatLng(34.511721980486115,31.54698173758951));
    //   // controller = MapController();
    //   // setState(() {
    //   //     controller.move(
    //   //         asd.center,
    //   //         controller.zoom);
    //   // });
    // }
  }

  @override
  Widget build(BuildContext context) {
    // controller.fitBounds(asd);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map").tr(),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
        child: FlutterMap(
          // mapController: controller,
          options: MapOptions(
            center: LatLng(53.19955, 68.904662),
            //zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
              tileSize: 768,
              wmsOptions: WMSTileLayerOptions(
                  baseUrl: 'http://appserver:8080/geoserver/cite/wms?',
                  format: 'application/openlayers',
                  transparent: true,
                  version: "1.1.0",
                  layers: ['cite:V_LANDMARKS_V2'],
                  crs: Epsg4326(),
                  otherParameters: {
                    "service": "WMS",
                    // "bbox":"34.40086810657827,31.454637975880882,34.511721980486115,31.54698173758951",
                    "request": "GetMap",
                    "srs": "EPSG:4326"
                  }),
              // urlTemplate:
              //    // "http://appserver:8080/geoserver/gwc/service/wmts?layer=cite:test_ahijazi&style=&tilematrixset=EPSG:4326&Service=WMTS&Request=GetTile&Version=1.0.0&Format=image/png&TileMatrix=EPSG:4326:%d&TileCol=%d&TileRow=%d"
              //    "http://appserver:8080/geoserver/cite/wms?service=WMS&version=1.1.1&request=GetMap&layers=cite:V_LANDMARKS_V2&bbox=34.40086810657827,31.454637975880882,34.511721980486115,31.54698173758951&width=256&height=256&srs=EPSG:4326&format=image/png&transparent=true"
              // "http://appserver:8080/geoserver/cite/wms" +
              //     "?service=WMS" +
              //     "&version=1.1.1" +
              //     "&request=GetMap" +
              //     "&layers=cite:V_LANDMARKS_V2" +
              //     "&bbox=34.40086810657827,31.454637975880882,34.511721980486115,31.54698173758951" +
              //     "&width=256" +
              //     "&height=256" +
              //     "&srs=EPSG:4326" +  //900913,3857// NB This is important, other SRS's won't work.
              //     "&format=image/png" +
              //     "&transparent=true"
            ),
          ],
        ),
      ),
    );
  }
}
