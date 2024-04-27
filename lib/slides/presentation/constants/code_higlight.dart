List<String> kAbstractionCodes = const [
  """
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.calculate_outlined),
              ),
              Tab(
                icon: Icon(Icons.history_toggle_off_rounded),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MathForm(),
            HistoryPage(),
          ],
        ),
      ),
    );
  }
}
""",
  """
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    CalculatorInheritNotifierImpl calc = CalculatorInheritNotifierImpl.of(context);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 500,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: calc.getResults().length,
              itemBuilder: (BuildContext context, int index) {
                OperationResult operationResult = calc.getResults()[index];
                return Card(
                  child: ListTile(
                    ...
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
""",
  """
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;

  const InputWidget({
    super.key,
    required this.controller,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration:  InputDecoration(
        labelText: placeholder,
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      controller: controller,
    );
  }
}
""",
];
