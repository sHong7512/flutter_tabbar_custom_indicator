import 'dart:developer';

import 'package:flutter/material.dart';

import 'size_indicator.dart';
import 'dot_indicator.dart';

void main() {
  runApp(const MaterialApp(home: HomeScreen()));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final List<String> _tabList = ['first', 'second', 'third'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                isScrollable: true,
                onTap: (page) {
                  log('page (width) :: $page');
                },
                indicator: const SizeIndicator(
                  width: 40,
                  height: 3,
                  color: Colors.yellow,
                ),
                splashFactory: NoSplash.splashFactory,
                tabs: _tabList
                    .map(
                      (e) => Tab(
                        child: Text(
                          e,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 30),
              TabBar(
                controller: _tabController,
                isScrollable: true,
                onTap: (page) {
                  log('page (dot) :: $page');
                },
                indicator: const DotIndicator(color: Colors.red),
                splashFactory: NoSplash.splashFactory,
                tabs: _tabList
                    .map(
                      (e) => Tab(
                        child: Text(
                          e,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
