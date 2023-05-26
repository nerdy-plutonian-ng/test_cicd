import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_state.dart';

class CredentialSheet extends StatelessWidget {
  const CredentialSheet({Key? key, this.index}) : super(key: key);

  final int? index;

  @override
  Widget build(BuildContext context) {
    final state = context.read<HomeState>();
    final credential = index == null ? null : state.credentials[index!];
    if (credential != null) {
      state.setWorkingCredential(credential);
    }

    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${index == null ? 'Add New' : 'Edit'} Password',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            TextField(
              controller: TextEditingController(text: credential?.site),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Site',
              ),
              onChanged: (site) => state.setSite(site),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: TextEditingController(text: credential?.username),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
              onChanged: (username) => state.setUsername(username),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: TextEditingController(text: credential?.password),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              onChanged: (password) => state.setPassword(password),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                if (index == null) {
                  if (state.addCredential()) {
                    Navigator.pop(context);
                  }
                } else {
                  if (state.updateCredential(index!)) {
                    Navigator.pop(context);
                  }
                }
              },
              child: Text(index == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
