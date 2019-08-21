import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application_state.dart';

class DisplayData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<ApplicationState>(context);
    final response = Provider.of<ApplicationState>(context).getResponseJson();
    return Container(
      padding: EdgeInsets.all(16),
      child: appState.isLoading
          ? CircularProgressIndicator()
          : appState.getResponseJson() != null
              ? ListView.builder(
                  itemCount: response.length,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(response[index]['avatar']),
                      ),
                      title: Text(response[index]['first_name']),
                      subtitle: Text(response[index]['last_name']),
                    );
                  },
                )
              : Center(
                  child: Text("Please press button to fetch data..."),
                ),
    );
  }
}
