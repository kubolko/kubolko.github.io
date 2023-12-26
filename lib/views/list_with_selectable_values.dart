import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jira_creator/views/probability_selector.dart';
import 'list_element.dart';

class JiraRow extends StatefulWidget {
  final String title;
  String randomisationType = 'Even';
  bool included = true;

  List<String> items;

  JiraRow({
    super.key,
    required this.items,
    required this.title,
    required this.randomisationType,
  });

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
    return widget.included
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.title != '')
                    SelectableText(
                      widget.title,
                      style: GoogleFonts.merienda(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  const SizedBox(width: 25),
                  //Add the button to remove the item
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.included = false;
                      });
                    },
                    child: Column(
                      children: [
                        Text("Remove?",
                            style: GoogleFonts.merienda(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            )),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF03045E), // Border color
                              width: 2.0, // Border width
                            ),
                          ),
                          child: Image.asset(
                            'assets/do_not_include.png',
                            fit: BoxFit.fitHeight,
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 125,
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        widget.items.length + 1, // +1 for the "Add" element
                    itemBuilder: (context, index) {
                      if (index == widget.items.length) {
                        // This is the last index, show the "Add" element
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              // Create a new list with the existing items and add a new element
                              widget.items = [...widget.items, 'Jira rocks'];
                            });
                          },
                          child: Container(
                            width: 150,
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'New one?',
                              style: GoogleFonts.getFont('Roboto Mono'),
                            ),
                          ),
                        );
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
                                List<String> updatedItems =
                                    List.from(widget.items)..removeAt(index);
                                widget.items = updatedItems;
                                print('After: ${widget.items}');
                              });
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              const ProbabilitySelector(),
            ],
          )
        : Container(); // Return an empty container if not included
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
