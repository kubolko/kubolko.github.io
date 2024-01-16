import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jira_creator/viewModels/app_provider.dart';
import 'package:jira_creator/views/menu_background_element.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class GenerateBacklogButton extends StatefulWidget {
  final AppProvider provider;
  final Color backgroundColorOfPreviousElement;
  final Color overlayColorOfPreviousElement;

  const GenerateBacklogButton({
    super.key,
    required this.provider,
    required this.backgroundColorOfPreviousElement,
    required this.overlayColorOfPreviousElement,
  });

  @override
  _GenerateBacklogButtonState createState() => _GenerateBacklogButtonState();
}

class _GenerateBacklogButtonState extends State<GenerateBacklogButton> {
  final TextEditingController _rowsAmountController =
      TextEditingController(text: '100');
  final TextEditingController _startingIssueIDController =
      TextEditingController(text: '50');

  @override
  void dispose() {
    _rowsAmountController.dispose();
    _startingIssueIDController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWithCircles(
        backgroundColor: widget.overlayColorOfPreviousElement,
        overlayColor: widget.backgroundColorOfPreviousElement,
        child: Center(
            child: ConstrainedBox(
                constraints:
                    const BoxConstraints(maxWidth: 800), // Limit the width
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  // Optional padding for aesthetics
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // Align content to the start
                    children: [
                      const SizedBox(height: 25),
                      Text('Some Information',
                          style: GoogleFonts.getFont('Roboto Mono',
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      const Text(
                          "- The row with the Issue ID is sequential (1, 2, 3...)"),
                      SelectableLinkify(
                        text:
                            "- Not sure what to do next? Here is the official guide \n https://support.atlassian.com/jira-cloud-administration/docs/import-data-from-a-csv-file/",
                        onOpen: (link) async {
                          if (await canLaunchUrl(Uri.parse(link.url))) {
                            await launchUrl(Uri.parse(link.url));
                          } else {
                            throw 'Could not launch $link';
                          }
                        },
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('From which number should the Issue Id start?',
                              style: GoogleFonts.getFont('Roboto Mono')),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 200,
                            child: TextField(
                              controller: _rowsAmountController,
                              style: GoogleFonts.getFont('Roboto Mono',
                                  fontSize: 18),
                              decoration: const InputDecoration(
                                hintText: 'Enter number',
                                hintStyle: TextStyle(color: Colors.white54),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('How many rows would you like?',
                              style: GoogleFonts.getFont('Roboto Mono')),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 200,
                            child: TextField(
                              controller: _startingIssueIDController,
                              style: GoogleFonts.getFont('Roboto Mono',
                                  fontSize: 18),
                              decoration: const InputDecoration(
                                hintText: 'Enter number of rows',
                                hintStyle: TextStyle(color: Colors.white54),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      InkWell(
                        onTap: () {
                          int rowCount =
                              int.tryParse(_rowsAmountController.text) ?? 0;
                          int startingIssueID =
                              int.tryParse(_startingIssueIDController.text) ??
                                  0;
                          widget.provider.generateBacklogWithPredefinedElements(
                              rowCount, startingIssueID);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          color: const Color(0xff03045E),
                          child: Center(
                            child: Image.asset(
                              'assets/generate_backlog.png',
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
