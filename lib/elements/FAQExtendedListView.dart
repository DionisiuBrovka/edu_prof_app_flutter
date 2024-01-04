import 'package:edu_prof_app_flutter/models/FAQ.dart';
import 'package:flutter/material.dart';

class FAQExtendedListView extends StatefulWidget {
  const FAQExtendedListView({super.key, required this.FAQlist});

  final List<FAQ> FAQlist;

  @override
  State<FAQExtendedListView> createState() => _FAQExtendedListViewState();
}

class _FAQExtendedListViewState extends State<FAQExtendedListView> {
  _FAQExtendedListViewState();

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          widget.FAQlist[index].isExpanded = isExpanded;
        });
      },
      children: widget.FAQlist.map<ExpansionPanel>((FAQ faqItem) {
        return ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  faqItem.q ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              );
            },
            canTapOnHeader: true,
            body: Column(
              children: [
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(faqItem.a ?? ''),
                )
              ],
            ),
            isExpanded: faqItem.isExpanded);
      }).toList(),
    );
  }
}
