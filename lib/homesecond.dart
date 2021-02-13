import 'package:flutter/material.dart';
import 'package:flutter_rest_api/User.dart';
import 'package:http/http.dart' as http;
class HomeSecond extends StatefulWidget {
  @override
  _HomeSecondState createState() => _HomeSecondState();
}

class _HomeSecondState extends State<HomeSecond> {
  String baseurl = 'https://reqres.in/api/users/2';
  Data _user;
  Support _support;
  bool loading = true;
  fetchuser()async{
    var reponse = await http.get(baseurl);
    if(reponse.statusCode == 200){

      var user = reponse.body;
      var jasondata = userFromJson(user);
      _user = jasondata.data;
      _support =jasondata.support;
      loading = false;
      setState(() {

      });
    }else{
      loading = true;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Rest Api'),
      ),
      body: Stack(
        children: [
          loading==false?
          ListTile(
            title: Text(_user.firstName+" "+_user.lastName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_user.email),
                Row(
                  children: [
                    SizedBox(width: 40,child: Divider(thickness: 2,)),
                    SizedBox(width: 40,child: Text('Hello')),
                    SizedBox(width: 40,child: Divider(thickness: 2,)),
                  ],
                ),
                Text(_support.text),
              ],
            ),
            trailing: Image.network(_user.avatar),
            // leading: Text(_support.text),
          ):
              CircularProgressIndicator(),
        ],
      ),

    );
  }
}
