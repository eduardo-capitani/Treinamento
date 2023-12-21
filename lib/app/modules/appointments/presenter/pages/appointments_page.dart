import 'package:flutter/material.dart';
import 'package:treinamento/app/modules/appointments/presenter/store/appointments_store.dart';
import 'package:tupy_framework/ui.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({Key? key}) : super(key: key);

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  @override
  void initState() {
    super.initState();

    AppointmentsStore.instance.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apontamentos'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 23.0,
            ),
            child: ValueListenableBuilder(
              valueListenable: AppointmentsStore.instance,
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1),
                  5: FlexColumnWidth(1),

                  // Defina a largura para mais colunas conforme necessário
                },
                children: const [
                  TableRow(
                    children: [
                      Text('Data de fundição'),
                      Text('Turno'),
                      Text('Nº Molde'),
                      Text('Modelo'),
                      Text('Cód. Defeito'),
                      Text('Macharia'),

                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Valor 1'),
                      Text('Valor 2'),
                      Text('Valor 3'),
                      Text('Valor 1'),
                      Text('Valor 2'),
                      Text('Valor 3'),

                    ],
                  ),
                  // Adicione mais TableRow para cada linha de dados
                ],
              ),
              builder: (context, value, child) {
                return child!;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 189,
                  child: ElevatedButtonWidget(
                    label: 'Adicionar',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/note_record');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
