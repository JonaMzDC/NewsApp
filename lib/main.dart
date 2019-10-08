import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());
const swatch_1 = Color(0xff91a1b4);
const swatch_2 = Color(0xffe3e6f3);
const swatch_3 = Color(0xffbabdd2);
const swatch_4 = Color(0xff545c6b);
const swatch_5 = Color(0xff363cb0);
const swatch_6 = Color(0xff09090a);
const swatch_7  = Color(0xff25255b);


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News app ',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Lastest news'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController;
  double backgroundHeight = 120.0;


  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener((){
        setState(() {
          backgroundHeight = max(0,
              120 - _scrollController.offset);
        });
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

          title: Padding(
            padding: const EdgeInsets.only(left:32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.title, style: TextStyle(
                  color:  Colors.black,
                  fontSize: 30.0,

                ),),

                Text("Discover things of this world" , style: TextStyle(
                  color:  swatch_1,
                  fontSize: 16.0

                ),)


              ],
            )
          ),
        backgroundColor: swatch_3.withOpacity(0.3),
        elevation: 0.0,
        centerTitle: false,

        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:32.0),
            child: InkWell(
              child: Icon(Icons.share, color: swatch_1 ,)
            ),
          )
        ],
      ),
      body: _body(),
    );
  }

  Widget _body()
  {
    return Stack
      (
      children:<Widget>

      [
        Container
          (
            width: double.infinity,
            height: backgroundHeight,
            color: swatch_3.withOpacity(0.3),
          ),
        ListView
          (
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            children: <Widget>
            [
            _bigItem(),
            _newsItem("Times","The Trump Impeachment Inquiry: Latest Updates" , "https://static01.nyt.com/images/2019/10/07/nyregion/07NYTrump/merlin_162142308_f1ed51d7-3b60-4e69-a9bb-9cb3f5c68d2e-jumbo.jpg?quality=90&auto=webp" ),
            _newsItem("El sol de jerezn","Quarter Million Bay Area Residents Face Power Outage Threat", "https://www.washingtonpost.com/resizer/VvvOtgf3maGeyNYe0odAm672ebQ=/1440x0/smart/arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/WMQMTUHJJYI6TEYGI7FQGJH5IQ.jpg"),

            _newsItem("Arizona's sun","U.S. Pastor Arrested in Rwanda Has Criticized Government for 'Heathen Practices'", "https://static01.nyt.com/images/2019/10/07/world/07rwanda1/07rwanda1-jumbo.jpg?quality=90&auto=webp"),

            ],
        )
     ],
    );



  }

  Widget _bigItem(){
    var screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: (screenWidth-64)*3/5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.0),
              image: DecorationImage(
                image: AssetImage('assets/big_item.png'),
              ),

          ),
        ),
        Container(
          width: 64,
            height: 64,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
                color: Colors.white

            ),
            child: Icon(Icons.play_arrow, color:  swatch_7, size: 40.0,),
        )
      ]
    );
  }
  Widget _newsItem(String title,String nombre , String strImage){
     return Padding(
       padding: const EdgeInsets.symmetric(vertical: 16),
       child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: swatch_7

                        ),
                        child: Center(child: Text(title[0],
                            style: TextStyle(
                              color: Colors.white
                            ),
                        )),
                      ),
                      Text("  "+title)
                    ],
                  ),
                  Text(nombre, style: TextStyle(

                    color: swatch_7,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text('Discover things of the world', style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: swatch_3,
                    fontSize: 12,
                  ),),
                ],
              ),
            ),
            SizedBox(width: 24.0,),
            Container(
              width: 150,
              height: 150,


              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  image: DecorationImage(

                    image:  Image.network(strImage).image, fit: BoxFit.cover,
                  ),

              ),
            ),

          ],


       ),
     );
  }

}
