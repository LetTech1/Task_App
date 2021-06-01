import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:todomobx/screens/list_screen/list_screen.dart';
import 'package:todomobx/screens/login_screen/widgets/login_button.dart';
import 'package:todomobx/stores/login_store.dart';
import 'package:todomobx/widgets/custom_text_field.dart';
import 'package:todomobx/widgets/custom_icon_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore loginStore = LoginStore();

  ReactionDisposer? disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction(
      (_) => loginStore.loggedIn,
      (loggedIn) {
        if (loggedIn != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => ListScreen(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 16,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Observer(
                    builder: (_) {
                      return CustomTextField(
                        hint: 'Email',
                        prefix: Icon(Icons.account_circle),
                        textInputType: TextInputType.emailAddress,
                        onChanged: loginStore.setEmail,
                        enabled: !loginStore.loading,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Observer(
                    builder: (_) {
                      return CustomTextField(
                        hint: 'Senha',
                        prefix: Icon(Icons.lock),
                        obscure: !loginStore.passwordVisible,
                        onChanged: loginStore.setPassword,
                        enabled: !loginStore.loading,
                        suffix: CustomIconButton(
                          radius: 32,
                          iconData: loginStore.passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          onTap: loginStore.togglePasswordVisibility,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 44,
                    child: Observer(
                      builder: (_) {
                        return LoginButton(
                          onPressed: () {}, //loginStore.loginPressed!(),
                          name: loginStore.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text('Login'),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    disposer!();
    super.dispose();
  }
}
