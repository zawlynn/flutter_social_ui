import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/models/user_model.dart';
import 'package:flutter_social_ui/ui/home/widgets/user_posts.dart';

import 'widgets/custom_drawers.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage:0,viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FRENZY",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
              letterSpacing: 5),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Theme.of(context).primaryColorLight,
          indicatorWeight: 3,
          labelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 18),
          tabs: <Widget>[
            Tab(
              child: Text(
                "Trending",
              ),
            ),
            Tab(
              child: Text(
                "Latest",
              ),
            )
          ],
        ),
      ),
      drawer: CustomDrawers(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20,20,20,10,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Following",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 80,
            child: ListView.builder(
              itemCount: users.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                User user = users[index];
                return _buildUserList(context, user);
              },
            ),
          ),
          UserPosts(_pageController,"Posts",posts),
        ],
      ),
    );
  }

  _buildUserList(BuildContext context, User user) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 60,
        height: 60,
        margin: EdgeInsets.all(10),
        child: ClipOval(
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage(user.profileImageUrl),
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6.0,
              offset: Offset(0,2),
            )
          ],
          border: Border.all(color: Theme.of(context).primaryColor, width: 1),
        ),
      ),
    );
  }
}
