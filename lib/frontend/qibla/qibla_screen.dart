// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, prefer_final_fields, camel_case_types, sized_box_for_whitespace, unused_local_variable, curly_braces_in_flow_control_structures

import 'dart:async';
import 'dart:developer';
import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quranapp/constant/constant.dart';
import 'package:quranapp/frontend/qibla/location_error_widget.dart';

class qibla_screen extends StatefulWidget {
  const qibla_screen({super.key});

  @override
  State<qibla_screen> createState() => _qibla_screenState();
}

class _qibla_screenState extends State<qibla_screen> {
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  Future<void> _checkLocationStatus() async {
    // before running the app please enable your location

    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else
      _locationStreamController.sink.add(locationStatus);
  }

  @override
  void initState() {
    _checkLocationStatus();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _locationStreamController.close();
    FlutterQiblah().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: kprimaryColor,
        ),
        title: Center(
          child: Text(
            'Qibla Direction',
            style: TextStyle(
              color: kprimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
        actions: [
          Container(
            height: 10,
            width: 60,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: stream,
              builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: kprimaryColor,
                    ),
                  );
                }
                if (snapshot.data!.enabled == true) {
                  switch (snapshot.data!.status) {
                    case LocationPermission.always:
                    case LocationPermission.whileInUse:
                      return QiblahCompassWidget();

                    case LocationPermission.denied:
                      return LocationErrorWidget(
                        error: "Location service permission denied",
                        callback: _checkLocationStatus,
                      );
                    case LocationPermission.deniedForever:
                      return LocationErrorWidget(
                        error: "Location service Denied Forever !",
                        callback: _checkLocationStatus,
                      );
                    default:
                      return Container();
                  }
                } else {
                  return LocationErrorWidget(
                    error: "Please enable Location service",
                    callback: _checkLocationStatus,
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class QiblahCompassWidget extends StatefulWidget {
  @override
  State<QiblahCompassWidget> createState() => _QiblahCompassWidgetState();
}

Animation<double>? animation;
AnimationController? _animationController;
double begin = 0.0;

class _QiblahCompassWidgetState extends State<QiblahCompassWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  final _compassSvg = SvgPicture.asset(
    'images/compass.svg',
    height: 250,
  );

  final _needleSvg = SvgPicture.asset(
    'images/needle.svg',
    fit: BoxFit.contain,
    height: 250,
    alignment: Alignment.center,
  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: kprimaryColor,
            ),
          );
        }

        final qiblahDirection = snapshot.data!;
        animation = Tween(
                begin: begin,
                end: (qiblahDirection.direction * (pi / 180) * -1))
            .animate(_animationController!);
        begin = (qiblahDirection.direction * (pi / 180) * -1);
        // -2.151984691619873

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${qiblahDirection.direction.toStringAsFixed(4)}°",
                style: TextStyle(
                  color: kprimaryColor,
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                AnimatedBuilder(
                    animation: animation!,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: (qiblahDirection.direction * (pi / 180) * -1),
                        child: _compassSvg,
                      );
                    }),
                AnimatedBuilder(
                    animation: animation!,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: (qiblahDirection.qiblah * (pi / 180) * -1),
                        alignment: Alignment.center,
                        child: _needleSvg,
                      );
                    }),
              ],
            ),
          ],
        );
      },
    );
  }
}
