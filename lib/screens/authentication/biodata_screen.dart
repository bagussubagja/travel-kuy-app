import 'package:flutter/material.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:travel_kuy_app/widgets/my_textfield.dart';

class BiodataUser extends StatefulWidget {
  String? email;
  String? password;
  BiodataUser({Key? key, this.email, this.password}) : super(key: key);

  @override
  State<BiodataUser> createState() => _BiodataUserState();
}

class _BiodataUserState extends State<BiodataUser> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _nameController = TextEditingController();
  bool _isObscure = false;
  List<String> _gender = ["Male", "Female"];
  String? _selectedGender = "Male";
  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email!;
    _passwordController.text = widget.password!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: Padding(
        padding: defaultPadding,
        child: SafeArea(
          child: ListView(
            children: [
              Text(
                'Biodata',
                style: titleText,
              ),
              Text(
                'Complete your information to start!',
                style: subTitleText,
              ),
              MarginHeight(height: 25),
              MyTextField(
                titleText: 'Email',
                readOnly: true,
              ),
              MarginHeight(height: 15),
              MyTextField(
                titleText: 'Password',
                readOnly: true,
                obscureText: _isObscure,
                suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color: greyColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    }),
              ),
              MarginHeight(height: 15),
              MyTextField(
                titleText: 'Name',
                controller: _nameController,
              ),
              MarginHeight(height: 25),
              DropdownButtonFormField<String>(
                  dropdownColor: blackBackgroundColor,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 2, color: greyColor)),
                  ),
                  value: _selectedGender,
                  items: _gender
                      .map(
                        (gender) => DropdownMenuItem<String>(
                          value: gender,
                          child: Text(
                            gender,
                            style: regularText,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (item) => setState(() {
                        _selectedGender = item;
                      })),
              MarginHeight(height: 50),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: greenDarkerColor),
                  child: Text(
                    'Done',
                    style: regularText,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
