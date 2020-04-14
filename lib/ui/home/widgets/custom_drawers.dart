import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/ui/home/home_screen.dart';
import 'package:flutter_social_ui/ui/login/login_screen.dart';
import 'package:flutter_social_ui/ui/profile/profile_screen.dart';

class CustomDrawers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 3.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(currentUser.backgroundImageUrl),
                  fit: BoxFit.cover),
            ),
            child: Container(
              margin: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Theme
                                .of(context)
                                .primaryColor, width: 1)),
                    child: ClipOval(
                      child: Image(
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        image: AssetImage(currentUser.profileImageUrl),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      currentUser.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          _buildDrawerOption(
            Icon(Icons.dashboard),
            "Home",
                () =>
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(),
                  ),
                ),
          ),
          _buildDrawerOption(Icon(Icons.chat), "Chat", () {}),
          _buildDrawerOption(Icon(Icons.location_on), "Map", () {}),
          _buildDrawerOption(Icon(Icons.person_pin), "Your Profile", () =>
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => ProfileScreen(currentUser),
                ),
              ),
          ),
          _buildDrawerOption(Icon(Icons.settings), "Setting", () {}),
          Expanded(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: _buildDrawerOption(
                  Icon(Icons.directions_run),
                  "Logout",
                      () =>
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LoginScreen(),
                        ),
                      ),
                ),
            ),
          )

        ],
      ),
    );
  }

  _buildDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      onTap: onTap,
    );
  }
}
