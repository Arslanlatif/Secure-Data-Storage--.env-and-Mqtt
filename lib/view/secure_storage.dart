import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage extends StatefulWidget {
  const SecureStorage({super.key});

  @override
  State<SecureStorage> createState() => _SecureStorageState();
}

class _SecureStorageState extends State<SecureStorage> {
  late final FlutterSecureStorage storage;
  String? secretData;

// To save the data in the secure storage, use the write method.
  Future<void> _saveData() async {
    try {
      await storage.write(key: 'secret_key', value: 'senstive_data');
    } catch (e) {
      rethrow;
    }
  }

// to fetch the data from the secure storage, use the read method.
  Future<void> _fetchData() async {
    try {
      String? data = await storage.read(key: 'secret_key');

// save the data in the secretData variable
      setState(() {
        secretData = data;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
    storage = const FlutterSecureStorage();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Secure Data Storage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _saveData().then((value) => ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(
                        content: Text('Data saved successfully'))));
              },
              child: const Text('Save Data'),
            ),
            SizedBox(height: height * 0.05),
            ElevatedButton(
              onPressed: _fetchData,
              child: const Text('Fetch Data'),
            ),
            SizedBox(height: height * 0.05),
            secretData != null
                ? Text(
                    'Secret Data: $secretData',
                    style: const TextStyle(fontSize: 18),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
