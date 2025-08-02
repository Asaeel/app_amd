import 'package:app_amd/addfamily.dart';
import 'package:flutter/material.dart';

class share extends StatelessWidget {
  const share({super.key});

  @override
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
      body: Stack(
        children: [
          // البنفسجي
          Positioned(
            top: 160,
            left: 0,
            right: 0,
            child: Container(
              height: 620,
              decoration: const BoxDecoration(
                color: Color(0xFF5D00A8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 150), // مساحة بعد الصورة
                child: Column(
                  children: [
                    const Text(
                      "دعوة أفراد العائلة",
                      style: TextStyle(
                        fontFamily: "MOH",
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "قم بدعوة أعضاء العائلة للانضمام !",
                      style: TextStyle(
                        fontFamily: "MOH",
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // حقل البريد الإلكتروني
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "البريد الإلكتروني",
                            hintStyle: TextStyle(
                              fontFamily: "MOH",
                              color: Colors.black87,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // زر إرسال دعوة
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFF9933),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            "أرسل دعوة",
                            style: TextStyle(
                              fontFamily: 'MOH',
                              fontSize: 18,
                              color: Color(0xFF3F0060),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //  الصورة بالحجم المثالي
          Positioned(
            top: -70,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                "asset/imagfamily.png",
                width: 500,
                height: 500,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
