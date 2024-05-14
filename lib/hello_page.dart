import 'package:flutter/material.dart';
import 'package:flutter_dapp/contract_linking.dart';
import 'package:provider/provider.dart';

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contractLink = Provider.of<ContractLinking>(context);

    final messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter dApp"),
      ),
      body: Center(
        child: contractLink.isLoading
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: [
                      Text("Welcome to Hello World dApp ${contractLink.deployedName}"),
                      TextFormField(
                        controller: messageController,
                        decoration: const InputDecoration(hintText: "Enter message"),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          contractLink.setMessage(messageController.text);
                          messageController.clear();
                        },
                        child: const Text("Set Message"),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
