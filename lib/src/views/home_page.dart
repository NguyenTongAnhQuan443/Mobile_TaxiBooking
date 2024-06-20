import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxiapp/src/bloc/auth_bloc.dart';
import 'package:taxiapp/src/views/widgets/ride_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: [
            const GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(10.7915178, 106.7271422),
                zoom: 14.4746,
              ),
            ),
            Column(
              children: [
                // App Bar
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      title: const Text('iCab'),
                      centerTitle: true,
                      leading: IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        icon: const Icon(Icons.menu),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: IconButton(
                              onPressed: () {
                                print('object');
                              },
                              icon: Icon(Icons.notifications_none)),
                        ),
                      ],
                    )),
                // RidePicker
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: RidePicker(),
                ),
              ],
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: const EdgeInsets.only(left: 10),
            children: <Widget>[
              const SizedBox(
                height: 60,
              ),
              Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.perm_identity_rounded,
                      color: Colors.blue,
                      size: 30,
                    ),
                    title: const Text('My Profile'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.refresh,
                      color: Colors.blue,
                      size: 30,
                    ),
                    title: const Text('Ride History'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.percent_sharp,
                      color: Colors.blue,
                      size: 30,
                    ),
                    title: const Text('Offers'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.notifications_none,
                      color: Colors.blue,
                      size: 30,
                    ),
                    title: const Text('Notification'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.help_outline,
                      color: Colors.blue,
                      size: 30,
                    ),
                    title: const Text('Help & Support'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.settings,
                      color: Colors.blue,
                      size: 30,
                    ),
                    title: const Text('Setting'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout_sharp,
                      color: Colors.blue,
                      size: 30,
                    ),
                    title: const Text('Logout'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
