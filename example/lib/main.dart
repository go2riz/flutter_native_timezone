import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TimezonePage(),
    );
  }
}

class TimezonePage extends StatefulWidget {
  const TimezonePage({super.key});

  @override
  State<TimezonePage> createState() => _TimezonePageState();
}

class _TimezonePageState extends State<TimezonePage> {
  String _timezone = 'Unknown';
  List<String> _availableTimezones = <String>[];

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    try {
      final timezone = await FlutterNativeTimezone.getLocalTimezone();
      final availableTimezones =
          await FlutterNativeTimezone.getAvailableTimezones();
      availableTimezones.sort();

      if (!mounted) {
        return;
      }

      setState(() {
        _timezone = timezone;
        _availableTimezones = availableTimezones;
      });
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _timezone = 'Failed to get timezone';
        _availableTimezones = <String>[];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local timezone app'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Local timezone: $_timezone'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Available timezones:'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _availableTimezones.length,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(_availableTimezones[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
