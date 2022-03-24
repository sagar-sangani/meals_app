import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen({
    this.saveFilters,
    this.currentFilters,
  });

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['Gluten'];
    _vegan = widget.currentFilters['Vegan'];
    _vegetarian = widget.currentFilters['Vegetarian'];
    _lactoseFree = widget.currentFilters['Lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile({
    String title,
    String subTitle,
    bool currentValue,
    Function updatedValue,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue == true,
      onChanged: updatedValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Filters',
        ),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilter = {
                'Gluten': _glutenFree,
                'Vegetarian': _vegetarian,
                'Vegan': _vegan,
                'Lactose': _lactoseFree,
              };
              widget.saveFilters(selectedFilter);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  title: 'Gluten-Free',
                  subTitle: 'Only for the gluten free meals',
                  currentValue: _glutenFree,
                  updatedValue: (newvalue) {
                    setState(() {
                      _glutenFree = newvalue;
                    });
                  },
                ),
                Divider(),
                _buildSwitchListTile(
                  title: 'Vegetarian',
                  subTitle: 'Only for vegetarian meals',
                  currentValue: _vegetarian,
                  updatedValue: (newvalue) {
                    setState(() {
                      _vegetarian = newvalue;
                    });
                  },
                ),
                Divider(),
                _buildSwitchListTile(
                  title: 'Vegan',
                  subTitle: 'Only for vegan meals',
                  currentValue: _vegan,
                  updatedValue: (newvalue) {
                    setState(() {
                      _vegan = newvalue;
                    });
                  },
                ),
                Divider(),
                _buildSwitchListTile(
                  title: 'Lactose-free',
                  subTitle: 'Only for lactose free meals',
                  currentValue: _lactoseFree,
                  updatedValue: (newvalue) {
                    setState(() {
                      _lactoseFree = newvalue;
                    });
                  },
                ),
                Divider(),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
