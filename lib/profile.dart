import 'package:flutter/material.dart';
import 'validation.dart';

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
  final _formKey = GlobalKey<FormState>();
  bool _submitted = false;
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _lname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isEditable = false;
  bool _passwordHidden = true;

  bool _submit() {
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      print('valid input');
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    _fname.text = widget.fname;
    _lname.text = widget.lname;
    _email.text = widget.email;
    _password.text = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
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
                  if (_submit()) {
                    setState(
                      () {
                        _isEditable = !_isEditable;
                        _passwordHidden = true;
                      },
                    );
                  }
                },
                child: Icon(
                  _isEditable ? Icons.check : Icons.edit,
                  color: _isEditable ? Colors.deepPurple : Colors.black,
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
                        '${_fname.text} ${_lname.text}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(
                          start: 30, end: 30, top: 10, bottom: 20),
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        enabled: _isEditable,
                        controller: _fname,
                        decoration: const InputDecoration(
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                          labelText: 'First Name',
                        ),
                        autovalidateMode: _submitted
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        validator: (text) {
                          return valName(text.toString());
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(
                          start: 30, end: 30, top: 10, bottom: 20),
                      child: TextFormField(
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        enabled: _isEditable,
                        controller: _lname,
                        decoration: const InputDecoration(
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                          labelText: 'Last Name',
                        ),
                        autovalidateMode: _submitted
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        validator: (text) {
                          return valName(text.toString());
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(
                          start: 30, end: 30, top: 10, bottom: 20),
                      child: TextFormField(
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        enabled: _isEditable,
                        controller: _email,
                        decoration: const InputDecoration(
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                          labelText: 'Email',
                        ),
                        autovalidateMode: _submitted
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        validator: (text) {
                          return valEmail(text.toString());
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(
                          start: 30, end: 30, top: 10, bottom: 20),
                      child: TextFormField(
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        enabled: _isEditable,
                        obscureText: _passwordHidden,
                        controller: _password,
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
                              // Based on _passwordHidden state choose the icon
                              _passwordHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of _passwordHidden variable
                              setState(
                                () {
                                  _passwordHidden = !_passwordHidden;
                                },
                              );
                            },
                          ),
                        ),
                        autovalidateMode: _submitted
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        validator: (text) {
                          return valPass(text.toString());
                        },
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
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
