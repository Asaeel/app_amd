import 'package:app_amd/bag.dart';
import 'package:app_amd/home.dart';
import 'package:flutter/material.dart';

class Detels extends StatefulWidget {
  const Detels({super.key});

  @override
  State<Detels> createState() => _DetelsState();
}

class _DetelsState extends State<Detels> {
  final List<Map<String, dynamic>> customCategories = [];
  final TextEditingController _categoryNameController = TextEditingController();
  final TextEditingController _customAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                MaterialPageRoute(builder: (context) => const home()),
              );
            },
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "الميزانية الشخصية",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3F0060),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                buildItem("asset/cap.png", "الطعام", 500, 1000),
                buildItem("asset/reem.png", "الملبس", 75, 1500),
                buildItem("asset/Screenshot 2025-08-01 060252.png", "الترفيه", 800, 1000),
                buildItem("asset/camera.png", "الأجهزة", 990, 1500),
                for (var item in customCategories)
                  buildItem(item['icon'], item['title'], item['spent'], item['total']),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _categoryNameController.clear();
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          title: const Text("إضافة فئة", textAlign: TextAlign.center),
                          content: TextField(
                            controller: _categoryNameController,
                            textAlign: TextAlign.right,
                            decoration: const InputDecoration(hintText: "ادخل اسم الفئة"),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("إلغاء"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: const Text("تحليل الذكاء الاصطناعي"),
                                    content: const Text("سوف يقوم الذكاء الاصطناعي بتحليل راتبك وتحديد المبلغ المناسب لهذه الفئة"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            customCategories.add({
                                              'title': _categoryNameController.text,
                                              'icon': 'asset/reem.png',
                                              'spent': 0.0,
                                              'total': 1000.0,
                                            });
                                            _categoryNameController.clear();
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: const Text("حسنًا"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          _customAmountController.clear();
                                          showDialog(
                                            context: context,
                                            builder: (_) => AlertDialog(
                                              title: const Text("أدخل المبلغ"),
                                              content: TextField(
                                                controller: _customAmountController,
                                                keyboardType: TextInputType.number,
                                                textAlign: TextAlign.right,
                                                decoration: const InputDecoration(hintText: "مثلاً: 1500"),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () => Navigator.pop(context),
                                                  child: const Text("إلغاء"),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      double total = double.tryParse(_customAmountController.text) ?? 1000.0;
                                                      customCategories.add({
                                                        'title': _categoryNameController.text,
                                                        'icon': 'asset/reem.png',
                                                        'spent': 0.0,
                                                        'total': total,
                                                      });
                                                      _categoryNameController.clear();
                                                      _customAmountController.clear();
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("إضافة"),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        child: const Text("تعديل"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: const Text("إضافة"),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6B00A3),
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text("إضافة فئة", style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: "MOH", fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildItem(String imagePath, String title, double spent, double total) {
    double percent = (spent / total).clamp(0.0, 1.0);
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD9B4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(imagePath, width: 40),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6B00A3),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              if (spent > 0)
                FractionallySizedBox(
                  widthFactor: percent,
                  child: Container(
                    height: 10,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6B00A3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${spent.toInt()} ريال", style: const TextStyle(fontSize: 14, color: Color(0xFF6B00A3))),
              Text("${total.toInt()} ريال", style: const TextStyle(fontSize: 14, color: Color(0xFF6B00A3))),
            ],
          ),
          const SizedBox(height: 6),
          Align(
            alignment: Alignment.centerRight,
            child: Text("${(percent * 100).toInt()}%", style: const TextStyle(fontSize: 14, color: Color(0xFF6B00A3))),
          ),
        ],
      ),
    );
  }
}
