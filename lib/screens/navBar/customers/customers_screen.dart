import 'package:document_analyzer/data/leads_dummy_data.dart';
import 'package:document_analyzer/screens/navBar/customers/widgets/widget.dart';
import 'package:document_analyzer/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomersPage extends StatefulWidget {
  final Widget child;

  const CustomersPage({super.key, required this.child});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  late TextEditingController _searchTextEditingController;

  @override
  void initState() {
    super.initState();

    _searchTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const HeaderUI(),
        const SizedBox(height: 24.0),
        _buildSubHeaderWithSearchUI(),
        const SizedBox(height: 24.0),
        // added Expanded() Widget to expand the List UI
        const Expanded(child: LeadsDetailsListUI(leads: dummyLeads))
      ],
    );
  }

  Padding _buildSubHeaderWithSearchUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppStrings.newLeads,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            width: 400,
            child: TextField(
              controller: _searchTextEditingController,
              decoration: InputDecoration(
                hintText: AppStrings.searchLeads,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: AppColors.grey400),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: AppColors.blue),
                ),
                prefixIcon: Icon(Icons.search, color: AppColors.grey500),
              ),
              style: const TextStyle(fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}
