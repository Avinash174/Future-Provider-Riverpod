import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider_riverpod/future_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(title: Text('data')),
      body: Center(
        child: provider.when(
          data:
              (value) => ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Text(value[index].toString());
                },
              ),
          error: (error, stck) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
