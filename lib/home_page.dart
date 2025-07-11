import 'package:flutter/material.dart';
import 'station_list_page.dart';
import 'seat_page.dart';
import 'constants/lang.dart';

class MyHomePage extends StatefulWidget {
  // setState쓰면서 부터 StatefulWidget 사용
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _departureStation;
  String? _arrivalStation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Lang.train),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ), //AppBar를 사용하게 되면 SafeArea는 자동으로 잡아줌
      body: Container(
        color: Colors.grey[300],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Text(
                                      Lang.departure,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      _departureStation ?? Lang.select,
                                      style: TextStyle(fontSize: 40),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                              onTap: () async {
                                final selectedStation = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        StationListPage(title: Lang.departure),
                                  ),
                                );
                                if (selectedStation != null) {
                                  setState(() {
                                    _departureStation = selectedStation;
                                  });
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 80),
                            child: VerticalDivider(
                              color: Colors.grey[400],
                              thickness: 2,
                              width: 2,
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Text(
                                      Lang.arrival,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      _arrivalStation ?? Lang.select,
                                      style: TextStyle(fontSize: 40),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                              onTap: () async {
                                final selectedStation = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        StationListPage(title: Lang.arrival),
                                  ),
                                );
                                if (selectedStation != null) {
                                  setState(() {
                                    _arrivalStation = selectedStation;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  child: const Text(Lang.selectSeat),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
