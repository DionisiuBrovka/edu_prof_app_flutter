import 'package:flutter/material.dart';

class WideTemplate extends StatelessWidget {
  final Widget? head;
  final Widget? headFixed;
  final Widget? body;
  final Widget? bodyNoList;

  const WideTemplate({
    super.key,
    this.head,
    this.headFixed,
    this.body,
    this.bodyNoList,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(top: headFixed == null ? 0 : 90),
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    head == null
                        ? const Center()
                        : SizedBox(
                            width: double.infinity,
                            height: 150,
                            child: head,
                          ),
                    SizedBox(
                      width: 850,
                      child: body,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 850,
            child: headFixed,
          ),
          bodyNoList == null
              ? const Center()
              : Padding(
                  padding: EdgeInsets.only(top: head == null ? 0 : 150),
                  child:
                      SizedBox(width: 850, child: bodyNoList ?? const Center()),
                ),
        ],
      ),
    );
  }
}
