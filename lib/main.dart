import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './my_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final myProvider = Provider((ref) => 20);
final secondProvider = Provider((ref) => 'Hey I am a provider');

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  final int someNumber = 22;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int myNumber = ref.watch(myProvider);
    String myString = ref.watch(secondProvider);
    int mySecondNumber = ref.watch(thirdProvider);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Some thing $mySecondNumber'),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                print('yo!');
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
