import 'package:flutter/material.dart';
import 'home.dart';
import 'goals.dart';
import 'person.dart';

class Bag extends StatefulWidget {
  const Bag({super.key});

  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  final List<Map<String, dynamic>> dynamicCategories = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  final TextEditingController deleteController = TextEditingController();

  final double maxBudget = 1000.0; // ميزانية المحفظة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3F0060)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const home()),
            );
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.more_vert, color: Color(0xFF3F0060)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "المحفظة العائلية",
                  style: TextStyle(
                    fontFamily: "MOH",
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3F0060),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF5D00A8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text("مقدار المال", style: TextStyle(fontFamily: "MOH", fontSize: 14, color: Colors.white)),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text("5000", style: TextStyle(fontFamily: "MOH", fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(width: 12),
                        Image(image: AssetImage("asset/MORE MONY.png"), width: 22),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text("تاريخ إضافة الأموال", style: TextStyle(fontFamily: "MOH", fontSize: 14, color: Colors.white)),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text("July 2025", style: TextStyle(fontFamily: "MOH", fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(width: 12),
                        Image(image: AssetImage("asset/DATE.png"), width: 22),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF9933), Color(0xFFFF0000)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.warning_amber_rounded, color: Colors.white),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        "تم تجاوز الحد الإنفاقي هذا الشهر في فئة الترفيه!",
                        style: TextStyle(fontFamily: "MOH", fontSize: 16, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ...buildCategory("الطعام", 1800),
              const SizedBox(height: 20),
              ...buildCategory("الترفيه", 1500, icon: Icons.warning_amber_rounded, iconColor: Colors.red),
              const SizedBox(height: 20),
              ...buildCategory("التعليم", 1350),
              const SizedBox(height: 20),
              ...dynamicCategories.expand((e) => buildCategory(e['title'], e['value'])).toList(),
              const SizedBox(height: 7),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        title: const Text("إضافة فئة", textAlign: TextAlign.center),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(controller: titleController, textAlign: TextAlign.right, decoration: const InputDecoration(hintText: "ادخل اسم الفئة")),
                            const SizedBox(height: 10),
                            TextField(controller: valueController, textAlign: TextAlign.right, keyboardType: TextInputType.number, decoration: const InputDecoration(hintText: "ادخل المبلغ")),
                          ],
                        ),
                        actions: [
                          TextButton(child: const Text("إلغاء"), onPressed: () => Navigator.pop(context)),
                          TextButton(
                            child: const Text("إضافة"),
                            onPressed: () {
                              setState(() {
                                dynamicCategories.add({
                                  'title': titleController.text,
                                  'value': double.tryParse(valueController.text) ?? 0.0
                                });
                                titleController.clear();
                                valueController.clear();
                              });
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  content: const Text("سوف يقوم الذكاء الاصطناعي بتحليل المدفوعات للأبناء"),
                                  actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("حسنًا"))],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5D00A8),
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text("إضافة فئة", style: TextStyle(fontFamily: "MOH", color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("حذف فئة", textAlign: TextAlign.center),
                        content: TextField(controller: deleteController, textAlign: TextAlign.right, decoration: const InputDecoration(hintText: "اكتب اسم الفئة")),
                        actions: [
                          TextButton(child: const Text("إلغاء"), onPressed: () => Navigator.pop(context)),
                          TextButton(
                            child: const Text("حذف"),
                            onPressed: () {
                              setState(() {
                                dynamicCategories.removeWhere((e) => e['title'] == deleteController.text);
                                deleteController.clear();
                              });
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF9933),
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text("حذف فئة", style: TextStyle(fontFamily: "MOH", color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const home())), child: const Icon(Icons.home, size: 40, color: Color(0xFF5D00A8))),
            GestureDetector(onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const goals())), child: const Icon(Icons.track_changes, size: 40, color: Color(0xFF5D00A8))),
            GestureDetector(onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Person())), child: const Icon(Icons.person, size: 40, color: Color(0xFF5D00A8))),
          ],
        ),
      ),
    );
  }

  List<Widget> buildCategory(String title, double value, {IconData? icon, Color iconColor = const Color(0xFF5D00A8)}) {
    final double percent = value / maxBudget;

    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${value.toStringAsFixed(0)} / $maxBudget ريال", style: const TextStyle(fontFamily: "MOH", color: Colors.black54)),
          Row(
            children: [
              if (icon != null) Icon(icon, color: iconColor),
              if (icon != null) const SizedBox(width: 6),
              Text(title, style: const TextStyle(fontFamily: "MOH", fontWeight: FontWeight.bold, color: Color(0xFF3F0060))),
            ],
          ),
        ],
      ),
      const SizedBox(height: 8),
      Stack(
        children: [
          Container(height: 10, decoration: BoxDecoration(color: const Color(0xFFECE0F5), borderRadius: BorderRadius.circular(20))),
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: percent.clamp(0.0, 1.0),
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: title == "الطعام" || title == "الترفيه" || title == "التعليم"
                    ? const Color(0xFF3F0060)
                    : const Color(0xFFD1B3F3),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 6),
      Text("${(percent * 100).round()}%", style: const TextStyle(fontFamily: "MOH", fontWeight: FontWeight.bold, color: Color(0xFF3F0060))),
    ];
  }
}
