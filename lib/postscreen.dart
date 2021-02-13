import 'package:flutter/material.dart';
import 'package:flutter_rest_api/CreateUser.dart';
import 'package:http/http.dart' as http;

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController jobcontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var UserName;
  var UserJob;
  var UserId;
  var UserCreated;

  savebtn()async{
    if(formkey.currentState.validate()){

      String baseUrl = 'https://reqres.in/api/users';

      var body= {
        'name':namecontroller.text,
        'job':jobcontroller.text,
      };
      var response = await http.post(baseUrl,
          body: body);
      if(response.statusCode == 201){
        var userbody = response.body;
        var usercreate = createUserFromJson(userbody);
        UserName = usercreate.name;
        UserJob = usercreate.job;
        UserId = usercreate.id;
        UserCreated = usercreate.createdAt.toString();

        setState(() {

        });

      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Rest Api'),
      ),
      bottomNavigationBar: Container(
        child: MaterialButton(
          minWidth: 50,
          onPressed: (){
            savebtn();
          },
          child: Text('Save'),
          color: Colors.orange,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: namecontroller,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder()
                ),
              ),
              TextFormField(
                controller: jobcontroller,
                decoration: InputDecoration(
                    hintText: 'job',
                    border: OutlineInputBorder()
                ),
              ),
              Text(UserName==null?"":UserName),
               Text(UserJob==null?"":UserJob),
               Text(UserId==null?"":UserId),
               Text(UserCreated==null?"":UserCreated),

            ],
          ),
        ),
      ),
    );
  }
}
