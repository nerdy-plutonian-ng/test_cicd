import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:password_manager/ui/screens/home/credential_sheet.dart';
import 'package:password_manager/ui/screens/home/home_state.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  showSheet(BuildContext context, int? index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => CredentialSheet(index: index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('Your Passwords')),
      body: Consumer<HomeState>(
        builder: (_, state, __) => state.credentials.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('You have not saved any password yet'),
              )
            : ListView.separated(
                reverse: true,
                itemCount: state.credentials.length,
                itemBuilder: (_, index) => Dismissible(
                  key: Key(state.credentials[index].site),
                  onDismissed: (_) => state.removeCredential(index),
                  background: Container(
                    color: Theme.of(context).colorScheme.error,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Icon(
                            Icons.delete,
                            color: Theme.of(context).colorScheme.onError,
                          ),
                        ),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () => showSheet(context, index),
                      title: Text(state.credentials[index].site)
                          .animate()
                          .rotate(),
                      subtitle: Text(state.credentials[index].username),
                    ),
                  ),
                ),
                separatorBuilder: (_, __) => Divider(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showSheet(context, null),
        icon: const Icon(Icons.text_snippet_rounded),
        label: const Text('Start chat'),
      ),
    );
  }
}
