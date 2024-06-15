import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxiapp/src/bloc/auth_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(10.7915178, 106.7271422),
                zoom: 14.4746,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    title: const Text('iCab'),
                    centerTitle: true,
                    leading: const Icon(Icons.menu),
                    actions: const [
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.notifications_none),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        width: 350,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10, right: 20),
                                  child: Icon(Icons.location_on),
                                ),
                                Text(
                                  'P17, Bình Thạnh, HCM',
                                  style: TextStyle(fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(Icons.close, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        width: 350,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10, right: 20),
                                  child: Icon(
                                    Icons.my_location,
                                    color: Colors.blue,
                                  ),
                                ),
                                Text(
                                  'Home',
                                  style: TextStyle(fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.close,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
