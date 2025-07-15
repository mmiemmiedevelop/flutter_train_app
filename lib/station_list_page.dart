import 'package:flutter/material.dart';
import 'constants/station_list.dart';

class StationListPage extends StatelessWidget {
  final String title;
  final String? excludeStation; // 제외할 역 추가
  const StationListPage({
    super.key,
    required this.title,
    this.excludeStation, // 선택적 매개변수(required 없음)
  });

  @override
  Widget build(BuildContext context) {
    // 제외할 역을 필터한 리스트 생성
    final filteredStations = stationNames
        .where((station) => station != excludeStation)
        .toList();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: filteredStations.length,
          itemBuilder: (context, index) {
            return StationListItem(
              stationName: filteredStations[index],
              onSelected: (name) {
                Navigator.pop(context, name);
              },
            );
          },
        ),
      ),
    );
  }
}

class StationListItem extends StatelessWidget {
  final String stationName;
  final ValueChanged<String> onSelected;

  const StationListItem({
    super.key,
    required this.stationName,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Text(
          stationName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onTap: () => onSelected(stationName),
        shape: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1),
        ),
        tileColor: Theme.of(context).cardColor,
      ),
    );
  }
}
