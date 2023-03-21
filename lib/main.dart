import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyApp());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  String nom = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
          Text("Bienvenue sur le questionnaire du MINSANTE",
              style: Theme.of(context).textTheme.headlineLarge,
              selectionColor: Color.fromARGB(255, 255, 11, 11)),
          InkWell(
              child: const Text("Cliquer ici pour ouvrir le questionnaire"),
              onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Entrer votre nom:"),
                        content: TextField(controller: controller),
                        actions: [
                          InkWell(
                            child: const Text("Valider"),
                            onTap: () => showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Deuxième question"),
                                    content: TextField(controller: controller2),
                                    actions: [
                                      OutlinedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("valider monsieur")),
                                      const CloseButton()
                                    ],
                                  );
                                }),
                          
                          ),
                          //OutlinedButton(),
                          const CloseButton()
                        ],
                      );
                    },
                  )),
          const Text("Votre réponse est:"),
          Text(nom, style: Theme.of(context).textTheme.headlineMedium)
        ])));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
