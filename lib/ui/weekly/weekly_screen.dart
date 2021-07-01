import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeeklyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      var detailsHeight = constraint.maxHeight * 0.6;
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
                          top: kToolbarHeight + 20,
                          right: 20,
                          bottom: 20,
                          left: 20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                      ),
                      height: constraint.maxHeight * 0.4,
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
                                    Text(
                                      "New Delhi",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      "Friday June 30",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Light rain",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  child: SvgPicture.asset(
                                "assets/svg/storm.svg",
                                height: 70,
                                width: 70,
                                color: Colors.white,
                              )),
                            ],
                          ),
                          Container(
//                            padding: EdgeInsets.only(left: 20),
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
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40),
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
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 50),
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
                        height: detailsHeight,
                        child: ListView.separated(
                            itemBuilder: (context, index) => getDetailItem(
                                asset: "assets/icons/storm.png",
                                day: "Sat",
                                value: "32oC/26oC",
                                description: "Mostly cloudy with a thunderstorm"),
                            separatorBuilder: (context, index) => Divider(
                                  color: Colors.grey.shade200,
                                  thickness: 0.5,
                                  height: 0.5,
                                ),
                            itemCount: 7),
                      ),
                    )
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

  Widget getDetailItem(
      {required String asset,
      required String day,
      required String value,
      required String description}) {
    return ListTile(
      leading: Image.asset(
        asset,
        height: 40,
        width: 40,
      ),
      title: FittedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            FittedBox(
              child: Text(
                value,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            FittedBox(
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
