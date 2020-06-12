import 'package:eco_commerce_app/ui/widgets/productListTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routing_constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Widget> orders;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orders = new List();
    getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                  stretch: true,
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: true,
                  excludeHeaderSemantics: true,
                  leading: new Container(),
                  pinned: true,
                  floating: false,
                  elevation: 0,
                  expandedHeight: MediaQuery.of(context).size.height * (3 / 5),
                  flexibleSpace: FlexibleSpaceBar(
                    background: ProfileFlexibleAppBar(),
                    title: Container(
                        padding: EdgeInsets.only(left: 0),
                        child: Text(
                          "Your Orders",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 15,
                              color: Color(0xff464646)),
                        )),
                  )),
              SliverList(delegate: SliverChildListDelegate(orders)),
            ],
          ),
          Positioned(
              left: MediaQuery.of(context).size.width / 2 - 120,
              right: MediaQuery.of(context).size.width / 2 - 120,
              bottom: 100,
              child: Container(
                height: 40,
                child: RaisedButton(
                  onPressed: () {
                    print("WishList");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Your WishList",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 24,
                        color: Colors.white),
                  ),
                  color: Color(0xff004445),
                ),
              )),
          Positioned(
              left: MediaQuery.of(context).size.width / 2 - 90,
              right: MediaQuery.of(context).size.width / 2 - 90,
              bottom: 20,
              child: Container(
                height: 40,
                child: RaisedButton(
                  onPressed: () {
                    print("Sign Out");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "SIGN OUT",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 24,
                        color: Colors.white),
                  ),
                  color: Color(0xff004445),
                ),
              )),
        ],
      ),
    );
  }

  void getOrders() {
    //TODO:: getActual Orders
    orders.add(ProductListTile());
    orders.add(ProductListTile());
    orders.add(ProductListTile());
    orders.add(ProductListTile());
    orders.add(ProductListTile());
    orders.add(ProductListTile());
  }
}

class ProfileFlexibleAppBar extends StatefulWidget {
  const ProfileFlexibleAppBar();

  @override
  _ProfileFlexibleAppBarState createState() => _ProfileFlexibleAppBarState();
}

class _ProfileFlexibleAppBarState extends State<ProfileFlexibleAppBar> {
  String userUsername;
  String userEmail;
  String userContact;
  String org;
  String location;

  //TODO:: If It's Text Widget remove these
  TextEditingController organisationController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    super.initState();

    //TODO :: get actual values
    userUsername = "Pourav Raj";
    userEmail = "pourav.raj@xyz.com";
    userContact = "+91 9424XXXX01";
    org = "XYZ Technologies Pvt. Ltd";
    location = "New Delhi";
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(
                          left: 20, top: 20, right: 50, bottom: 4),
                      child: Text(
                        userUsername,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 40,
                            color: Color(0xff464646)),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        userEmail,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 28,
                            color: Color(0xff464646)),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        userContact,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 28,
                            color: Color(0xff464646)),
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.all(20),
                height: 100,
                width: 100,
                child: CircleAvatar(
                  //TODO:: GET IMAGE
                  child: Image.asset('assets/images/preSignUpSlider1.png'),
                ),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: ListTile(
              title: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Organisation",
                        style: TextStyle(fontSize: 24),
                      ),
                      InkWell(
                          onTap: () {
                            print("Add New");
                            Navigator.pushReplacementNamed(
                                context, UserOptionalRoute);
                          },
                          child: Text(
                            "Add+",
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  )),
              subtitle: new TextField(
                controller: organisationController,
                decoration: new InputDecoration(
                  hintText: org,
                  border: new OutlineInputBorder(
                      borderSide:
                          new BorderSide(width: 2, color: Colors.black)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: ListTile(
              title: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Location",
                    style: TextStyle(fontSize: 24),
                  )),
              subtitle: new TextField(
                controller: locationController,
                decoration: new InputDecoration(
                  hintText: location,
                  border: new OutlineInputBorder(
                      borderSide:
                          new BorderSide(width: 2, color: Colors.black)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
