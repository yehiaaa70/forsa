import 'package:flutter/material.dart';
import 'package:forsa/core/utils/app_colors.dart';

class EntryItem extends StatefulWidget {
  final String title;

  const EntryItem({super.key, required this.title});

  @override
  State<EntryItem> createState() => _EntryItemState();
}

class _EntryItemState extends State<EntryItem> {
  bool isTitle = false;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    title = widget.title;
  }

  String title = '';
  IconData icon = Icons.co_present;
  UniqueKey keyTile = UniqueKey();

  Widget? titleWidget;

  Widget _buildTiles() {
    // if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.white, width: 2)),
        child: ExpansionTile(
          // iconColor: AppColors.white,
          key: keyTile,
          backgroundColor: AppColors.white,
          collapsedBackgroundColor: AppColors.white,
          // textColor: AppColors.white,
          title: titleWidget == null
              ? Text(title)
              : Row(
                  children: [
                    Icon(icon),
                    Text(title),
                  ],
                ),
          children: [
            ...List.generate(
              5,
              (index) => ListTile(
                  title: Text(
                    'index$index',
                    style: TextStyle(
                      color: title == 'index$index'
                          ? AppColors.primary
                          : AppColors.black,
                      fontSize: title == 'index$index' ? 20 : 16,
                      fontWeight:
                          title == 'index$index' ? FontWeight.bold : null,
                    ),
                  ),
                  onTap: () {
                    isExpanded ? shrinkTile() : expandTile();
                    title = 'index$index';
                    setState(() {
                      isTitle = !isTitle;
                      title = 'index$index';
                    });
                  }),
            ),
          ],
          onExpansionChanged: (value) {
            setState(() {});
          },
        ),
      ),
    );
  }

  void expandTile() {
    setState(() {
      isExpanded = true;
      keyTile = UniqueKey();
    });
  }

  void shrinkTile() {
    setState(() {
      isExpanded = true;
      keyTile = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles();
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  const Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}
