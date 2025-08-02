import 'package:flutter/material.dart';
import 'dart:math';

class Fmlovemore extends StatefulWidget {
  const Fmlovemore({super.key});

  @override
  State<Fmlovemore> createState() => _FmlovemoreState();
}

class _FmlovemoreState extends State<Fmlovemore> {
  double fahadAmount = 875;
  double fahadPercent = 0.1;
  double totalTarget = 25000;
  double savedAmount = 16250;

  void _showAddAmountDialog() {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("أدخل المبلغ"),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: "مثلاً: 1500"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إلغاء"),
          ),
          ElevatedButton(
            onPressed: () {
              final input = double.tryParse(controller.text);
              Navigator.pop(context);
              if (input == null) return;
              if (input < 3000) {
                _applyAmount(input, showMessage: "تمت إضافة المبلغ بنجاح");
              } else if (input == 3000) {
                _confirmDialog(input);
              } else {
                _showMessage("رصيدك غير كافي");
              }
            },
            child: const Text("إضافة"),
          )
        ],
      ),
    );
  }

  void _confirmDialog(double amount) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("تحذير"),
        content: const Text("بناءً على تحليل راتبك، المبلغ سوف يؤثر على ميزانيتك. هل تريد الدفع؟"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("لا"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _applyAmount(amount, showMessage: "تمت إضافة المبلغ بنجاح");
            },
            child: const Text("نعم"),
          ),
        ],
      ),
    );
  }

  void _applyAmount(double amount, {String? showMessage}) {
    setState(() {
      fahadAmount += amount;
      savedAmount += amount;
      fahadPercent = fahadAmount / totalTarget;
    });
    if (showMessage != null) {
      _showMessage(showMessage);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    double remainingAmount = totalTarget - savedAmount;
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
            const Text("مدعوم بالذكاء الاصطناعي", style: TextStyle(fontSize: 14, color: Colors.black54)),
            const SizedBox(height: 10),
            const Text("حفلة تخرج سارة", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF3F0060))),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Color(0xFFFFE0C2), borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomPaint(
                          size: const Size(120, 120),
                          painter: MultiSegmentCirclePainter(fahadPercent),
                        ),
                        Text("${(fahadPercent + 0.4 + 0.3) * 100 ~/ 1}%", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF3F0060))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _LegendItem(color: Color(0xFF3F0060), label: "الأب"),
                      _LegendItem(color: Color(0xFFFF9933), label: "الأم"),
                      _LegendItem(color: Color(0xFFE0AA77), label: "فهد"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const _InfoItem(title: "الهدف", amount: "25,000 رس"),
                  Container(height: 40, width: 1, color: Color(0xFFFF9933)),
                  _InfoItem(title: "المتبقي", amount: "${remainingAmount.toStringAsFixed(0)} رس"),
                  Container(height: 40, width: 1, color: Color(0xFFFF9933)),
                  _InfoItem(title: "المدخرات", amount: "${savedAmount.toStringAsFixed(0)} رس"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const _PersonContribution(avatar: 'asset/granddad.png', name: 'الأب', percent: '40%', amount: '10500 رس', bgColor: Color(0xFFFF9933)),
                  const Divider(color: Colors.grey, height: 20),
                  const _PersonContribution(avatar: 'asset/grandmam.png', name: 'الأم', percent: '30%', amount: '4875 رس', bgColor: Color(0xFFFF9933)),
                    const Divider(color: Colors.grey, height: 20),
                  _PersonContribution(avatar: 'asset/boy.png', name: 'فهد', percent: "${(fahadPercent * 100).toStringAsFixed(0)}%", amount: "${fahadAmount.toStringAsFixed(0)} رس", bgColor: Color(0xFFFF9933)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                onPressed: _showAddAmountDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5D00A8),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Center(
                  child: Text("إضافة مبلغ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
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

class MultiSegmentCirclePainter extends CustomPainter {
  final double fahadValue;
  MultiSegmentCirclePainter(this.fahadValue);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    double startAngle = -pi / 2;

    final segments = [
      {'color': Color(0xFF3F0060), 'value': 0.4},
      {'color': Color(0xFFFF9933), 'value': 0.3},
      {'color': Color(0xFFE0AA77), 'value': fahadValue},
    ];

    for (var segment in segments) {
      final sweepAngle = 2 * pi * (segment['value'] as num).toDouble();
      paint.color = segment['color'] as Color;
      canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(label),
      ],
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String title;
  final String amount;

  const _InfoItem({required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: const TextStyle(color:  Color(0xFF3F0060),fontWeight: FontWeight.bold,fontSize: 16)),
        const SizedBox(height: 4),
        Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
      ],
    );
  }
}

class _PersonContribution extends StatelessWidget {
  final String avatar;
  final String name;
  final String percent;
  final String amount;
  final Color bgColor;

  const _PersonContribution({
    required this.avatar,
    required this.name,
    required this.percent,
    required this.amount,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(avatar),
              radius: 20,
              backgroundColor: Colors.transparent,
            ),
          ),
          const SizedBox(width: 10),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3F0060))),
          const Spacer(),
          Text(percent, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3F0060))),
          const SizedBox(width: 12),
          Text(amount, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
