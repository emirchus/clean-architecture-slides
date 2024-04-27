List<String> kAbstractionCodes = const [
  """
import 'package:flutter/material.dart';
import 'package:flutter_counter_app/presentation/screen/home_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
""",
  """
class Injector extends StatefulWidget {
  const Injector({super.key});

  @override
  State<Injector> createState() => _InjectorState();
}

class _InjectorState extends State<Injector> {
  late final OperationsRepository _operationsRepository;
  late final ExecuteOperations<num> _executeOperations;
  @override
  void initState() {
    _operationsRepository = OperationRepositoryImpl();
    _executeOperations = ExecuteOperationsImpl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CalculatorNotifier(
      notifier: CalculatorInheritNotifierImpl(operationsRepository: _operationsRepository, executeOperatons: _executeOperations),
      child: const Application(),
    );
  }
}
""",
  """
class CalculatorInheritNotifierImpl extends ChangeNotifier {
  final OperationsRepository _operationsRepository;
  final ExecuteOperations<num> _executeOperations;

  CalculatorInheritNotifierImpl({ required OperationsRepository operationsRepository, required ExecuteOperations<num> executeOperatons })
      : _operationsRepository = operationsRepository,
        _executeOperations = executeOperatons;

  static CalculatorInheritNotifierImpl of(BuildContext context) => (context.dependOnInheritedWidgetOfExactType<CalculatorNotifier>())!.notifier!;

  void addOperation(Operation operation) => _operationsRepository.addOperation(operation);

  List<Operation> getOperations() => _operationsRepository.getOperations();

  void clearOperations() => _operationsRepository.clearOperations();

  num executeAllOperations() => _executeOperations.executeAllOperations(_operationsRepository.getOperations());

  void notify() {
    notifyListeners();
  }
}
""",
  """
import 'package:flutter_counter_app/domain/abstracts/operation.dart';
import 'package:flutter_counter_app/domain/entities/operation_result.dart';
import 'package:flutter_counter_app/domain/repositories/operations_repository.dart';

class OperationRepositoryImpl extends OperationsRepository {
  final List<Operation> _operations = [];

  @override
  void addOperation(Operation operation) {
    _operations.add(operation);
  }

  @override
  List<Operation> getOperations() {
    return _operations;
  }

  @override
  void clearOperations() {
    _operations.clear();
  }
}

""",
  """
import 'package:flutter_counter_app/domain/abstracts/operation.dart';
import 'package:flutter_counter_app/domain/enums/operations.dart';

class SumOperation extends Operation<num> {
  final num _firstNumber;
  final num _secondNumber;

  SumOperation(this._firstNumber, this._secondNumber);

  @override
  num execute() {
    return _firstNumber + _secondNumber;
  }

  @override
  OperationType get type => OperationType.plus;
}

"""
];
