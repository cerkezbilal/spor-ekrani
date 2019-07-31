import 'package:ekran_tasarimi/attr.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'attr.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Uygulama Girişi",
  home: HomePage(),
));

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ContentPage(),
    );
  }

}

class ContentPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: CarouselSlider(
       autoPlay: false,
        enableInfiniteScroll: false,
        initialPage: 0,
        reverse: false,
        viewportFraction: 1.0,
        aspectRatio: MediaQuery.of(context).size.aspectRatio,
        height: MediaQuery.of(context).size.height,
        items: [0,1,2].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  color: bgColor,


                  child: AppIntro(i),

              );
            },
          );
        }).toList(),
      ),
    );
  }

}

class AppIntro extends StatefulWidget{
  int index;
  AppIntro(this.index);
  @override
  _AppIntroState createState() => _AppIntroState();

}
class _AppIntroState extends State<AppIntro>{

  @override
  void initState() {

    super.initState();
    print(widget.index);
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,

          child: Stack(
            children: <Widget>[
              Positioned(
                top:22,left: 24,
                  child: Text(
                    "Numero\u00B9",
                     style: TextStyle(fontFamily: "AvenirBold",fontSize: 24),
                ),
              ),
              Positioned(
                right: 24, top: 22,
                child: new Text(
                  widget.index == 2 ? "DONE" : "SKIP",
                  style: TextStyle(
                    fontSize: 22,
                    color: textColor,
                    fontFamily: "SultanNahia"
                  ),
                ),
              ),
            ],
          ),
        ),

        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 36),
          height: MediaQuery.of(context).size.height-200,
          child: Column(
            children: <Widget>[
              Image.asset(imagePath[widget.index],fit: BoxFit.fitWidth,
                height: 360,),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Center(
                  child: new Text(title[widget.index],
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Caslon",
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: new RichText(
                  textAlign: TextAlign.center,
                  text: new TextSpan(
                    style: new TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                        text: description[widget.index],
                        style: new TextStyle(
                          fontFamily: "Avenir"
                        ),
                      ),
                      new TextSpan(
                        text: widget.index == 0 ? "Numero1" : "",
                        style: new TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: "AvenirBold",
                        ),
                      ),

                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          height: 80,

          child: Stack(
            children: <Widget>[
              DotsIndicators(widget.index),
              Center(
                child: new Text(
                  widget.index != 2 ?
                  "SCROLL RIGHT" : "",
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontSize: 10
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: widget.index != 2 ? 36 : 0,
                child: widget.index !=2 ? Image.asset("assets/images/arrow"
                    ".png",width: 30,) :
                LetsGo(),
              )
            ],
          ),
        ),
      ],
    );
  }

}

class DotsIndicators extends StatefulWidget{
  int pageIndex;
  DotsIndicators(this.pageIndex);

  @override
  _DotsIndicatorsState createState() => _DotsIndicatorsState();

}

class _DotsIndicatorsState extends State<DotsIndicators>{
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,int index){
        return Container(
          margin: EdgeInsets.only(right: index != 2 ? 4 : 0),
          width: 10,
          height: 10,

          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            shape: BoxShape.circle,
            color: index == widget.pageIndex ? Colors.black : bgColor,
          ),

        );
        }
    );
  }

}
class LetsGo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 120,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 32,
            left: 24,
            child: Text("LET'S GO!", style: TextStyle(
                color: Colors.white,
              fontFamily: "AvenirBold"
            ),),
          ),
        ],
      )
    );
  }

}


