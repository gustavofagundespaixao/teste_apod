import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tela de gerenciamento de erros',
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 24,
              children: [
                const Icon(
                  // Icons.mood_bad,
                  Icons.error,
                  color: Colors.red,
                  size: 100,
                ),
                const Text(
                  'Ocorreu um erro.\nTente acessar o aplicativo mais tarde, ou clique no botão abaixa para recarregar',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: () {
                    Restart.restartApp();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade100,
                    foregroundColor: Colors.red.shade900,
                  ),
                  child: const Text('Recarregar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
