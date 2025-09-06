import 'package:flutter/material.dart';
import 'update_service.dart';

void main() {
  runApp(const MaterialApp(home: HomePlaceholder()));
}

class HomePlaceholder extends StatefulWidget {
  const HomePlaceholder({Key? key}) : super(key: key);
  @override
  State<HomePlaceholder> createState() => _HomePlaceholderState();
}

class _HomePlaceholderState extends State<HomePlaceholder> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UpdateService.checkForUpdate(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ANT — Placeholder')),
      body: const Center(child: Text('ANT Project with auto-update + Firebase placeholders.')),
    );
  }
}
