import 'package:flutter/material.dart';
import 'if_include.dart';
import 'list_element.dart';

class JiraRow extends StatefulWidget {
  bool included = true;
  List<String> items;

  JiraRow({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  _JiraRowState createState() => _JiraRowState();
}

class _JiraRowState extends State<JiraRow> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            SelectableText(
              'Jira',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Merienda',
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            IfInclude(
              included: true,
              key: ValueKey('waaa'),
            ),
          ],
        ),
        SizedBox(
            height: 125,
            child: Center(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.items.length + 1, // +1 for the "Add" element
                itemBuilder: (context, index) {
                  if (index == widget.items.length) {
                    // This is the last index, show the "Add" element
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            // Add a new element with the text 'a' to the list
                            widget.items.add('Jira rocks');
                          });
                        },
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'New one?',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Merienda',
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ));
                  } else {
                    final String item = widget.items[index];
                    return Container(
                      width: 150,
                      padding: const EdgeInsets.all(8.0),
                      child: ListElement(
                        key: ValueKey(item),
                        text: item,
                        color: const Color(0xFF0077B6),
                        onPressed: () {},
                        onDelete: () {
                          setState(() {
                            print('Deleting $item');
                            print('Before: ${widget.items}');
                            List<String> updatedItems = List.from(widget.items)
                              ..removeAt(index);
                            widget.items = updatedItems;
                            print('After: ${widget.items}');
                          });
                        },
                      ),
                    );
                  }
                },
              ),
            ))
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
