import 'package:flutter/material.dart';

class SeatHeaderView extends StatelessWidget {
  const SeatHeaderView({
    super.key,
    required this.departureStation,
    required this.arrivalStation,
  });
  final String departureStation;
  final String arrivalStation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Expanded(
          flex: 3,
          child: Text(
            textAlign: TextAlign.center,
            departureStation,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
            maxLines: 1,
          ),
        ),
        Spacer(),
        Expanded(child: Icon(Icons.arrow_circle_right_outlined, size: 30)),
        Spacer(),
        Expanded(
          flex: 3,
          child: Text(
            textAlign: TextAlign.center,
            arrivalStation,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
            maxLines: 1,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
