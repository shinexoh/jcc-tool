import 'package:flutter/material.dart';
import 'package:jinchanchan/page/index/index_logic.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with IndexLogic {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
