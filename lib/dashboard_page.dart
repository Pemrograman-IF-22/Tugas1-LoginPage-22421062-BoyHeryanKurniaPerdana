import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final String email;
  final String password;

  const DashboardPage({
    super.key,
    required this.email,
    required this.password
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Halo, : $email'),
      ),
    );
  }
}