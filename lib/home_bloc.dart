import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';
import 'package:search_app_bar/searcher.dart';

class HomeBloc extends BlocBase implements Searcher<String> {
  final _filteredData = BehaviorSubject<List<String>>();

  final dataList = [
    'Water',
    'Flour',
    'Eggs',
    'Bicycle',
    'Broom',
    'Shoes',
    'Gloves'
  ];

  Stream<List<String>> get filteredData => _filteredData.stream;

  HomeBloc() {
    _filteredData.add(dataList);
  }

  @override
  get onDataFiltered => _filteredData.add;

  @override
  get data => dataList;

  @override
  void dispose() {
    _filteredData.close();
    super.dispose();
  }
}
