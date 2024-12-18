import 'package:flutter/material.dart';

class AppEmptyWidget extends StatelessWidget {
  const AppEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text('Nenhum registro encontrado'),
      ),
    );
  }
}
