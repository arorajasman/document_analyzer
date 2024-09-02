import 'package:document_analyzer/screens/navBar/customers/call_customer_screen.dart';
import 'package:document_analyzer/screens/navBar/customers/customers_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ActionsPopupMenuUI extends StatefulWidget {
  const ActionsPopupMenuUI({super.key});

  @override
  State<ActionsPopupMenuUI> createState() => _ActionsPopupMenuUIState();
}

class _ActionsPopupMenuUIState extends State<ActionsPopupMenuUI> {
  void _onMenuItemPressed(int index, String title) {
    if (index == 3 && title == "Call Now") {
      // Navigator.of(context).push(
      //   MaterialPageRoute<void>(
      //     builder: (BuildContext context) => const CallCustomerPage(),
      //   ),
      // );

      context.pushNamed("call-customer");
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [..._buildActionsList()],
      offset: const Offset(0, 50),
      color: Colors.grey,
      elevation: 2,
    );
  }

  List<PopupMenuEntry<int>> _buildActionsList() {
    const List<String> actionsList = [
      "Mark as Contacted",
      "Mark as DeadLead",
      "Edit",
      "Call Now",
      "Schedule a call",
      "Send an Email",
    ];
    return actionsList.asMap().entries.map((entry) {
      int index = entry.key;
      String action = entry.value;
      return _buildActionTileUI(index, action);
    }).toList();
  }

  PopupMenuItem<int> _buildActionTileUI(int value, String title) {
    return PopupMenuItem(
      value: value,
      child: SizedBox(
        width: 200, // Optional: set a width to make the items more consistent
        child: Text(title),
      ),
      onTap: () => _onMenuItemPressed(value, title),
    );
  }
}
