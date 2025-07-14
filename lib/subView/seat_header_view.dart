import 'package:flutter/material.dart';

class SeatHeaderView extends StatelessWidget {
  const SeatHeaderView({super.key, required this.departureStation, required this.arrivalStation});
  final String departureStation;
  final String arrivalStation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Expanded(
          child: Text(
            departureStation,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple),
          ),
        ),
        Spacer(),
        Expanded(child: Icon(Icons.arrow_circle_right_outlined, size: 30)),
        Spacer(),
        Expanded(
          child: Text(
            arrivalStation,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
