import 'package:flutter/material.dart';

void main() {
  runApp(BookApp());
}

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: BookHomePage(),
    );
  }
}

class BookHomePage extends StatefulWidget {
  @override
  _BookHomePageState createState() => _BookHomePageState();
}

class _BookHomePageState extends State<BookHomePage> {
  int _selectedIndex = 0;

  final List<String> bookCovers = [
    'https://github.com/DiegoRamirez7/act4-1091/blob/master/download.jpg?raw=true',
    'https://github.com/Rea2er/flutter-ebook-app-starter/blob/main/assets/images/book2.jpeg?raw=true',
    'https://github.com/Rea2er/flutter-ebook-app-starter/blob/main/assets/images/book3.jpeg?raw=true',
    'https://github.com/DiegoRamirez7/act4-1091/blob/master/descarga123.jpg?raw=true',
    'https://github.com/DiegoRamirez7/act4-1091/blob/master/descarga25.jpg?raw=true',
    'https://github.com/DiegoRamirez7/act4-1091/blob/master/26.jpg?raw=true',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Aquí puedes agregar la lógica para navegar a diferentes páginas según el índice seleccionado.
    // Por ejemplo:
    // if (index == 3) {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => GuardadoPage()));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Books'),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    // Acción para el botón EBook
                  },
                  child: Text("EBook"),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Audiolibros()),
                    );
                  },
                  child: Text("Audiobooks"),
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: bookCovers.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    bookCovers[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Libros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'Audio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Guardado',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class Audiolibros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Audiolibros'),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'HISTORY',
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Always forgive your enemies,\nnothing annoyes.',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Published from ',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'istudio',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Spacer(),
                Text(
                  'Mar 23, 2019',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 16),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://github.com/DiegoRamirez7/act4-1091/blob/master/26.jpg?raw=true',
                  ),
                ),
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.play_arrow, color: Colors.white, size: 18),
                        SizedBox(width: 6),
                        Text(
                          'Audio Book',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  '4.7',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.star, color: Colors.orange, size: 20),
                Icon(Icons.star, color: Colors.orange, size: 20),
                Icon(Icons.star, color: Colors.orange, size: 20),
                Icon(Icons.star, color: Colors.orange, size: 20),
                Icon(Icons.star_half, color: Colors.orange, size: 20),
                SizedBox(width: 8),
                Text('892 Ratings on Google Play'),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'I failed the first quarter of a class in school, so I made a fake report card. I did this every quarter that year. I forgot that they mail home the end-year cards, and my mom got it before I could intercept ... Read more',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
