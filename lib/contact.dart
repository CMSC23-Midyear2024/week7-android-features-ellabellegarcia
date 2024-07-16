import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactPage extends StatelessWidget {
  final Contact contact;
  ContactPage(this.contact, {super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(contact.displayName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('First name: ${contact.name.first}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Last name: ${contact.name.last}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Phone number: ${contact.phones.isNotEmpty ? contact.phones.first.number : '(none)'}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Email address: ${contact.emails.isNotEmpty ? contact.emails.first.address : '(none)'}'),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                FlutterContacts.deleteContact(contact).then((_) {
                  Navigator.pop(context);
                });
              },
              child: const Text('Delete Contact'),
            ),
          )
        ]),
      ));
}
