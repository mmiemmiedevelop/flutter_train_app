import 'package:flutter/material.dart';

class SeatPage extends StatelessWidget {
  const SeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('출발역 선택')),
      body: const Center(child: Text('출발역 선택 페이지')),
    );
  }
}
