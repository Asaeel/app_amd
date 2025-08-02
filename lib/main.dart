import 'package:app_amd/SignupPage.dart';
import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تسجيل الدخول',
      theme: ThemeData(
        fontFamily: 'MOH',
      ),
      home: const LoginPage(),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //  Header (نص يمين وصورة يسار تحت)
          Container(
            height: 300,
            decoration: const BoxDecoration(
              color: Color(0xFF5D00A8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            width: double.infinity,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150, right: 60, left: 200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'أهلًا بك !',
                        style: TextStyle(
                          fontFamily: 'MOH',
                          fontSize: 30,
                          color: Color(0xFFFF9933),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'حين نخطط نعيش أفضل آمانًا',
                        style: TextStyle(
                          fontFamily: 'MOH',
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -50,
                  left: 0,
                  top: 60,
                  child: Image.asset(
                    'asset/Image 31.png', // تأكدي من المسار الصحيح
                    width: 250,
                  ),
                ),
              ],
            ),
          ),

          //  باقي الواجهة مع التحقق
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 10),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 200),
                        child: Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                            fontFamily: 'MOH',
                            fontSize: 22,
                            color: Color(0xFF3F0060),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // رقم الهوية
                    TextFormField(
                      controller: _idController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'رقم الهوية',
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
                          return 'الرجاء تعبئة رقم الهوية';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 15),

                    // كلمة السر
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'كلمة السر',
                        filled: true,
                        fillColor: const Color(0xFFF4F1F9),
                        suffixIcon: const Icon(Icons.visibility_off),
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

                    const SizedBox(height: 10),

                    // نسيت كلمة المرور
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text.rich(
                        TextSpan(
                          text: 'هل نسيت كلمة المرور؟ ',
                          style: const TextStyle(
                            fontFamily: 'MOH',
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                          children: [
                            TextSpan(
                              text: 'اضغط هنا',
                              style: const TextStyle(
                                color: Color(0xFFFF9933),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // زر تسجيل الدخول
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //  الحقول مكتملة → يمكن تنفيذ الإجراء
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('تم تسجيل الدخول بنجاح'),
                              backgroundColor: Colors.green,
                            ),
                          );

                          // مثال: التنقل لصفحة ثانية
                          // Navigator.push(...);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF9933),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          fontFamily: 'MOH',
                          fontSize: 18,
                          color: Color(0xFF3F0060),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // زر إنشاء حساب جديد
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5D00A8),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'انشاء حساب جديد',
                        style: TextStyle(
                          fontFamily: 'MOH',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // أيقونات تسجيل الدخول
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('asset/facebook.png', width: 28),
                        const SizedBox(width: 15),
                        Image.asset('asset/google (1).png', width: 28),
                        const SizedBox(width: 15),
                        Image.asset('asset/apple.png', width: 28),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
