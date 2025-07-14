import 'package:flutter/material.dart';

class SeatSelectBox extends StatelessWidget {
  SeatSelectBox({
    super.key,
    required this.onSelected,
    required this.selectedRow,
    required this.selectedCol,
  });
  void Function(int, int) onSelected;
  int? selectedRow;
  int? selectedCol;
  final int rowCount = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 상단에 A, B, C, D 표시
        buildHeaderRow(),
        // 좌석 행들
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 1; i <= rowCount; i++)
                  row(i, onSelected, selectedRow ?? 0, selectedCol ?? 0),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _header('A'),
        const SizedBox(width: 5), // A-B 간격
        _header('B'),

        const SizedBox(width: 50), //  통로 간격

        _header('C'),
        const SizedBox(width: 5), // C-D 간격
        _header('D'),
      ],
    );
  }

  // ABCD 글자만 표시하는 행
  Widget _header(String label) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Center(child: Text(label, style: const TextStyle(fontSize: 18))),
    );
  }

  // ABCD 표시 행
  Widget row(
    int rowNum,
    Function(int, int) onSelected,
    int selectedRow,
    int selectedCol,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 4,
      ), // 세로 간격 8 (상하 4씩)
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          seat(rowNum, 1, onSelected, selectedRow, selectedCol),
          seat(rowNum, 2, onSelected, selectedRow, selectedCol),
          SizedBox(
            width: 50,
            height: 50,
            child: Center(
              child: Text(rowNum.toString(), style: TextStyle(fontSize: 18)),
            ),
          ),
          seat(rowNum, 3, onSelected, selectedRow, selectedCol),
          seat(rowNum, 4, onSelected, selectedRow, selectedCol),
        ],
      ),
    );
  }

  // 하나하나 네모박스들 좌석 선택 버튼
  Widget seat(
    int rowNum,
    int colNum,
    Function(int, int) onSelected,
    int selectedRow,
    int selectedCol,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0), // 가로 간격 4 (좌우 2씩)
      child: GestureDetector(
        onTap: () {
          onSelected(rowNum, colNum);
        },
        child: SizedBox(
          width: 50,
          height: 50,
          child: Container(
            decoration: BoxDecoration(
              color: rowNum == selectedRow && colNum == selectedCol
                  ? Colors.purple
                  : Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
