import 'package:flutter/material.dart';
import 'package:jinchanchan/page/sort/sort_logic.dart';

class SortPage extends StatefulWidget {
  const SortPage({super.key});

  @override
  State<SortPage> createState() => _SortPageState();
}

class _SortPageState extends State<SortPage> with SortLogic {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
