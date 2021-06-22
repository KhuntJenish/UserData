import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Drawer(
        elevation: 5,
        child: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // DrawerHeader(
              //   child: Text(
              //     "hi drawer.",
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   decoration: BoxDecoration(
              //       color: Colors.purple,
              //       borderRadius: BorderRadius.circular(10)),
              // )
              UserAccountsDrawerHeader(
                accountName: Text("Khunt jenish"),
                accountEmail: Text("jeishkhunt@gamil.com"),
                currentAccountPicture: CircleAvatar(
                  child: Text('A'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Card(
                      color: Colors.grey[400],
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Account"),
                        subtitle: Text("Personal"),
                        trailing: Icon(Icons.edit),
                      ),
                    ),
                    Card(
                      color: Colors.grey[400],
                      child: ListTile(
                          leading: Icon(Icons.email),
                          title: Text("Email"),
                          subtitle: Text("joflee@info.com"),
                          trailing: Icon(Icons.send)),
                    ),
                    Card(
                      color: Colors.grey[400],
                      child: ListTile(
                        leading: Icon(Icons.access_time),
                        title: Text("Office Time"),
                        subtitle: Text("9:00am to 6:00pm"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
