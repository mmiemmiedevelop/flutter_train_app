import 'package:flutter/material.dart';
import 'package:flutter_train_app/subView/common_button.dart';
import 'station_list_page.dart';
import 'seat_page.dart';
import 'constants/lang.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _departureStation;
  String? _arrivalStation;
  String? _selectedSeat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  // 1. 앱바
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(Lang.train),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    );
  }

  // 2. 바디
  Widget _buildBody() {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            _buildStationSelectionCard(),
            const SizedBox(height: 20),
            _buildSelectSeatButton(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  //3. 출발역, 도착역 선택
  Widget _buildStationSelectionCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 200,
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: _buildStationSelector(
                    title: Lang.departure,
                    selectedStation: _departureStation,
                    excludeStation: _arrivalStation,
                    onStationSelected: (station) {
                      setState(() {
                        _departureStation = station;
                      });
                    },
                  ),
                ),
                _buildVerticalDivider(),
                Expanded(
                  child: _buildStationSelector(
                    title: Lang.arrival,
                    selectedStation: _arrivalStation,
                    excludeStation: _departureStation,
                    onStationSelected: (station) {
                      setState(() {
                        _arrivalStation = station;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStationSelector({
    required String title,
    required String? selectedStation,
    required String? excludeStation,
    required Function(String) onStationSelected,
  }) {
    return GestureDetector(
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            const Spacer(),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Text(
              selectedStation ?? Lang.select,
              style: const TextStyle(fontSize: 40),
            ),
            const Spacer(),
          ],
        ),
      ),
      onTap: () =>
          _navigateToStationList(title, excludeStation, onStationSelected),
    );
  }

  Widget _buildVerticalDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: VerticalDivider(color: Colors.grey[400], thickness: 2, width: 2),
    );
  }

  //4. 좌석 선택 버튼
  Widget _buildSelectSeatButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CommonButton(
        text: Lang.selectSeat,
        onPressed: _navigateToSeatPage,
      ),
    );
  }

  void _navigateToStationList(
    String title,
    String? excludeStation,
    Function(String) onStationSelected,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            StationListPage(title: title, excludeStation: excludeStation),
      ),
    ).then((selectedStation) {
      if (selectedStation != null) {
        onStationSelected(selectedStation);
      }
    });
  }

  void _navigateToSeatPage() {
    // 출발역과 도착역이 선택되지 않았으면 좌석선택으로 이동 못하게 처리
    if (_departureStation == null || _arrivalStation == null) {
      return;
    }

    final currentContext = context;
    final departureStation = _departureStation!;
    final arrivalStation = _arrivalStation!;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SeatPage(
          departureStation: departureStation,
          arrivalStation: arrivalStation,
        ),
      ),
    ).then((selectedSeat) {
      // 예매 확인까지 완료되었을 때만 상태 초기화
      if (selectedSeat != null && currentContext.mounted) {
        _selectedSeat = selectedSeat;

        // mounted 체크 후에 ScaffoldMessenger 사용
        ScaffoldMessenger.of(currentContext).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '예매 완료! $selectedSeat',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            duration: const Duration(seconds: 5),
            backgroundColor: Theme.of(currentContext).colorScheme.primary,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.all(16),
          ),
        );

        setState(() {
          _departureStation = null;
          _arrivalStation = null;
        });
      }
      // selectedSeat가 null이면 사용자가 뒤로가기나 취소를 눌렀으므로 초기화하지 않음
    });
  }
}
