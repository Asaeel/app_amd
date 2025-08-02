import 'package:app_amd/home.dart';
import 'package:flutter/material.dart';

class Finally extends StatelessWidget {
  const Finally({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // scroll
        child: Column(
          children: [
            //  الهيدر العلوي
            Container(
              width: double.infinity,
              height: 290,
              decoration: const BoxDecoration(
                color: Color(0xFF5D00A8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new,
                            color: Colors.white),
                        onPressed: () {  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const home()));}
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 20,
                      child: Icon(Icons.more_vert, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 150, bottom: 100, right: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 230),
                            child: Text(
                              "حالة الدفع",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                fontFamily: "MOH",
                                color: Color(0xFFFF9933),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: EdgeInsets.only(left: 100),
                            child: Text(
                              "حتى القطة لها ميزانية .. لاننا نهتم بكل التفاصيل ",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "MOH",
                                color: Colors.white,
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

            // صندوق القطة
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFA63A),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: const Text(
                      "قطة ساره لحفل التخرج",
                      style: TextStyle(
                        fontFamily: 'MOH',
                        color: Color(0xFF5D00A8),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Color(0xFF5D00A8),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage("asset/sist.png"),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                "ساره",
                                style: TextStyle(
                                  fontFamily: 'MOH',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "احتفال بتخرج ساره من الجامعه !",
                                style: TextStyle(
                                  fontFamily: 'MOH',
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //  الحقول: النوع + الوصف
            buildField("النوع :", "حفلة"),
            buildField("الوصف :", "سارة تخرجت من الجامعة"),

            //  المبلغ المطلوب
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "المبلغ المطلوب :",
                    style: TextStyle(
                      fontFamily: 'MOH',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5D00A8),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFF5D00A8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.add, color: Color(0xFFFFA63A)),
                        Text(
                          "500 R.S",
                          style: TextStyle(
                            color: Color(0xFFFFA63A),
                            fontFamily: 'MOH',
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //  الأزرار: قبول + رفض مع Dialog
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5D00A8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("تم القبول"),
                          content: const Text("✅ تم قبول إضافة المبلغ"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("إغلاق"),
                            )
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      "قبول الإضافة",
                      style: TextStyle(
                          fontFamily: 'MOH',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF9933),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("تم الرفض"),
                          content: const Text("❌ تم رفض الإضافة"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("إغلاق"),
                            )
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      "رفض الإضافة",
                      style: TextStyle(
                          fontFamily: 'MOH',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF5D00A8)),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // زر تحديث الحالة
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.refresh, color: Color(0xFF5D00A8)),
              label: const Text("تحديث الحالة",
                  style: TextStyle(color: Color(0xFF5D00A8))),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFB43F),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(height: 20),

            // جدول الحالة
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFB43F),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  buildRow("الاسم", "المبلغ", "الحالة", isHeader: true),
                  const Divider(),
                  buildRow("فهد", "500", "❌"),
                  const SizedBox(height: 8),
                  buildRow("الأم", "500", "✔"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'MOH',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5D00A8),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFFF1ECF8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontFamily: 'MOH',
                fontSize: 14,
                color: Color(0xFFFF9933),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow(String name, String amount, String status,
      {bool isHeader = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          status,
          style: TextStyle(
              fontFamily: 'MOH',
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              color: Color(0xFF5D00A8)),
        ),
        Text(
          amount,
          style: TextStyle(
              fontFamily: 'MOH',
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              color: Color(0xFF5D00A8)),
        ),
        Text(
          name,
          style: TextStyle(
              fontFamily: 'MOH',
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              color: Color(0xFF5D00A8)),
        ),
      ],
    );
  }
}
