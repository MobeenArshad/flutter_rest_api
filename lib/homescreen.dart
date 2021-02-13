import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api/Users.dart';
import 'package:http/http.dart' as http;

import 'homesecond.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String url = 'https://reqres.in/api/users?page=2';
  List<Datum> _users = [];
  int _totalpages;



  fetchusers()async{
    var response = await http.get(url);
    if(response.statusCode == 200){

      var users = response.body;
      var jasondata = usersFromJson(users);
      _users = jasondata.data;
      _totalpages = jasondata.total;
      setState(() {

      });
    }
  }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchusers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Get Rest API::'+_totalpages.toString()),
      ),
      body: Column(
        children: [
          Container(
             height: MediaQuery.of(context).size.height/2,
            padding: EdgeInsets.all(20),
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: _users.length,
              separatorBuilder: (context, int index){
                return Divider(thickness: 2,);
              },
              itemBuilder: (context, int index){
                return ListTile(
                  title: Text(_users[index].firstName),
                  leading: ClipOval(child: Image.network(_users[index].avatar)),
                  subtitle: Text(_users[index].email),
                   trailing: Text(_users[index].id.toString()),
                );
              },

            ),
          ),
          Container(
            child: RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>HomeSecond()));
            },
              child: Text('HomeSecond'),
            ),
          ),
        ],
      ),
    );
  }
}
