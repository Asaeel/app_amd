import 'package:flutter/material.dart';

class Money extends StatelessWidget {
  const Money({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Directionality(
          textDirection: TextDirection.ltr,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_circle_right,
              color: Color(0xFF5D00A8),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 12, right: 8),
            child: Icon(Icons.more_vert, color: Color(0xFF5D00A8)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Image.asset('asset/ai.png', height: 30),
            const Text(
              "مدعوم بالذكاء الاصطناعي",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            const Text(
            "إستثمار العائلة",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3F0060),
              ),
            ),
            const SizedBox(height: 20),

            //  صورة تبرع 1
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'asset/Screenshot 2025-08-01 090322.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 220,
                ),
              ),
            ),

            // صورة تبرع 2
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'asset/Screenshot 2025-08-01 090613.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 220,
                ),
              ),
            ),

            const SizedBox(height: 20),

            //  زر إضافة تبرع
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6B00A3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Center(
                  child: Text(
                "إضافة إستثمار",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "MOH",
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

















