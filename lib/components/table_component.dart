import 'package:flutter/material.dart';

class TableComponent extends StatefulWidget {
  List<String> headers;
  List<List<String>> data;
  Function rowClickCallback;
  TableComponent(
      {super.key,
      required this.headers,
      required this.data,
      required this.rowClickCallback});

  @override
  State<TableComponent> createState() => _TableComponentState();
}

class _TableComponentState extends State<TableComponent> {
  @override
  Widget build(BuildContext context) {
    return createDataTable(
        widget.headers, widget.data, widget.rowClickCallback);
  }
}

SingleChildScrollView createDataTable(
    List<String> headers, List<List<String>> data, Function clickEvent) {
  List<DataColumn> columnHeaders = [];
  List<DataRow> rows = [];

  for (String header in headers) {
    columnHeaders.add(DataColumn(label: Text(header)));
  }

  for (List<String> row in data) {
    DataRow dataRow = DataRow(
        onSelectChanged: (value) {
          clickEvent(row);
        },
        cells: []);

    for (String cell in row) {
      DataCell dataCell = DataCell(Text(cell));
      dataRow.cells.add(dataCell);
    }

    rows.add(dataRow);
  }

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        showCheckboxColumn: false,
        columns: columnHeaders,
        rows: rows,
      ),
    ),
  );
}
