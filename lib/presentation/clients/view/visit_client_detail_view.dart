import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../gen/assets.gen.dart';
import '../../design_system/components/button.dart';
import '../../design_system/components/input.dart';
import '../../design_system/components/snack_bar.dart';
import '../../design_system/tokens/colors.dart';
import 'visit_save.dart';
import 'package:intl/intl.dart';

class VisitClientDetailView extends StatefulWidget {
  const VisitClientDetailView({Key? key}) : super(key: key);

  @override
  State<VisitClientDetailView> createState() => _VisitClientDetailViewState();
}

class _VisitClientDetailViewState extends State<VisitClientDetailView> {
  final TextEditingController _searchController = TextEditingController();
  String? _selectedClientId;
  bool _showVisitDetail = false;
  String? _selectedVisitId;

  @override
  void initState() {
    super.initState();
    _loadClientsFromStorage();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Mock data
  List<Map<String, dynamic>> _allClients = [];

  Map<String, dynamic>? get selectedClient =>
      _allClients.firstWhere((c) => c["id"] == _selectedClientId);

  Map<String, dynamic>? get selectedVisit =>
      selectedClient?["visitas"].firstWhere((v) => v["id"] == _selectedVisitId);

  Future<void> _loadClientsFromStorage() async {
    final visits = await VisitLocalStorage.getVisits();

    final Map<String, Map<String, dynamic>> grouped = {};

    for (final v in visits) {
      final cliente = v["cliente"];
      final id = cliente["id"];

      if (!grouped.containsKey(id)) {
        grouped[id] = {...cliente, "visitas": []};
      }

      grouped[id]!["visitas"].add({
        "id": v["id"] ?? "",
        "fecha": v["fecha_hora"] ?? "",
        "observaciones": v["observaciones"] ?? "",
        "vendedor": v["vendedor"] ?? "",
      });
    }

    setState(() {
      _allClients = grouped.values.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.images.medisupplyLogoImage.image(
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 16),
                  Text('Detalle de visita a un cliente'),
                  const SizedBox(height: 16),

                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Buscar por nombre o ID',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),

                  Expanded(
                    child: _selectedClientId == null
                        ? _buildClientList()
                        : _buildVisitsList(),
                  ),

                  if (_showVisitDetail)
                    Positioned.fill(
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 32,
                        ),
                        child: SingleChildScrollView(
                          child: _buildVisitDetailView(),
                        ),
                      ),
                    ),
                ],
              ),
              Positioned(
                top: 32,
                left: 0,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(Icons.arrow_back),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClientList() {
    final search = _searchController.text.toLowerCase();

    if (search.isEmpty) {
      return const Center(
        child: Text(
          "Escribe para buscar un cliente",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );
    }

    final filtered = _allClients.where((c) {
      return c["nombre"].toLowerCase().contains(search) ||
          c["id"].toLowerCase().contains(search);
    }).toList();

    if (filtered.isEmpty) {
      return const Center(child: Text("No se encontraron clientes"));
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF5CA8FF),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: const [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "CLIENTE",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "ACCIÓN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              children: filtered.map((client) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 12,
                          ),
                          child: Text(
                            client["nombre"],
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: IconButton(
                            icon: const Icon(
                              Icons.visibility,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              setState(() {
                                _selectedClientId = client["id"];
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisitsList() {
    final visits = selectedClient?["visitas"] ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Cliente: ${selectedClient?["nombre"]}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),

        Expanded(
          child: visits.isEmpty
              ? const Center(child: Text("No tiene visitas registradas"))
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF5CA8FF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        child: Row(
                          children: const [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  "FECHA",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  "ID",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  "VER",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: ListView(
                          children: visits.map<Widget>((visit) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 12,
                                      ),
                                      child: Text(
                                        DateFormat('dd/MM/yyyy hh:mm a').format(
                                          DateTime.parse(visit["fecha"]),
                                        ),
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 12,
                                      ),
                                      child: Text(
                                        visit["id"],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.visibility,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () => setState(() {
                                        _selectedVisitId = visit["id"];
                                        _showVisitDetail = true;
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
        ),

        const SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: double.infinity,
            child: Button(
              label: 'Volver',
              onPressed: () {
                setState(() {
                  _selectedClientId = null;
                  _selectedVisitId = null;
                  _showVisitDetail = false;
                  _searchController.clear();
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildVisitDetailView() {
    final visit = selectedVisit;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detalle de la visita ' + visit!["id"],
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        buildVisitTable(
          fechaHora: DateFormat('dd/MM/yyyy hh:mm a').format(
                                          DateTime.parse(visit["fecha"]),
                                        ),
          observaciones: visit?["observaciones"],
          vendedor: visit?["vendedor"],
        ),
        const SizedBox(height: 16),

        const SizedBox(height: 32),
      ],
    );
  }

  Widget buildVisitTable({
    required String fechaHora,
    required String observaciones,
    required String vendedor,
  }) {
    Widget buildRow(String campo, String valor) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: Text(
                campo,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),

            Expanded(
              child: Text(
                valor,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildRow("Fecha y hora:", fechaHora),
            buildRow("Observaciones:", observaciones),
            buildRow("Vendedor:", vendedor),
          ],
        ),
      ),
    );
  }
}
