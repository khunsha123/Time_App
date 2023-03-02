import 'package:flutter/material.dart';
import 'package:app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'America/Argentina/Cordoba', location: 'Argentina', flag: 'argentina.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Australia/Lindeman', location: 'Australia', flag: 'australia.png'),
    WorldTime(url: 'Asia/Singapore', location: 'Canada', flag: 'canada.png'),
    WorldTime(url: 'Asia/Hong_Kong', location: 'China', flag: 'china.png'),
    WorldTime(url: 'Indian/Maldives', location: 'India', flag: 'india.png'),
    WorldTime(url: 'America/New_York', location: 'Iran', flag: 'iran.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Japan', flag: 'japan.png'),
    WorldTime(url: 'Asia/Riyadh', location: 'Saudi Arabia', flag: 'saudi_arabia.png'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore', flag: 'singapore.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
