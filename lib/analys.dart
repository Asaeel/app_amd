import 'package:app_amd/Nextpage.dart';
import 'package:app_amd/home.dart';
import 'package:flutter/material.dart';

class Analys extends StatelessWidget {
  const Analys({super.key});

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
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const home()));
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
            Center(child: Image.asset('asset/ai.png', height: 30)),
            const Center(
              child: Text(
                "مدعوم بالذكاء الاصطناعي",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "مصروفات العائلة ",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3F0060),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // زر التقرير
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Nextpage()),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
                  decoration: BoxDecoration(
                    color: Color(0xFFFF9933),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "التقرير",
                    style: TextStyle(
                      color: Color(0xFF3F0060),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            buildCard(
              context,
              "asset/sist.png",
              [3000, 200, 0],
              ["الطعام", "الترفيه", "الدراسة"],
              const Color(0xFFFFE0C2),
            ),
            buildCard(
              context,
              "asset/girl.png",
              [3000, 200, 778],
              ["الطعام", "الترفيه", "الدراسة"],
              const Color(0xFFFFE0C2),
            ),
            buildCard(
              context,
              "asset/boy2.png",
              [3000, 200, 778],
              ["الطعام", "الترفيه", "الدراسة"],
              const Color(0xFFFFE0C2),
            ),

            const SizedBox(height: 20),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF9933), Color(0xFFFF0000)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.warning, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    "تجاوزت ساره الصرف في الترفيه !",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String avatar, List<int> values, List<String> labels, Color bgColor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(labels.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          index == 0
                              ? Icons.restaurant
                              : index == 1
                                  ? Icons.videogame_asset
                                  : Icons.school,
                          size: 20,
                          color: Color(0xFF3F0060),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          labels[index],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Text(values[index].toString()),
                      ],
                    ),
                    const SizedBox(height: 4),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: values[index] / 3000,
                        backgroundColor:  Color(0xFFF0E5F5),
                        valueColor: const AlwaysStoppedAnimation(Color(0xFF3F0060)),
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          Positioned(
            top: -40,
            right: -20,
            child: Container(
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(4),
              child: CircleAvatar(
                backgroundImage: AssetImage(avatar),
                radius: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
