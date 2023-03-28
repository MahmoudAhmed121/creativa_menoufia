import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mahmoud/feautres/home/screen/get_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();

  
  
}

class _AccountPageState extends State<AccountPage> {

   var c = Get.put(UserController());
    

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 200,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  height: 150,
                  width: double.infinity,
                  child: SvgPicture.asset(
                    'assets/images/mahmoud.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  c.name.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  c.email.toString(),
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Divider(),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(FontAwesomeIcons.addressCard),
                  title: Text('Change Password'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.bell),
                  title: Text('Notifications'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.questionCircle),
                  title: Text('Help'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.signOutAlt),
                  title: Text('Logout'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
