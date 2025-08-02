import 'package:app_amd/person.dart';
import 'package:flutter/material.dart';

class addfamily extends StatefulWidget {
  const addfamily({super.key});

  @override
  State<addfamily> createState() => _addfamilyState();
}

class _addfamilyState extends State<addfamily> {
  // حالة كل عضو (محدد أو لا)
  List<bool> selected = List.generate(6, (_) => false);

  // روابط الصور
  List<String> imagePaths = [
    'asset/grandmam.png',
    'asset/granddad.png',
    'asset/girl.png',
    'asset/boy.png',
    'asset/boy2.png',
    'asset/sist.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Directionality(
          textDirection: TextDirection.ltr,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_circle_right,
              color: Color(0xFF5D00A8),
            ),
            onPressed: () {
            Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => Person()),
  ); // رجوع للخلف
            },
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "أفراد العائلة",
              style: TextStyle(
                fontFamily: "MOH",
                fontSize: 32,
                color: Color(0xFF5D00A8),
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          const SizedBox(height: 25),

          // شبكة الصور (3 صفوف × 2 أعمدة)
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              children: List.generate(6, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selected[index] = !selected[index];
                    });
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: selected[index]
                        ? Color(0xFF5D00A8)
                        : const Color(0xFFFF9933),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        imagePaths[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 10),

          // زر إضافة عضو جديد
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("تم إضافة عضو جديد بنجاح",style: TextStyle(color: Colors.white),),
                    backgroundColor: Color(0xFF5D00A8),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5D00A8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text(
                "إضافة عضو جديد",
                style: TextStyle(fontFamily: "MOH", fontSize: 16,color: Colors.white),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // زر حذف عضو
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("تم حذف عضو"),
                    backgroundColor: Color(0xFFFF9933),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF9933),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text(
                "حذف عضو",
                style: TextStyle(
                  fontFamily: "MOH",
                  fontSize: 16,
                  color: Color(0xFF3F0060),
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          // كلمة "دفء"
         Image.asset("asset/dfa.png",width: 100,),
         SizedBox(height: 20),
        ],
      ),
    );
  }
}
