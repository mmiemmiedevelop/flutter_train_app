import 'package:flutter/material.dart';
import 'package:flutter_train_app/constants/lang.dart';

class SeatDotView extends StatelessWidget {
  const SeatDotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLegendBox(Colors.purple, Lang.selected),
          SizedBox(width: 20),// 사이 간격
          _buildLegendBox(Colors.grey[300]!, Lang.empty),
        ],
      ),
    );
  }

  // 범례 박스 + 텍스트 위젯
  Widget _buildLegendBox(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(width: 4),
        Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}
