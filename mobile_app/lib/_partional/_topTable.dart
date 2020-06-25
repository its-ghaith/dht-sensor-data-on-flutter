import 'package:flutter/material.dart';
import 'package:mobile_app/_partional/_disconnect_iconButton.dart';
import 'package:mobile_app/constants.dart';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:async';
import 'dart:io';
import '_custom_text_field.dart';
import '_connect_iconButton.dart';
import '_on_off_led_IconButton.dart';

class TopTable extends StatefulWidget {
  @override
  _TopTableState createState() => _TopTableState();
}

class _TopTableState extends State<TopTable> {
  @override
  Widget build(BuildContext context) {
    CustomTextField t1 = CustomTextField(hint: "sub. Topic Wemos 1");
    CustomTextField t2 = CustomTextField(hint: "pub. Topic Wemos 1");
    CustomTextField t3 = CustomTextField(hint: "sub. Topic Wemos 2");
    CustomTextField t4 = CustomTextField(hint: "pub. Topic Wemos 2");
    return Table(children: [
      TableRow(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              t1,
              t2,
              t3,
              t4,
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConnectIconButton(
                        controller: t1.textController,
                        isSubscribe: true,
                      ),
                      ConnectIconButton(
                        controller: t2.textController,
                        isSubscribe: false,

                      ),
                      ConnectIconButton(
                        controller: t3.textController,
                        isSubscribe: true,
                      ),
                      ConnectIconButton(
                        controller: t4.textController,
                        isSubscribe: false,

                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DisconnectIconButton(
                        type: false,
                      ),
                      DisconnectIconButton(
                        type: true,
                      ),
                      DisconnectIconButton(
                        type: false,

                      ),
                      DisconnectIconButton(
                        type: true,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OnOffLedIconButton(),
                        OnOffLedIconButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      )
    ]);
  }
}
