import 'package:flutter/material.dart';
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
      selectedSeat =
          '${widget.departureStation}-${widget.arrivalStation}-${selectedRow}-${selectedCol}';
      print('selectedSeat: $selectedSeat');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.pop(context, selectedSeat);
              },
              child: const Text(Lang.reserve),
            ),
          ),
        ],
      ),
    );
  }
}
