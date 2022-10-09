import 'package:flutter/material.dart';
import 'profile.dart';
import 'validation.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _submitted = false;
  String _fname = '';
  String _lname = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  bool _passwordHidden = true;

  void _submit() {
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      // print('valid input');
      // Navigator.of(context).pushReplacementNamed("/profile");
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Profile(fname: _fname, lname:_lname,email: _email, password: _password)));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: const Text(
        //   'Login',
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        // ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                  child: Text(
                    'Please enter your information below to create an account',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(
                      start: 30, end: 30, top: 10, bottom: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 75,
                          child: TextFormField(
                            // obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Enter your first name',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20),
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorStyle: const TextStyle(height: 0.4),
                            ),
                            autovalidateMode: _submitted
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            // The validator receives the text that the user has entered.
                            validator: (text) {
                              return valName(text.toString());
                            },
                            onChanged: (text) => setState(() => _fname = text),
                          ),
                        ),
                        SizedBox(
                          height: 75,
                          child: TextFormField(
                            // obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Enter your last name',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20),
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorStyle: const TextStyle(height: 0.4),
                            ),
                            autovalidateMode: _submitted
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            // The validator receives the text that the user has entered.
                            validator: (text) {
                              return valName(text.toString());
                            },
                            onChanged: (text) => setState(() => _lname = text),
                          ),
                        ),
                        SizedBox(
                          height: 75,
                          child: TextFormField(
                            // obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Enter your email',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20),
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorStyle: const TextStyle(height: 0.4),
                            ),
                            autovalidateMode: _submitted
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            // The validator receives the text that the user has entered.
                            validator: (text) {
                              return valEmail(text.toString());
                            },
                            onChanged: (text) => setState(() => _email = text),
                          ),
                        ),
                        SizedBox(
                          height: 75,
                          child: TextFormField(
                            obscureText: _passwordHidden,
                            decoration: InputDecoration(
                              labelText: 'Enter your password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordHidden
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  // color: Colors.deepPurple[800],
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordHidden = !_passwordHidden;
                                  });
                                },
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20),
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorStyle: const TextStyle(height: 0.4),
                            ),
                            autovalidateMode: _submitted
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            // The validator receives the text that the user has entered.
                            validator: (text) {
                              return valPass(text.toString());
                            },
                            onChanged: (text) =>
                                setState(() => _password = text),
                          ),
                        ),
                        SizedBox(
                          height: 75,
                          child: TextFormField(
                            obscureText: _passwordHidden,
                            decoration: InputDecoration(
                              labelText: 'Confirm your password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordHidden
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  // color: Colors.deepPurple[800],
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordHidden = !_passwordHidden;
                                  });
                                },
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20),
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorStyle: const TextStyle(height: 0.4),
                            ),
                            autovalidateMode: _submitted
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            // The validator receives the text that the user has entered.
                            validator: (text) {
                              return valConfirmPass(_password, text.toString());
                            },
                            onChanged: (text) =>
                                setState(() => _confirmPassword = text),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            minimumSize: const Size.fromHeight(50),
                            backgroundColor: Colors.deepPurple[800],
                          ),
                          onPressed: _fname.isNotEmpty &&
                                  _lname.isNotEmpty &&
                                  _email.isNotEmpty &&
                                  _password.isNotEmpty &&
                                  _confirmPassword.isNotEmpty
                              ? _submit
                              : null,
                          child: const Text(
                            'Register',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(fontSize: 16),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                                minimumSize:
                                    MaterialStateProperty.all(Size.zero),
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed("/");
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.deepPurple),
                              ),
                            ),
                          ],
                        ),
                      ],
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
