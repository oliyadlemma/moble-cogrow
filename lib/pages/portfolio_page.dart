/*import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  List<String> portfolioData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('YOUR_API_URL/portfolio'));
    if (response.statusCode == 200) {
      setState(() {
        portfolioData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load portfolio data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portfolio'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          InvestedPage(portfolioData),
          InterestedPage(portfolioData),
          ShortlistPage(portfolioData),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Invested',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Interested',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Shortlist',
          ),
        ],
      ),
    );
  }
}

class InvestedPage extends StatelessWidget {
  final List<String> portfolioData;

  InvestedPage(this.portfolioData);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(portfolioData.isNotEmpty ? portfolioData[0] : 'Loading...'),
    );
  }
}

class InterestedPage extends StatelessWidget {
  final List<String> portfolioData;

  InterestedPage(this.portfolioData);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(portfolioData.isNotEmpty ? portfolioData[1] : 'Loading...'),
    );
  }
}

class ShortlistPage extends StatelessWidget {
  final List<String> portfolioData;

  ShortlistPage(this.portfolioData);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(portfolioData.isNotEmpty ? portfolioData[2] : 'Loading...'),
    );
  }
}
*/
import 'package:flutter/material.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text(
        'Interested',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    ),
    Center(
      child: Text(
        'Invested',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    ),
    Center(
      child: Text(
        'Shortlist',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        centerTitle: true,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Interested',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Invested',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Shortlist',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
