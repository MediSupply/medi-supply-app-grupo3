import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../gen/assets.gen.dart';
import '../../design_system/components/button.dart';
import '../../design_system/components/input.dart';
import '../../design_system/components/snack_bar.dart';
import '../../design_system/tokens/colors.dart';

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
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Mock data
  final List<Map<String, dynamic>> _allClients = [
    {
      "id": '1',
      "nombre": "Clínica Santa María",
      "email": "contacto@santamaria.com",
      "telefono": "3004567890",
      "direccion": "Cra 45 # 32-10, Medellín",
      "razon_social": "Clínica Santa María S.A.",
      "nit": "900123456-1",
      "visitas": [
        {
          "id": "V-101",
          "fecha": "2025-01-15 10:30 AM",
          "observaciones":
              "Se revisaron productos nuevos. Interés en insumos quirúrgicos.",
          "vendedor": "Ana López",
        },
        {
          "id": "V-102",
          "fecha": "2025-01-10 4:10 PM",
          "observaciones": "Cliente solicitó lista de precios actualizada.",
          "vendedor": "Juan Pérez",
        },
      ],
    },
    {
      "id": '2',
      "nombre": "Hospital Vida Plena",
      "email": "info@vidaplena.org",
      "telefono": "3178902345",
      "direccion": "Av. Las Palmas # 15-20, Medellín",
      "razon_social": "Fundación Hospital Vida Plena",
      "nit": "800987654-3",
      "visitas": [
        {
          "id": "V-201",
          "fecha": "2025-01-18 9:00 AM",
          "observaciones": "Se realizó demostración de equipos biomédicos.",
          "vendedor": "María Gómez",
        },
        {
          "id": "V-204",
          "fecha": "2025-01-20 11:00 AM",
          "observaciones": "Se realizó demostración de equipos quirúrgicos.",
          "vendedor": "María Gómez",
        },
      ],
    },
  ];

  Map<String, dynamic>? get selectedClient =>
      _allClients.firstWhere((c) => c["id"] == _selectedClientId);

  Map<String, dynamic>? get selectedVisit =>
      selectedClient?["visitas"].firstWhere((v) => v["id"] == _selectedVisitId);

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
        // Encabezados
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
                    "NOMBRE",
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

        // Filas dinámicas
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
                    // Nombre
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        child: Text(
                          client["nombre"],
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),

                    // ID
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        child: Text(
                          client["id"],
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),

                    // Botón o icono de ver
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: IconButton(
                          icon: const Icon(Icons.visibility, color: Colors.blue),
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
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Cliente: ${selectedClient?["nombre"]}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
        Expanded(
          child: visits.isEmpty
              ? const Center(child: Text("No tiene visitas registradas"))
              : ListView(
                  children: visits.map<Widget>((visit) {
                    return ListTile(
                      title: Text("Visita ${visit["id"]}"),
                      subtitle: Text("Fecha: ${visit["fecha"]}"),
                      trailing: const Icon(Icons.visibility),
                      onTap: () => setState(() {
                        _selectedVisitId = visit["id"];
                        _showVisitDetail = true;
                      }),
                    );
                  }).toList(),
                ),
        ),
        Padding(padding: const EdgeInsets.all(16.0)),
      ],
    );
  }

  Widget _buildVisitDetailView() {
    final visit = selectedVisit;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detalle de Visita',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),

        buildVisitTable(
          fechaHora: visit?["fecha"],
          observaciones: visit?["observaciones"],
          vendedor: visit?["vendedor"],
        ),
        const SizedBox(height: 16),

        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _showVisitDetail = false;
                _selectedVisitId = null;
                _selectedClientId = null;
                _searchController.clear();
              });
            },
            child: const Text('Volver'),
          ),
        ),
      ],
    );
  }

  Widget buildVisitTable({
    required String fechaHora,
    required String observaciones,
    required String vendedor,
  }) {
    // Helper para cada fila
    Widget buildRow(String campo, String valor) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo
            SizedBox(
              width: 120, // ancho fijo para alinear
              child: Text(
                campo,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),

            // Valor
            Expanded(
              child: Text(
                valor,
                style: const TextStyle(
                  fontWeight: FontWeight.bold, // AQUÍ VA EL BOLD
                  fontSize: 13,
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
