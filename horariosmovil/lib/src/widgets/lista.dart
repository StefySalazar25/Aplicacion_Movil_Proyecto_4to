import 'package:flutter/material.dart';

class PaginationExample extends StatefulWidget {
  @override
  _PaginationExampleState createState() => _PaginationExampleState();
}

class _PaginationExampleState extends State<PaginationExample> {
  ScrollController _scrollController = ScrollController();
  List<int> _data = List.generate(50, (index) => index + 1);
  bool _isLoading = false;
  int _pageNumber = 1;
  int _pageSize = 10;
  
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreData();
    }
  }

  Future<void> _loadMoreData() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      // Simular una llamada a la API para obtener más datos
      await Future.delayed(Duration(seconds: 2));

      setState(() {
        _isLoading = false;
        _pageNumber++;
        _data.addAll(List.generate(_pageSize, (index) => index + (_pageNumber * _pageSize) + 1));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo de Paginación'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _data.length + 1,
        itemBuilder: (context, index) {
          if (index < _data.length) {
            return ListTile(
              title: Text('Elemento ${_data[index]}'),
            );
          } else {
            return _buildLoader();
          }
        },
      ),
    );
  }

  Widget _buildLoader() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

