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
          padding: EdgeInsets.zero,
          itemCount: stationNames.length,
          itemBuilder: (context, index) {
            return StationListItem(
              stationName: stationNames[index],
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
        shape: Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1)),
        tileColor: Colors.white,
      ),
    );
  }
}
