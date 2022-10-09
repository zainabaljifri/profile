import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String fname, lname, email, password;
  const Profile(
      {Key? key,
      required this.fname,
      required this.lname,
      required this.email,
      required this.password})
      : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _fname = '', _lname = '', _email = '', _password = '';
  bool _isEditable = false;
  bool _passwordHidden = true;

  @override
  void initState() {
    super.initState();
    _fname = widget.fname;
    _lname = widget.lname;
    _email = widget.email;
    _password = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:
            // const Center(
            //   child:
            const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
        ),
        // ),
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isEditable = !_isEditable;
                });
                // Navigator.of(context).pushReplacementNamed("/");
              },
              child: const Icon(
                Icons.edit,
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        NetworkImage('https://i.gifer.com/NiT5.gif'),
                    backgroundColor: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      '$_fname $_lname',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 30),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(
                        start: 30, end: 30, top: 10, bottom: 20),
                    child: TextField(
                      style: const TextStyle(fontWeight: FontWeight.w600),
                      enabled: _isEditable,
                      controller: TextEditingController(text: _fname),
                      decoration: const InputDecoration(
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        labelText: 'First Name',
                        // hintText: 'Enter Password',
                      ),
                      onChanged: (text) => setState(() => _fname = text),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(
                        start: 30, end: 30, top: 10, bottom: 20),
                    child: TextField(
                      style: const TextStyle(fontWeight: FontWeight.w600),
                      enabled: _isEditable,
                      controller: TextEditingController(text: _lname),
                      decoration: const InputDecoration(
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        labelText: 'Last Name',
                        // hintText: 'Enter Password',
                      ),
                      onChanged: (text) => setState(() => _lname = text),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(
                        start: 30, end: 30, top: 10, bottom: 20),
                    child: TextField(
                      style: const TextStyle(fontWeight: FontWeight.w600),
                      enabled: _isEditable,
                      controller: TextEditingController(text: _email),
                      decoration: const InputDecoration(
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        labelText: 'Email',
                        // hintText: 'Enter Password',
                      ),
                      onChanged: (text) => setState(() => _email = text),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(
                        start: 30, end: 30, top: 10, bottom: 20),
                    child: TextField(
                      style: const TextStyle(fontWeight: FontWeight.w600),
                      enabled: _isEditable,
                      obscureText: _passwordHidden,
                      controller: TextEditingController(text: _password),
                      decoration: InputDecoration(
                        disabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
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
                      onChanged: (text) => setState(() => _password = text),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed("/");
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
