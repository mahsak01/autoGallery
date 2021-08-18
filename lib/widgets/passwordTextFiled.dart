import 'package:autogallery/models/ProviderChange.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
class PasswordTextFiled extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            height: 60,
            child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    obscureText:  context.watch<ProviderChange>().passwordInSignIn,
                    autofocus: false,

                    decoration: InputDecoration(
                        border: OutlineInputBorder( //Outline border type for TextFeild
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color:Theme.of(context).primaryColor,
                              width: 2,
                            )
                        ),
                        enabledBorder: OutlineInputBorder( //Outline border type for TextFeild
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color:Theme.of(context).primaryColor,
                              width:2,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color:Theme.of(context).accentColor,
                              width: 2,
                            )
                        ),
                        labelText: 'رمز عبور',
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(
                              context.watch<ProviderChange>().passwordInSignIn
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color:  context.watch<ProviderChange>().passwordInSignIn
                                  ? Theme.of(context).accentColor:Theme.of(context).primaryColor,
                              size: 30,
                            ),
                            onPressed: () {
                              context.read<ProviderChange>().setPasswordInSignIn();
                            }),
                        labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 25,
                            fontFamily: 'persion')),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
