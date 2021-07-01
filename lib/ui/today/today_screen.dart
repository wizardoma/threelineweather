import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TodayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      var detailsHeight = constraint.maxHeight * 0.35;
      return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: constraint.maxHeight,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: kToolbarHeight + 20, right: 20, bottom: 20, left: 20),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/weather_bg_raining.jpg")
                        )
                      ),
                      height: constraint.maxHeight * 0.65,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("New Delhi", style: TextStyle(
                                      color: Colors.white, fontSize: 22, fontWeight: FontWeight.w300
                                    ),),
                                    Text("Friday June 30", style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.w500,
                                    ),),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Light rain", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),)
                                  ],
                                ),
                              ),
                              Container(
                                child: SvgPicture.asset("assets/svg/storm.svg",height: 70, width: 70,color: Colors.white,)
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: '14',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 80)),
                                WidgetSpan(
                                  child: Transform.translate(
                                    offset: const Offset(2, -50),
                                    child: Text(
                                      'o',
                                      //superscript is usually smaller in size
                                      textScaleFactor: 0.7,
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
                                    ),
                                  ),
                                ),
                                WidgetSpan(
                                  child: Transform.translate(
                                    offset: const Offset(2, -40),
                                    child: Text(
                                      'C',
                                      //superscript is usually smaller in size
                                      textScaleFactor: 0.7,
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),
                                    ),
                                  ),
                                ),

                              ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: constraint.maxWidth,

                        padding: EdgeInsets.only(left: detailsHeight * 0.1, right: detailsHeight * 0.1, top: detailsHeight * 0.1),
                        height: detailsHeight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(

                              height: detailsHeight * 0.38,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  getDetailItem(asset: "assets/icons/temperature.png", title: "Feels like", value: "22 o C")
                                  ,getDetailItem(asset: "assets/icons/humidity.png", title: "Humidity", value: "94%")

                                ],
                              ),
                            ),
                            Container(

                              height: detailsHeight * 0.38,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  getDetailItem(asset: "assets/icons/wind.png", title: "Wind", value: "13 km/hr")
                                 , getDetailItem(asset: "assets/icons/uv.png", title: "UV index", value: "7")

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  width: constraint.maxWidth,
                  height: kToolbarHeight,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      ),
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
//              Positioned(child: Text("Hello"),top: 20,),
            ],
          ),
        ),
      );
    });
  }

  Widget getDetailItem({required String asset, required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Image.asset(
        asset,
        height: 40,
        width: 40,
      ),
      SizedBox(width: 20,),
      Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.grey.shade400, fontSize: 18),),
          Text(value, style: TextStyle(fontWeight: FontWeight.w900),),
        ],
      ),
    ]);

  }
}
