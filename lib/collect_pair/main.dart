import 'package:flutter/material.dart';
import 'package:flutter_starter/collect_pair/pages/FavoriteList.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'MyAppState.dart';
import 'pages/GeneratorPage.dart';

extension MaterialStateSet on Set<MaterialState> {
  bool get isHovered => contains(MaterialState.hovered);

  bool get isPressed => contains(MaterialState.pressed);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return MyAppState();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
          scaffoldBackgroundColor: Colors.pink[100],
          textTheme: GoogleFonts.aladinTextTheme(),
          // useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(),
        home: const MyHomePage(title: 'Word Gen'),
      ),
    );
  }
}

class ButtonBackgroundColor implements MaterialStateProperty<Color?> {
  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.isPressed) {
      return Colors.pink[600];
    }
    return null;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title = 'title'});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String> getF() async {
    return "String Value";
  }

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const GeneratorPage();
      case 1:
        page = const FavoriteList();
      default:
        page = const Placeholder();
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'menu',
            onPressed: () {
              appState.toggleExtended();
            },
          ),
        ),
        body: Row(
          children: [
            // constraints.maxWidth >= 600
            NavigationRail(
              // useIndicator: true,
              extended: appState.extended,
              // labelType: NavigationRailLabelType.selected,
              groupAlignment: -1,
              destinations: const [
                NavigationRailDestination(
                    selectedIcon: Icon(Icons.home), icon: Icon(Icons.home_outlined), label: Text('home')),
                NavigationRailDestination(icon: Icon(Icons.favorite), label: Text('favorite')),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: page)
          ],
        ),
      );
    });
  }
}
