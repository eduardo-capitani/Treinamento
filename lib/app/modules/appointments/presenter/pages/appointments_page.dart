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
    var headers = [
      'Data de fundição',
      'Turno',
      'Nº Molde',
      'Modelo',
      'Cód. Defeito',
      'Macharia',
      'Ferramental',
      'Destino',
      'Ação'
    ];

    var data = AppointmentsStore.instance.value;

    List<TableRow> rows = data.map((item) {
      return TableRow(
        children: headers.map((header) {
          return Text(item.indexOf(header).toString());
        }).toList(),
      );
    }).toList();

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
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(1),
                  2: FixedColumnWidth(100),
                  // Adicione mais conforme necessário
                },
                border: TableBorder.all(color: Colors.black),
                children: rows,
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
