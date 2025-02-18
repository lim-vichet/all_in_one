

import 'package:flutter/material.dart';

class TestListPagenation extends StatefulWidget {
  const TestListPagenation({Key? key}) : super(key: key);

  @override
  State<TestListPagenation> createState() => _TestListPagenationState();
}

class _TestListPagenationState extends State<TestListPagenation> {

  final ScrollController _scrollController = ScrollController();
  List<String> _data = [];
  bool _isLoading = false;
  int _currentPage = 1;
  final int _pageSize = 20;

  @override
  void initState() {
    super.initState();
    _loadData();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isLoading) {
      // If the user has reached the bottom and not already loading
      _loadData();
    }
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate a network call with a delay
    await Future.delayed(Duration(seconds: 2));

    // Simulating data fetching, incrementing by 20 items per page
    List<String> newData = List.generate(
      _pageSize,
          (index) => 'Item ${(index + 1) + (_currentPage - 1) * _pageSize}',
    );

    setState(() {
      _currentPage++;
      _data.addAll(newData);
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Paginated List')),
        body: ListView.builder(
          controller: _scrollController,
          itemCount: _data.length + (_isLoading ? 1 : 0), // Add one more item for loading indicator
          itemBuilder: (context, index) {
            if (index == _data.length) {
              // Loading indicator
              return Center(child: CircularProgressIndicator());
            }
            return ListTile(
              title: Text(_data[index]),
            );
          },
        )
    );
  }
}
