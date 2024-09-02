import 'package:document_analyzer/models/models.dart';
import 'package:document_analyzer/screens/navBar/customers/widgets/widget.dart';
import 'package:document_analyzer/utils/utils.dart';
import 'package:flutter/material.dart';

class LeadsDetailsListUI extends StatefulWidget {
  final List<Leads> leads;

  const LeadsDetailsListUI({
    super.key,
    required this.leads,
  });

  @override
  State<LeadsDetailsListUI> createState() => _LeadsDetailsListUIState();
}

class _LeadsDetailsListUIState extends State<LeadsDetailsListUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.all(20.0),
      child: Table(
        border: TableBorder.symmetric(
          inside: BorderSide(
            width: 1,
            color: AppColors.grey400,
            style: BorderStyle.solid,
          ),
        ),
        columnWidths: const {
          0: FixedColumnWidth(80), // SL No
          1: FixedColumnWidth(80), // Actions
          // The rest of the columns can have a proportional width
        },
        children: [
          _buildTableHeaderUI(),
          ..._buildTableBodyUI(),
        ],
      ),
    );
  }

  TableRow _buildTableHeaderUI() {
    List<String> tableHeaders = [
      'SL No',
      'Actions',
      'Lead Name',
      'Lead Source',
      'Lead Status',
      'Contact Information',
      'Mark as contacted',
      'Notes',
    ];
    return TableRow(
      children: tableHeaders
          .map(
            (header) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                header,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  fontSize: 14.0,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  List<TableRow> _buildTableBodyUI() {
    return widget.leads.asMap().entries.map(
      (entry) {
        int index = entry.key;
        Leads lead = entry.value;
        return TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text((index + 1).toString()),
            ),
            const ActionsPopupMenuUI(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                lead.leadName,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                lead.leadSource,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                lead.leadStatus,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                lead.contactInfo,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Checkbox(
                value: lead.contacted,
                onChanged: (bool? value) {
                  // Handle checkbox change
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                lead.notes,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
    ).toList();
  }
}
