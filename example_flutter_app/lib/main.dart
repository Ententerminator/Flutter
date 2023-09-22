import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Example App Flutter'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: const Text('NewPage1'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NewPage1()));
              },
            ),
            ElevatedButton(
              child: const Text('NewPage2'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NewPage2()));
              },
            ),
            ElevatedButton(
              child: const Text('NewPage3'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NewPage3()));
              },
            ),
            ElevatedButton(
              child: const Text('NewPage4'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NewPage4()));
              },
            ),
            ElevatedButton(
              child: const Text('NewPage5'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NewPage5()));
              },
            ),
            ElevatedButton(
              child: const Text('NewPage6'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NewPage6()));
              },
            ),
          ],
        ),
      ),
      endDrawer: const MyDrawer(),
    );
  }
}

class NewPage1 extends StatelessWidget {
  const NewPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppbar(),
      body: Center(child: Text('Hello There1')),
      endDrawer: MyDrawer(),
    );
  }
}

class NewPage2 extends StatelessWidget {
  const NewPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppbar(),
      body: Center(child: Text('Hello There2')),
      endDrawer: MyDrawer(),
    );
  }
}

class NewPage3 extends StatelessWidget {
  const NewPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppbar(),
      body: Center(child: Text('Hello There3')),
      endDrawer: MyDrawer(),
    );
  }
}

class NewPage4 extends StatelessWidget {
  const NewPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppbar(),
      body: Center(child: Text('Hello There4')),
      endDrawer: MyDrawer(),
    );
  }
}

class NewPage5 extends StatelessWidget {
  const NewPage5({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppbar(),
      body: Center(child: Text('Hello There5')),
      endDrawer: MyDrawer(),
    );
  }
}

class NewPage6 extends StatelessWidget {
  const NewPage6({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppbar(),
      body: Center(child: Text('Hello There6')),
      endDrawer: MyDrawer(),
    );
  }
}

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //title: Text(widget.title),
      title: const Text('Example App Flutter'),
      leading: IconButton(
        icon: const BackButtonIcon(),
        tooltip: 'Back Button',
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyHomePage()));
        },
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('MyHomePage'),
            selected: runtimeType.toString() == 'MyHomePage',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
              //Navigator.pop();
            },
          ),
          ListTile(
            title: const Text('NewPage1'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewPage1()));
            },
          ),
          ListTile(
            title: const Text('NewPage2'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewPage2()));
            },
          ),
          ListTile(
            title: const Text('NewPage3'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewPage3()));
            },
          ),
          ListTile(
            title: const Text('NewPage4'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewPage4()));
            },
          ),
          ListTile(
            title: const Text('NewPage5'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewPage5()));
            },
          ),
          ListTile(
            title: const Text('NewPage6'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewPage6()));
            },
          ),
        ],
      ),
    );
  }
}
