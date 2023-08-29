import 'package:flutter/material.dart';
import '../widgets/active_groups_tiles.dart';
import '../widgets/engagements_tiles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'All',),
    Tab(text: 'Today',),
    Tab(text: 'Starred',),
    Tab(text: 'Recent',),

  ];

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // shadowColor: Colors.white,
        title: Text('Home', style: TextStyle(fontSize: 24),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text('Active groups', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),),
                    ),
                    FlatButton(
                      // color: Colors.white,
                      onPressed: () {},
                      child: Text('Start new group', style: TextStyle(color: Color(0XFF66ff66)),),
                    ),
                  ],
                ),
              ),
              Container(
                child: ActiveGroupsTiles(),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: FlatButton(
                  child: Text('View All', style: TextStyle(color: Color(0XFF66ff66),),),
                  onPressed: () {},
                )
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Engagements', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
              ),
              TabBar(
                labelColor: Color(0XFF66ff66),
                unselectedLabelColor: Colors.white,
                indicatorColor: Color(0XFF66ff66),
                controller: _tabController,
                tabs: myTabs,
              ),
              Container(
                height: 300,
                child: TabBarView(
                  controller: _tabController,
                  children: myTabs.map((Tab tab) {
                    final String label = tab.text.toLowerCase();
                    return EngagementsTiles();
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
