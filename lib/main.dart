import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: const MyHomePage(title: 'HyperSpectral Imaging'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isLiveview = false;
  bool _isImagingExpanded = false;
  bool _isStageExpanded = false;

  void _liveviewSwitchOnChanged(bool valueChanged) {
    setState(() {
      _isLiveview = valueChanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: ExpansionPanelList(
              children: [
                ExpansionPanel(
                    headerBuilder: (BuildContext context, _isExpanded) {
                      return const ListTile(
                        title: Text("Imaging"),
                        leading: Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.amber,
                        ),
                      );
                    },
                    body: ListTile(
                      leading: Icon(Icons.camera),
                      subtitle: Column(
                        children: [
                          Row(children: [
                            Switch(
                                value: _isLiveview,
                                onChanged: _liveviewSwitchOnChanged),
                            Text("Liveview")
                          ]),
                          Row(children: [
                            Switch(
                                value: _isLiveview,
                                onChanged: _liveviewSwitchOnChanged),
                            Text("OM")
                          ]),
                          Switch(
                              value: _isLiveview,
                              onChanged: _liveviewSwitchOnChanged),
                          Switch(
                              value: _isLiveview,
                              onChanged: _liveviewSwitchOnChanged),
                        ],
                      ),
                    ),
                    isExpanded: _isImagingExpanded),
                ExpansionPanel(
                    headerBuilder: (BuildContext context, _isExpanded) {
                      return const ListTile(
                        title: Text("Stage"),
                      );
                    },
                    body: ListTile(
                      leading: Icon(Icons.camera),
                      subtitle: Column(
                        children: [
                          Switch(
                            value: _isLiveview,
                            onChanged: _liveviewSwitchOnChanged,
                            activeColor: Colors.amber,
                          ),
                        ],
                      ),
                    ),
                    isExpanded: _isStageExpanded),
              ],
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  switch (index) {
                    case 0:
                      _isImagingExpanded = !isExpanded;
                      break;
                    case 1:
                      _isStageExpanded = !isExpanded;
                      break;
                  }
                });
              },
              animationDuration: const Duration(milliseconds: 150)),
        ));
  }
}
