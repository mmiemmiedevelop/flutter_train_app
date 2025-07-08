import 'package:flutter/material.dart';
import 'constants/station_list.dart';

class StationListPage extends StatelessWidget {
  final String title;
  const StationListPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: ListView.builder(
          //😫separated쓰면 가이드 사진이랑 똑같은데 오른쪽에 텍스트로 써있는 스타일 가이드대로 작업함
          itemBuilder: (context, index) {
            return StationListItem(stationName: stationNames[index]);
          },
          itemCount: stationNames.length,
        ),
      ),
    );
  }
}

// 역 목록 아이템
class StationListItem extends StatelessWidget {
  final String stationName;
  const StationListItem({super.key, required this.stationName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Container(
        width: double.infinity,
        height: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                stationName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(color: Colors.grey[300], thickness: 1, height: 1),
          ],
        ),
      ),
      onTap: () {
        Navigator.pop(context, stationName);
      },
    );
  }
}
