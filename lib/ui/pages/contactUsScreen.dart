import 'package:eco_commerce_app/ui/widgets/gradientResponsiveContainer.dart';
import 'package:eco_commerce_app/ui/widgets/headerText.dart';
import 'package:eco_commerce_app/ui/widgets/submitButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:eco_commerce_app/ui/theme/config.dart' as config;
import 'package:eco_commerce_app/core/auth/mail.dart' as mail;
import 'package:eco_commerce_app/main.dart' as main;
import 'package:eco_commerce_app/ui/widgets/toasts.dart' as toasts;

class ContactUsScreen extends StatefulWidget {
  ContactUsScreen({Key key}) : super(key: key);

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  bool isLoading;
  bool isMessageValid;
  List<bool> validators = [false];
  double value = 0;
  final FocusNode _msgFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Map<String, dynamic> res;
  final GlobalKey<ScaffoldState> scaffoldContactKey =
      GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController msgController = TextEditingController();
  @override
  void initState() {
    super.initState();
    isLoading = false;
    isMessageValid = false;
    emailController.text = main.prefs.getString("email");
    nameController.text = main.prefs.getString("username");
    phoneController.text = main.prefs.getString("phone");
  }

  Widget _buildyourName() {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 15.6, 40, 15.6),
      child: TextFormField(
        style: Theme.of(context).textTheme.headline6.copyWith(
              color: Colors.white,
            ),
        enabled: false,
        controller: nameController,
        focusNode: _nameFocus,
        textInputAction: TextInputAction.next,
        cursorColor: Color(0xFFFFFFFF),
        cursorRadius: Radius.circular(8),
        cursorWidth: 4,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 1),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: Color(0xFFFF0000), width: 1),
          ),
          errorText: null,
          hintText: "Name",
          hintStyle: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.white,
              ),
          labelText: "Name",
          labelStyle: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(
              LineAwesomeIcons.user,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
        expands: false,
        inputFormatters: [BlacklistingTextInputFormatter.singleLineFormatter],
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
      ),
    );
  }

  Widget _buildyourEmail() {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 15.6, 40, 15.6),
      child: TextFormField(
        style: Theme.of(context).textTheme.headline6.copyWith(
              color: Colors.white,
            ),
        enabled: false,
        controller: emailController,
        focusNode: _emailFocus,
        textInputAction: TextInputAction.next,
        cursorColor: Color(0xFFFFFFFF),
        cursorRadius: Radius.circular(8),
        cursorWidth: 4,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 1),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: Color(0xFFFF0000), width: 1),
          ),
          errorText: null,
          hintText: "Email Address",
          hintStyle: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.white,
              ),
          labelText: "Email Address",
          labelStyle: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(
              LineAwesomeIcons.at,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
        expands: false,
        inputFormatters: [BlacklistingTextInputFormatter.singleLineFormatter],
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _buildyourPhone() {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 15.6, 40, 15.6),
      child: TextFormField(
        style: Theme.of(context).textTheme.headline6.copyWith(
              color: Colors.white,
            ),
        enabled: false,
        controller: phoneController,
        focusNode: _phoneFocus,
        textInputAction: TextInputAction.done,
        cursorColor: Color(0xFFFFFFFF),
        cursorRadius: Radius.circular(8),
        cursorWidth: 4,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 1),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: Color(0xFFFF0000), width: 1),
          ),
          errorText: null,
          hintText: "Phone Number",
          hintStyle: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.white,
              ),
          labelText: "Phone Number",
          labelStyle: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(
              LineAwesomeIcons.phone,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
        expands: false,
        inputFormatters: [BlacklistingTextInputFormatter.singleLineFormatter],
        keyboardType: TextInputType.phone,
        textCapitalization: TextCapitalization.words,
      ),
    );
  }

  Widget _buildyourMsg() {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 15.6, 40, 15.6),
      child: TextFormField(
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.white,
              ),
          minLines: 3,
          maxLines: 12,
          enabled: !isLoading,
          onChanged: (tex) {
            if (tex.length > 49) {
              setState(() {
                isMessageValid = true;
              });
            } else {
              setState(() {
                isMessageValid = false;
              });
            }
          },
          controller: msgController,
          focusNode: _msgFocus,
          onFieldSubmitted: (term) {
            _msgFocus.unfocus();
          },
          textInputAction: TextInputAction.next,
          cursorColor: Color(0xFFFFFFFF),
          cursorRadius: Radius.circular(8),
          cursorWidth: 4,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 1),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Color(0xFFFF0000), width: 1),
            ),
            errorText: null,
            hintText: "Your Message",
            hintStyle: Theme.of(context).textTheme.headline6.copyWith(
                  color: Colors.white,
                ),
            labelText: "Your Message",
            labelStyle: TextStyle(
              color: Color(0xFFFFFFFF),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Icon(
                LineAwesomeIcons.user,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
          expands: false,
          inputFormatters: [BlacklistingTextInputFormatter.singleLineFormatter],
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GradientResponsiveContainer(
          scaffoldLoginKey: scaffoldContactKey,
          fab: true,
          gradient: config.Colors().deepSpace,
          height: height,
          widgets: [
            HeaderText(text: "Contact"),
            SizedBox(height: 20),
            Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildyourName(),
                  _buildyourEmail(),
                  _buildyourPhone(),
                  _buildyourMsg(),
                  (50 - msgController.text.length > 1)
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              LineAwesomeIcons.info_circle,
                              color: Colors.white,
                            ),
                            Text(
                              '${50 - msgController.text.length} more characters required',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )
                      : (50 - msgController.text.length == 1)
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  LineAwesomeIcons.info_circle,
                                  color: Colors.white,
                                ),
                                Text(
                                  '1 more character required',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )
                          : Container(),
                  SizedBox(height: 50),
                  SubmitButton(
                      validatorSeq: isMessageValid,
                      isLoading: isLoading,
                      width: width,
                      buttonText: "Submit",
                      func: () {
                        mail.sendContactUsMail(
                            emailController.text,
                            phoneController.text,
                            nameController.text,
                            msgController.text);
                        toasts.successContact();
                        Navigator.pop(context);
                      })
                ],
              ),
            ),
          ]),
    );
  }
}
