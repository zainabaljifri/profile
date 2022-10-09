import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String? fname,lname,email,password;
  const Profile({Key? key,required this.fname,required this.lname,required this.email,required this.password}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _passwordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:
            // const Center(
            //   child:
            const Padding(
              padding: EdgeInsets.only(left: 30.0,top: 10),
              child: Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
            ),
        // ),
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 30.0,top: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/");
              },
              child: const Icon(
                Icons.logout,
              ),
            ),
          ),
        ],
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/e5/f8/82/e5f882d97e4344fa200569f3ab997a23.gif'),
                  backgroundColor: Colors.transparent,
                ),
                 Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    '${widget.fname} ${widget.lname}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(
                      start: 30, end: 30, top: 10, bottom: 20),
                  child: TextField(
                    style: const TextStyle( fontWeight: FontWeight.bold),
                    enabled: false,
                    controller: TextEditingController(text: "${widget.fname}"),
                    decoration: const InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'First Name',
                      // hintText: 'Enter Password',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(
                      start: 30, end: 30, top: 10, bottom: 20),
                  child: TextField(
                    style: const TextStyle( fontWeight: FontWeight.bold),
                    enabled: false,
                    controller: TextEditingController(text: "${widget.lname}"),
                    decoration: const InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Last Name',
                      // hintText: 'Enter Password',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(
                      start: 30, end: 30, top: 10, bottom: 20),
                  child: TextField(
                    style: const TextStyle( fontWeight: FontWeight.bold),
                    enabled: false,
                    controller: TextEditingController(text: "${widget.email}"),
                    decoration: const InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Email',
                      // hintText: 'Enter Password',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(
                      start: 30, end: 30, top: 10, bottom: 20),
                  child: TextField(
                    style: const TextStyle( fontWeight: FontWeight.bold),
                    enabled: false,
                    obscureText: _passwordHidden,
                    controller: TextEditingController(text: "${widget.password}"),
                    decoration: InputDecoration(
                      disabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordHidden
                              ? Icons.visibility
                              : Icons.visibility_off,
                          // color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordHidden = !_passwordHidden;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
