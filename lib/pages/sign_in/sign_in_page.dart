import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Instagram',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12.0),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Username'),
                      validator: (value) => value!.trim().isEmpty
                          ? 'Please enter a valid username.'
                          : null,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Email'),
                      validator: (value) => !value!.contains('@')
                          ? 'Please enter a valid email.'
                          : null,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Password'),
                      obscureText: true,
                      validator: (value) => value!.length < 6
                          ? 'Must be at least 6 characters.'
                          : null,
                    ),
                    const SizedBox(height: 28.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 1.0,
                        textStyle: TextStyle(
                          color: Colors.white,
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: const Text('Sign Up'),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 12.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 1.0,
                        onPrimary: Colors.grey[200],
                        textStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      child: const Text('Back to Login'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
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
