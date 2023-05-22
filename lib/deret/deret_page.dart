import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/deret_bloc.dart';
import 'bloc/deret_event.dart';
import 'bloc/deret_state.dart';

class DeretPage extends StatefulWidget {
  const DeretPage({Key? key}) : super(key: key);

  @override
  State<DeretPage> createState() => _DeretPageState();
}

class _DeretPageState extends State<DeretPage> {
  TextEditingController numberController = TextEditingController();

  var result = "";

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeretBloc, DeretState>(
      listener: (context, state) {
        if(state is DeretLoading) {

        } else if(state is DeretSuccess) {
          setState(() {
            result = "";
            result = state.looping.join(" ").toString();
          });
        }
      },
      child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Input N'
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if(numberController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Input tidak boleh kosong')));
                            } else {
                              context.read<DeretBloc>().add(ButtonOneClicked(number: int.parse(numberController.text)));
                            }
                          },
                          child: const Text('1')
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              if(numberController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Input tidak boleh kosong')));
                              } else {
                                context.read<DeretBloc>().add(ButtonTwoClicked(number: int.parse(numberController.text)));
                              }
                            },
                          child: const Text('2')
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              if(numberController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Input tidak boleh kosong')));
                              } else {
                                context.read<DeretBloc>().add(ButtonThreeClicked(number: int.parse(numberController.text)));
                              }
                            },
                          child: const Text('3')
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              if(numberController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Input tidak boleh kosong')));
                              } else {
                                context.read<DeretBloc>().add(ButtonFourClicked(number: int.parse(numberController.text)));
                              }
                            },
                          child: const Text('4')
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text('Result'),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    child: Text(result, style: const TextStyle(fontSize: 30),)
                  )
                ],
              ),
            )
          ),
        ),
    );
  }
}
