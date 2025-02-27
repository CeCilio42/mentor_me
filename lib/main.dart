import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chat_screen.dart';
import 'filter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mentor Me',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6E36CD)),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool _isExpanded = false;
  bool _isFilter = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6E36CD),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: Text(
                  'Find New',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              const Text(
                'Mentors',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = true;
                  });
                },
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: const TextStyle(color: Colors.white),
                    prefixIcon: GestureDetector( 
                      onTap: () {
                        setState(() {
                          _isExpanded = true;
                          _isFilter = true;
                        });
                      },
                      child: const Icon(Icons.search, color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xFF9380B3),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Recommended',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return buildMentorCard(index);
                  },
                ),
              ),
              const SizedBox(height: 20),
              buildCategorySection(
                  'School subjects', ['Professor Alex', 'Master Tobias', 'Lars Hendriks', 'Coach Samuel', 'Ms. Margaret', 'Liam Bennett']),
              buildCategorySection('Sports', ['Sophia Mitchell', 'Nina Torres', 'Laura Bezemt', 'Peter Van Zuid', 'Pieter van Post', 'Martijn Krabbel' ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
            _isFilter = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _isExpanded ? MediaQuery.of(context).size.height * 0.75 : 80.0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BottomAppBar(
              color: Colors.white,
              child: _isExpanded
                ? _isFilter
                  ? const FilterScreen()
                  : const ChatScreen()
                  : Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isExpanded = true;
                              _isFilter = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            textStyle: const TextStyle(fontSize: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text(''),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

    Widget buildMentorCard(int index) { 
    int rating = 1;
    List<String> profilePictures = [
      'assets/profile1.jpg',
      'assets/profile2.jpeg',
      'assets/profile3.jpg',
      'assets/profile4.jpg',
      'assets/profile5.jpg',
      'assets/profile6.jpeg',
    ];

    List<String> mentorNames = [
      'Dr. James Wilson',
      'Sarah Thompson',
      'Michael Chen',
      'Emma Rodriguez',
      'David Parker',
      'Lisa Anderson'
    ];

    List<String> expertises = ['Math', 'Chess', 'History', 'English'];
    String randomExpertise = expertises[index % expertises.length];

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return SizedBox(
          width: 150,
          height: 150,
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mentorNames[index % mentorNames.length],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(randomExpertise),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          profilePictures[index % profilePictures.length],
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(6, (idx) {
                          return IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              setState(() => rating = idx + 1);
                            },
                            icon: Stack(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color(0xFF6E36CD),
                                ),
                                Icon(
                                  Icons.star_border,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          );
                        }).sublist(0, rating),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildCategorySection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return buildCategoryItem(items[index], index);
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

    Widget buildCategoryItem(String item, int index) { 
    List<String> profilePictures = [

      'assets/profile4.jpg',
      'assets/profile5.jpg',
      'assets/profile1.jpg',
      'assets/profile2.jpeg',
      'assets/profile6.jpeg',
      'assets/profile3.jpg',

    ];

    List<String> expertises = ['Math', 'Chess', 'History', 'English'];
    String randomExpertise = expertises[index % expertises.length];

    return SizedBox(
      width: 150,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(randomExpertise),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    profilePictures[index % profilePictures.length], 
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}