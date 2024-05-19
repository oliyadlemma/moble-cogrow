import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttersatrtup/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:fluttersatrtup/pages/loginpage.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String firstName = 'First Name';
  String lastName = 'Last Name';
  String email = 'email@example.com';
  String password = 'password';

  void _editField(
      String title, String currentValue, ValueChanged<String> onSave) {
    final TextEditingController _controller = TextEditingController();
    _controller.text = currentValue;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $title'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Enter your $title',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onSave(_controller.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteAccount() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text(
              'Are you sure you want to delete your account? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add your delete account logic here
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Settings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                margin: const EdgeInsets.only(left: 15, right: 15, top: 25),
                child: Column(
                  children: <Widget>[
                    // Dark mode toggle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Dark mode',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Consumer<ThemeProvider>(
                          builder: (context, themeProvider, child) {
                            return CupertinoSwitch(
                              value: themeProvider.isDarkMode,
                              onChanged: (value) {
                                themeProvider.toggleTheme();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('FirstName'),
              subtitle: Text(firstName),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  _editField('First Name', firstName, (newValue) {
                    setState(() {
                      firstName = newValue;
                    });
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('LastName'),
              subtitle: Text(lastName),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  _editField('Last Name', lastName, (newValue) {
                    setState(() {
                      lastName = newValue;
                    });
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Email'),
              subtitle: Text(email),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  _editField('Email', email, (newValue) {
                    setState(() {
                      email = newValue;
                    });
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Password'),
              subtitle: const Text('********'),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  _editField('Password', password, (newValue) {
                    setState(() {
                      password = newValue;
                    });
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            // Logout button
            GestureDetector(
              onTap: () {
                // Navigate to login page and pop all other screens
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Loginpage(
                      onTap: () {},
                    ),
                  ),
                  (route) => false,
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.all(30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.black,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Delete account button
            TextButton(
              onPressed: _deleteAccount,
              child: const Text(
                'Delete Account',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
