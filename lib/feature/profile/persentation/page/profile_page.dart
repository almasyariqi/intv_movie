import 'package:flutter/material.dart';
import 'package:intv_movie/core/utils/size_config.dart';
import 'package:intv_movie/core/utils/widget_constants.dart';

//Please don't mind this, it's just a singleline hardcoded UI Code :)

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      body: Container(
        width: getScreenWidth(),
        height: getScreenHeight(),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenHeight(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              size: getProportionateScreenWidth(120),
              color: Colors.blueGrey,
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              "Muhamad Riadi Almasyariqi",
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              "Software Engineer - Mobile",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(15),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Container(
              width: getScreenWidth(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_movies,
                        size: getProportionateScreenWidth(80),
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(3),
                      ),
                      Text(
                        "21",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(20),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(3),
                      ),
                      Text(
                        "Favourite Movies",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(10),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(50),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.live_tv,
                        size: getProportionateScreenWidth(80),
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(3),
                      ),
                      Text(
                        "05",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(20),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(3),
                      ),
                      Text(
                        "Favourite TV Shows",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(80),
            ),
            Container(
              width: getProportionateScreenWidth(150),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(5),
                  vertical: getProportionateScreenHeight(5)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(5),
                  ),
                  border: Border.all(
                    color: Colors.orange,
                    width: 1.0
                  ),
                  boxShadow: [defaultBoxShadow]),
              child: const Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}
