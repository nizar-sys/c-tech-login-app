import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  HomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                      'https://i.imgur.com/TyCSG9A.png',
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              username.isEmpty
                  ? 'No username'
                  : 'Hello $username, welcome to C-Tech',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            RaisedButton(
              child: Text('Logout'),
              onPressed: () {
                // show alert
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text('Yes'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.pushReplacementNamed(context, 'login');
                          },
                        ),
                        FlatButton(
                          child: const Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
