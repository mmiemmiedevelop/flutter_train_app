import 'package:flutter/material.dart';
import 'package:flutter_train_app/subView/seat_dot_view.dart';
import 'package:flutter_train_app/subView/seat_header_view.dart';
import 'package:flutter_train_app/subView/seat_select_box.dart';
import 'constants/lang.dart';

class SeatPage extends StatelessWidget {
  const SeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Lang.selectSeat)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SeatHeaderView(departureStation: '출발', arrivalStation: '도착'),
          SeatDotView(),
          Expanded(
            child: SeatSelectBox(
              onSelected: (row, col) {
                print('row: $row, col: $col');
              },
              selectedRow: 0,
              selectedCol: 0,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeatPage()),
                );
              },
              child: const Text(Lang.reserve),
            ),
          ),
        ],
      ),
    );
  }
}
