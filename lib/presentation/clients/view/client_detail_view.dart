import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../gen/assets.gen.dart';
import '../../design_system/components/button.dart';

class ClientDetailView extends StatefulWidget {
  const ClientDetailView({super.key});

  @override
  State<ClientDetailView> createState() => _ClientDetailViewState();
}

class _ClientDetailViewState extends State<ClientDetailView> {
  final TextEditingController _searchController = TextEditingController();
  Map<String, String>? _clientData;
  bool _isLoading = false;
  String? _errorMessage;

  void _clientDetail() async {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) {
      setState(
        () => _errorMessage =
            'Por favor ingrese un nombre, razón social o número de documento',
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _clientData = null;
    });

    // Simula la búsqueda. Se va a reemplazar con API real
    await Future.delayed(const Duration(seconds: 1));

    // Mock data
    final mockClients = [
      {
      "id": '1',
      "nombre": "Clínica Santa María",
      "email": "contacto@santamaria.com",
      "telefono": "3004567890",
      "direccion": "Cra 45 # 32-10, Medellín",
      "razon_social": "Clínica Santa María S.A.",
      "nit": "900123456-1",
    },
    {
      "id": '2',
      "nombre": "Hospital Vida Plena",
      "email": "info@vidaplena.org",
      "telefono": "3178902345",
      "direccion": "Av. Las Palmas # 15-20, Medellín",
      "razon_social": "Fundación Hospital Vida Plena",
      "nit": "800987654-3",
    },
    {
      "id": '3',
      "nombre": "Laboratorio BioTest",
      "email": "servicio@biotest.com",
      "telefono": "3156789012",
      "direccion": "Calle 10 # 40-22, Medellín",
      "razon_social": "BioTest Laboratorios Clínicos SAS",
      "nit": "901456789-5",
    },
    {
      "id": '4',
      "nombre": "Centro Médico El Poblado",
      "email": "atencion@cmpoblado.co",
      "telefono": "3103456789",
      "direccion": "Calle 8 # 43A-05, Medellín",
      "razon_social": "Centro Médico Integral El Poblado",
      "nit": "900234567-8",
    },
    {
      "id": '5',
      "nombre": "Distribuidora FarmaPlus",
      "email": "ventas@farmaplus.com",
      "telefono": "3012345678",
      "direccion": "Calle 30 # 55-90, Medellín",
      "razon_social": "FarmaPlus Distribuciones SAS",
      "nit": "901987321-4",
    },
    ];

    // Filtro por nombre o número de documento
    final results = mockClients.where((client) {
      final nombre = client['nombre']!.toLowerCase();
      final razon_social = client['razon_social']!.toLowerCase();
      final documento = client['nit']!.toLowerCase();
      return nombre.contains(query)|| razon_social.contains(query) || documento.contains(query);
    }).toList();

    setState(() {
      _isLoading = false;
      if (results.isNotEmpty) {
        _clientData = results.first;
      } else {
        _errorMessage =
            'No se encontró ningún cliente con la información ingresada.';
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
                  Text('Consulta de cliente'),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText:
                          'Nombre del cliente o número de identificación',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Button(
                    onPressed: _clientDetail,
                    label: 'Buscar',
                  ),
                  const SizedBox(height: 24),
                  if (_isLoading)
                    const CircularProgressIndicator()
                  else if (_errorMessage != null)
                    Text(_errorMessage!, style: TextStyle(color: Colors.red))
                  else if (_clientData != null)
                    _buildClientTable()
                  else
                    const Text(
                      'Ingrese el nombre, razón social o número de documento del cliente para ver los detalles',
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

  Widget _buildClientTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey.shade300, width: 1),
      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(1.8)},
      children: [
        _buildTableRow('CAMPO', 'DESCRIPCIÓN', isHeader: true),
        _buildTableRow('Nombre del cliente', _clientData!['nombre'] ?? ''),
        _buildTableRow('Razón social', _clientData!['razon_social'] ?? ''),
        _buildTableRow('NIT', _clientData!['nit'] ?? ''),
        _buildTableRow('Dirección principal', _clientData!['direccion'] ?? ''),
        _buildTableRow('Teléfono de contacto', _clientData!['telefono'] ?? ''),
        _buildTableRow('Correo electrónico', _clientData!['email'] ?? ''),
      ],
    );
  }

  TableRow _buildTableRow(String label, String value, {bool isHeader = false}) {
    return TableRow(
      decoration: isHeader
          ? const BoxDecoration(color: Color(0xFF70A7FF))
          : null,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            label,
            textAlign: isHeader ? TextAlign.center : TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              color: isHeader ? Colors.white : Colors.black87,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            value,
            textAlign: isHeader ? TextAlign.center : TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              color: isHeader ? Colors.white : Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
