import 'package:flutter/material.dart';

class TableComponent extends StatefulWidget {
  List<String> headers;
  List<List<String>> data;
  TableComponent({super.key, required this.headers, required this.data});

  @override
  State<TableComponent> createState() => _TableComponentState();
}

class _TableComponentState extends State<TableComponent> {
  @override
  Widget build(BuildContext context) {
    return createDataTable(widget.headers, widget.data);
  }
}

SingleChildScrollView createDataTable(
    List<String> headers, List<List<String>> data) {
  List<DataColumn> columnHeaders = [];
  List<DataRow> rows = [];

  for (String header in headers) {
    columnHeaders.add(DataColumn(label: Text(header)));
  }

  for (List<String> row in data) {
    DataRow dataRow = DataRow(cells: []);

    for (String cell in row) {
      DataCell dataCell = DataCell(Text(cell));
      dataRow.cells.add(dataCell);
    }

    rows.add(dataRow);
  }

  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: DataTable(
      columns: columnHeaders,
      rows: rows,
    ),
  );
}
