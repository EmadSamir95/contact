import 'package:flutter/material.dart';
import 'package:gdgbloc/bloc.dart';

bool valid = false;

// keys for testing fields and button
final GlobalKey<FormState> emailkey = new GlobalKey<FormState>();
final GlobalKey<FormState> namekey = new GlobalKey<FormState>();
final GlobalKey<FormState> feedbackkey = new GlobalKey<FormState>();
final GlobalKey<FormState> button = new GlobalKey<FormState>();


//controllers for retrieve data from text fields
final TextEditingController name = new TextEditingController();
final TextEditingController email = new TextEditingController();
final TextEditingController feedback = new TextEditingController();




// function for putting data to database
bool database() {

  String Email = email.text;
  String Name = name.text;
  String Feedback = feedback.text;

  if(Email.contains("@") && Name.length>4 && Feedback.length>4) {

    valid= true;

    print(Email);
    print(Name);
    print(Feedback);

    // Add database query here

  }

  else{

  }

    print(valid);
    return valid;


} // end database function






void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}



class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();


    return Scaffold(
      appBar: AppBar(
        title: Text("Contact us"),

        backgroundColor:Colors.greenAccent,
      ),

      body: SingleChildScrollView(
        child: Container(

          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                padding: EdgeInsets.all(30.0),
                child: Center(
                  child: Icon(
                    Icons.chat,
                    color: Colors.teal,
                    size: 50.0,
                  ),
                ),
              ),


              //email text field
              StreamBuilder<String>(
                stream: bloc.email,
                builder: (context, snapshot) => TextField(
                      onChanged: bloc.emailChanged,
                      controller: email,
                      key: emailkey,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter email",
                          labelText: "Email",
                          errorText: snapshot.error),
                    ),
              ),


              SizedBox(
                height: 20.0,
              ),


              //name text field
              StreamBuilder<String>(
                stream: bloc.name,
                builder: (context, snapshot) => TextField(
                      onChanged: bloc.nameChanged,
                      controller: name,
                      key: namekey,
                      keyboardType: TextInputType.text,
                      //obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter name",
                          labelText: "Name",
                          errorText: snapshot.error),
                    ),
              ),


              SizedBox(
                height: 20.0,
              ),


              //feedback text field
              StreamBuilder<String>(
                stream: bloc.feedback,
                builder: (context, snapshot) => TextField(
                  onChanged: bloc.feedbackChanged,
                  controller: feedback,
                  key: feedbackkey,
                  maxLines: 3,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter feedback",
                      labelText: "Feedback",
                      errorText: snapshot.error),
                ),
              ),


              SizedBox(
                height: 20.0,
              ),


              //button for send feedback
              StreamBuilder<bool>(
                stream: bloc.submitCheck,
                builder: (context, snapshot) => RaisedButton(
                      color: Colors.tealAccent,
                      key: button ,
                  onPressed: ()
                  {
                    // call database function on pressing the button
                        database();

                  },

                  child:
                      Text("Send feedback"),
                    ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
