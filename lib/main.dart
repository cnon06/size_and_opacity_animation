import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with SingleTickerProviderStateMixin {

  late AnimationController animationController;
 // late AnimationController sizeAnimationController;

  int action = 1;

  void animation()
  {

    animationController.forward();

    animationController.addListener(() {
    //  print('${animationController.value}');
      setState((){});
    });

  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      value: 1,
      vsync: this,
      duration: Duration(seconds: 5),
    );

    //animation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("C-NON",
              style: TextStyle(
                  fontSize:
                  action==2? animationController.value*100 : 100,
                  //fontSize: animationController.value*100
               // color: Colors.orange.withOpacity(0.3),
                color:

               action==1? Colors.orange.withOpacity(animationController.value): Colors.orange,
              ),
            ),
            TextButton(onPressed: (){
              action=1;
              animationController.reset();
              animationController.duration=Duration(seconds: 5);
              animation();

            }, child: Text("Opacity Animation",
            style: TextStyle(fontSize: 20),
            )
            ),

            TextButton(onPressed: (){
              action=2;
              animationController.reset();
              animationController.duration=Duration(seconds: 5);
              animation();

            }, child: Text("Size Animation",
              style: TextStyle(fontSize: 20),
            )
            ),

          ],
        ),
      ),

    );
  }
}
