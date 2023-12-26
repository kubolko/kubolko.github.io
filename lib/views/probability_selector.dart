import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProbabilitySelector extends StatefulWidget {
  const ProbabilitySelector({super.key});

  @override
  _ProbabilitySelectorState createState() => _ProbabilitySelectorState();
}

class _ProbabilitySelectorState extends State<ProbabilitySelector> {
  String probabilityType = 'evenly';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("How to select the elements?"),
        SizedBox(
          height: 110,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ChoiceCard(
                icon: '🗿',
                label: 'evenly',
                isSelected: probabilityType == 'evenly',
                onTap: () {
                  setState(() {
                    probabilityType = 'evenly';
                  });
                },
              ),
              ChoiceCard(
                icon: '🙏',
                label: 'normal \n (gaussian)',
                isSelected: probabilityType == 'normal',
                onTap: () {
                  setState(() {
                    probabilityType = 'normal';
                  });
                },
              ),
              ChoiceCard(
                icon: '🔝',
                label: 'rising',
                isSelected: probabilityType == 'rising',
                onTap: () {
                  setState(() {
                    probabilityType = 'rising';
                  });
                },
              ),
              ChoiceCard(
                icon: '📉',
                label: 'descending',
                isSelected: probabilityType == 'descending',
                onTap: () {
                  setState(() {
                    probabilityType = 'descending';
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChoiceCard extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const ChoiceCard({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? const Color(0xff03045E) : Colors.transparent,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0), // Set border radius here
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              icon,
              style: GoogleFonts.merienda(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4.0),
            Text(
              label,
              style: GoogleFonts.merienda(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
