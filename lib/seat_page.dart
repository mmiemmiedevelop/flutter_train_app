import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_train_app/subView/common_button.dart';
import 'package:flutter_train_app/subView/seat_dot_view.dart';
import 'package:flutter_train_app/subView/seat_header_view.dart';
import 'package:flutter_train_app/subView/seat_select_box.dart';
import 'constants/lang.dart';

class SeatPage extends StatefulWidget {
  const SeatPage({
    super.key,
    required this.departureStation,
    required this.arrivalStation,
  });
  final String departureStation;
  final String arrivalStation;

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? selectedRow;
  int? selectedCol;
  String? selectedSeat;

  void onSelectedSeat(int row, int col) {
    setState(() {
      selectedRow = row;
      selectedCol = col;
      //좌석 예매 번호 생성>일단만들어 놓음
      selectedSeat =
          '${widget.departureStation}-${widget.arrivalStation}-${selectedRow}-${selectedCol}';
    });
  }

  void _showCupertinoDialog() {
    //널처리
    if (selectedRow == null ||
        selectedCol == null ||
        selectedRow == 0 ||
        selectedCol == 0) {
      return;
    }

    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('예매 하시겠습니까?'),
          content: Text(
            '좌석 : $selectedRow-${_convertToSeatColumn(selectedCol!)}',
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text('취소'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context, selectedSeat);
              },
            ),
          ],
        );
      },
    );
  }

  // 컬럼숫자 ABCD 변환
  String _convertToSeatColumn(int col) {
    switch (col) {
      case 1:
        return 'A';
      case 2:
        return 'B';
      case 3:
        return 'C';
      case 4:
        return 'D';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: const Text(Lang.selectSeat)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SeatHeaderView(
            departureStation: widget.departureStation,
            arrivalStation: widget.arrivalStation,
          ),
          SeatDotView(),
          Expanded(
            child: SeatSelectBox(
              onSelected: onSelectedSeat,
              selectedRow: selectedRow ?? 0,
              selectedCol: selectedCol ?? 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: CommonButton(
              text: Lang.reserve,
              onPressed: _showCupertinoDialog,
            ),
          ),
        ],
      ),
    );
  }
}
