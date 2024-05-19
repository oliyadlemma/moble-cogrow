import 'package:flutter/material.dart';
import 'package:fluttersatrtup/components/drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  static const List<String> _menuOptions = ['All', 'Latest', 'For You'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('All Projects')),
        backgroundColor: const Color.fromARGB(255, 116, 112, 112),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Selected Menu: ${_menuOptions[_selectedIndex]}'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Latest',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'For You',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 129, 125, 125),
        onTap: _onItemTapped,
      ),
    );
  }
}



/*import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  static const List<String> _menuOptions = ['All', 'Latest', 'For You'];
  List<dynamic> _startupList = []; // List to store fetched startup data

  // Function to fetch startup data from the backend based on the selected option
  Future<void> fetchStartupData(String option) async {
    String apiUrl = 'YOUR_API_URL_HERE';
    switch (option) {
      case 'All':
        apiUrl += '/all';
        break;
      case 'Latest':
        apiUrl += '/latest';
        break;
      case 'For You':
        apiUrl += '/foryou';
        break;
      default:
        break;
    }

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      setState(() {
        _startupList = json.decode(response.body);
      });
    } else {
      print('Failed to fetch startup data: ${response.statusCode}');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      fetchStartupData(_menuOptions[index]); // Fetch startup data based on selected option
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('All Projects')),
        backgroundColor: const Color.fromARGB(255, 116, 112, 112),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _startupList.length,
          itemBuilder: (context, index) {
            // Display fetched startup data here
            return ListTile(
              title: Text(_startupList[index]['name']),
              subtitle: Text(_startupList[index]['description']),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Latest',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'For You',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 129, 125, 125),
        onTap: _onItemTapped,
      ),
    );
  }
}
 */