import 'package:flutter/material.dart';
import 'package:ydione_plant_app/ui/screens/widgets/profile_widget.dart';

import '../../constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding:
                EdgeInsets.symmetric(vertical: 10, horizontal: size.width * .1),
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Constants.primaryColor.withOpacity(.5),
                        width: 5.0),
                  ),
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        ExactAssetImage('assets/images/profile.jpg'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: size.width * .3,
                  child: Row(
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                            color: Constants.blackColor, fontSize: 20),
                      ),
                      SizedBox(
                        height: 24.0,
                        child: Image.asset("assets/images/verified.png"),
                      ),
                    ],
                  ),
                ),
                Text(
                  'johndoe@gmail.com',
                  style: TextStyle(color: Constants.blackColor.withOpacity(.3)),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  height: size.height * .7,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      ProfileWidget(
                        icon: Icons.person,
                        title: 'My Profile',
                      ),
                      ProfileWidget(
                        icon: Icons.settings,
                        title: 'Settings',
                      ),
                      ProfileWidget(
                        icon: Icons.notifications,
                        title: 'Notifications',
                      ),
                      ProfileWidget(
                        icon: Icons.chat,
                        title: 'FAQs',
                      ),
                      ProfileWidget(
                        icon: Icons.share,
                        title: 'Share',
                      ),
                      ProfileWidget(
                        icon: Icons.logout,
                        title: 'Log Out',
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
