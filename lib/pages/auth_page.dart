import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:solotec/stores/auth_store.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  /* @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setState(() {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff612B02),
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Color(0xff612B02),
        statusBarIconBrightness: Brightness.light,
      ));
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xff612B02),
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: Color(0xff612B02),
          statusBarIconBrightness: Brightness.light,
        ));
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xff612B02),
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: Color(0xff612B02),
          statusBarBrightness: Brightness.light,
        ),
        child: Consumer<AuthStore>(
          builder: (_, store, __) {
            return Scaffold(
              key: store.scaffold,
              backgroundColor: Color(0xff612B02),
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Color(0xff612B02),
                title: Observer(
                  builder: (_) {
                    return Text(
                      (store.login ? 'Acesse sua conta' : 'Cadastre-se'),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    );
                  },
                ),
                centerTitle: true,
              ),
              body: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: store.form,
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      children: [
                        InputText(
                          controller: store.email,
                          description: 'Digite seu email',
                          icon: Icons.mail,
                          obscure: false,
                          title: 'Email',
                          type: TextInputType.emailAddress,
                          validator: (value) {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern);

                            if (value == null || value.isEmpty) {
                              return 'Preencha esse campo';
                            } else if (!regex.hasMatch(value)) {
                              return 'Insira um e-mail válido';
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InputText(
                          controller: store.password,
                          description: 'Digite sua senha',
                          icon: Icons.lock,
                          obscure: true,
                          title: 'Senha',
                          type: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Preencha esse campo';
                            } else if (value.length < 8 || value.length > 15) {
                              return 'Insira uma senha com 08 a 15 caracteres';
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Observer(
                            builder: (_) {
                              return Text(
                                store.erro,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: (store.erro != "null"
                                        ? Color(0xFFFF0000)
                                        : Color(0x00FF0000))),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Consumer<AuthStore>(
                            builder: (context, storeSplash, __) {
                          return Observer(
                            builder: (_) {
                              return Button(
                                background: Color(0xffffffff),
                                title: (store.login ? "ENTRE" : "CADASTRAR"),
                                titleColor: Color(0xff612B02),
                                onTap: () async {
                                  if (store.form.currentState.validate()) {
                                    if (store.login) {
                                      store.form.currentState.save();
                                      store
                                          .signInEmail(store.email.text,
                                              store.password.text)
                                          .then((value) {
                                        if (value) {
                                          storeSplash.autenticated = true;
                                        }
                                      });
                                    } else if (!store.login) {
                                      store.form.currentState.save();
                                      store
                                          .registerEmail(store.email.text,
                                              store.password.text)
                                          .then((value) {
                                        if (value) {
                                          storeSplash.autenticated = true;
                                        }
                                      });
                                    }
                                  }
                                },
                              );
                            },
                          );
                        }),
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          onPressed: () {
                            store.login = !store.login;
                          },
                          child: Observer(builder: (_) {
                            return Text.rich(TextSpan(
                                text: (store.login
                                    ? 'Não possui conta? '
                                    : 'Já possui conta?'),
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xffffffff)),
                                children: [
                                  TextSpan(
                                      text: (store.login
                                          ? 'Crie uma!'
                                          : 'Entre!'),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.white,
                                      ))
                                ]));
                          }),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            '- OU -',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffffffff)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Consumer<AuthStore>(
                            builder: (context, storeSplash, __) {
                          return Button(
                            background: Color(0xffffffff),
                            title: 'Continue com Google',
                            titleColor: Color(0xff1976D2),
                            imageAsset: 'assets/icons/google.png',
                            onTap: () {
                              store.sigInGoogle().then((value) {
                                if (value) {
                                  storeSplash.autenticated = true;
                                }
                              });
                            },
                          );
                        }),
                        /* SizedBox(
                          height: 15,
                        ),
                        Consumer<AuthStore>(
                            builder: (context, splashStore, __) {
                          return Button(
                            background: Color(0xff000000),
                            icon: Icons.cloud_off,
                            title: 'Continue sem logar',
                            titleColor: Color(0xffffffff),
                            onTap: () {
                              store.signAnonimous().then((value) {
                                if (value) {
                                  splashStore.autenticated = true;
                                }
                              });
                            },
                          );
                        }),*/
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class InputText extends StatelessWidget {
  final String title;
  final String description;
  final TextEditingController controller;
  final TextInputType type;
  final bool obscure;
  final IconData icon;
  final Function(String) validator;

  InputText({
    this.title,
    this.description,
    this.controller,
    this.type,
    this.obscure,
    this.icon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Color(0x3f000000),
                blurRadius: 8,
                offset: Offset(0, 8),
              ),
            ],
            color: Color(0x008a5534),
          ),
          child: TextFormField(
            cursorColor: Color(0xffffffff),
            style: TextStyle(color: Color(0xffffffff)),
            controller: this.controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xff8a5534),
              hintText: this.description,
              hintStyle: TextStyle(
                color: Color(0x4cffffff),
                fontSize: 16,
              ),
              prefixIcon: Icon(
                this.icon,
                color: Color(0x4cffffff),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide.none),
            ),
            keyboardType: this.type ?? TextInputType.text,
            obscureText: this.obscure ?? false,
            validator: this.validator,
          ),
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  final Color background;
  final IconData icon;
  final Color iconColor;
  final String title;
  final Color titleColor;
  final String imageAsset;
  final Function() onTap;

  Button({
    this.background,
    this.icon,
    this.iconColor,
    this.title,
    this.titleColor,
    this.imageAsset,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(this.background),
          overlayColor: MaterialStateProperty.all<Color>(Color(0x33612b02)),
          elevation: MaterialStateProperty.all<double>(8),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
        ),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (this.icon != null
                  ? Icon(this.icon, color: this.iconColor)
                  : Container()),
              (this.imageAsset != null
                  ? Image.asset(this.imageAsset, height: 24)
                  : Container()),
              (this.icon != null || this.imageAsset != null
                  ? SizedBox(width: 17)
                  : SizedBox(width: 0)),
              Text(
                this.title,
                style: TextStyle(
                  color: this.titleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
