import 'package:app_amd/addfamily.dart';
import 'package:app_amd/share.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  final _formKey = GlobalKey<FormState>();
  
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Directionality(
          textDirection: TextDirection.ltr,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_circle_right_sharp,
              color: Color(0xFF5D00A8),
            ),
          onPressed: () {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => addfamily()),
  );
},
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
           key: _formKey,
          child: Column(
            children: [
              Center(
                  child: Image.asset("asset/dfa.png")
              ),
              Container(
                height: 747,
                decoration: const BoxDecoration(
                  color: Color(0xFF5D00A8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 10, right: 30),
                        child: Text(
                          "تسجيل  حساب جديد",
                          style: TextStyle(
                            fontFamily: "MOH",
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0, right: 30),
                      child: Text("الاسم الرباعي ",
                          style: TextStyle(
                            fontFamily: "MOH",
                            fontSize: 15,
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 130, right: 30, left: 30),
                      child: SizedBox(
                        height: 50,
                        width: 500,
                        child: TextFormField(
                          controller:_nameController,
                          decoration: InputDecoration(
                            hintText: "ريم فايز سالم لرضي",
                            filled: true,
                            fillColor: const Color(0xFFF4F1F9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontFamily: 'MOH'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'الرجاء تعبئة الاسم الرباعي ';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(top: 200.0, right: 30),
                      child: Text("البريد الالكتروني ",
                          style: TextStyle(
                            fontFamily: "MOH",
                            fontSize: 15,
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 230, right: 30, left: 30),
                      child: SizedBox(
                        height: 50,
                        width: 500,
                        child: TextFormField(
                          controller: _emailController ,
                          decoration: InputDecoration(
                            hintText: "reem..@gmail.com",
                            filled: true,
                            fillColor: const Color(0xFFF4F1F9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontFamily: 'MOH'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'الرجاء تعبئة البريد الالكتروني';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(top: 300.0, right: 30),
                      child: Text("كلمة السر",
                          style: TextStyle(
                            fontFamily: "MOH",
                            fontSize: 15,
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 330, right: 30, left: 30),
                      child: SizedBox(
                        height: 50,
                        width: 500,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFF4F1F9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontFamily: 'MOH'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'الرجاء تعبئة كلمة السر';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(top: 400.0, right: 30),
                      child: Text("رقم الجوال",
                          style: TextStyle(
                            fontFamily: "MOH",
                            fontSize: 15,
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 430, right: 30, left: 30),
                      child: SizedBox(
                        height: 50,
                        width: 500,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller:  _phoneController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFF4F1F9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontFamily: 'MOH'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'الرجاء تعبئة رقم الجوال الخاص بك';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 150),
                    Padding(
                      padding: const EdgeInsets.only(top: 520, right: 30, left: 30),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("تم انشاء الحساب"),
                                backgroundColor: Colors.green,
                              ),
                            );
                      
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const share(),
                                ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF9933),
                          padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 110),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "انشئ حسابك الان!",
                          style: TextStyle(
                            fontFamily: 'MOH',
                            fontSize: 18,
                            color: Color(0xFF3F0060),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
