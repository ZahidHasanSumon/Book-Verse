import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class InternetCheck extends StatefulWidget {
  final Widget child;

  const InternetCheck({super.key, required this.child});

  @override
  State<InternetCheck> createState() => _InternetCheckState();
}

class _InternetCheckState extends State<InternetCheck> {
  late Connectivity _connectivity;
  late bool _isConnected;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _connectivity = Connectivity();
    _isConnected = true; // Default to true
    _initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      setState(() {
        _isConnected = (result != ConnectivityResult.none);
      });
    });
  }

  Future<void> _initConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      setState(() {
        _isConnected = (result != ConnectivityResult.none);
      });
    } catch (e) {
      Center(child: Text("Error: $e"));
    }
  }


  Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }


  @override
  Widget build(BuildContext context) {
    return _isConnected ? widget.child : _buildNoInternetWidget();
  }

  Widget _buildNoInternetWidget() {
    return const Scaffold(
      body: Center(
        child: Text(
          'No internet connection',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
