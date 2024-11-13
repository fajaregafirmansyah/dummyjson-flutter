import 'package:dummyjson/model/user_model.dart';
import 'package:flutter/material.dart';

import 'repository/data_repository.dart';

class ListScreen extends StatefulWidget {
  @override
  _listScreenState createState() => _listScreenState();
}

class _listScreenState extends State<ListScreen> {
  late Future<List<Datum>> futureKasus;

  @override
  void initState() {
    super.initState();
    futureKasus = fetchKasus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Kasus Korupsi")),
      body: FutureBuilder<List<Datum>>(
        future: futureKasus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Data tidak tersedia'));
          } else {
            final ListScreen = snapshot.data!;
            return ListView.builder(
              itemCount: ListScreen.length,
              itemBuilder: (context, index) {
                final kasus = ListScreen[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=${index + 1}',
                    ),
                  ),
                  title: Text(kasus.nama ?? ''),
                  subtitle: Text("${kasus.jabatan} - ${kasus.kasus}"),
                  onTap: () {},
                );
              },
            );
          }
        },
      ),
    );
  }
}
