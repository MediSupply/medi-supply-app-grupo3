import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../gen/assets.gen.dart';
import '../../design_system/components/button.dart';
import '../../design_system/components/input.dart';
import '../../design_system/components/snack_bar.dart';
import '../../design_system/tokens/colors.dart';

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
        'nombre': 'Juan Pérez García',
        'tipoDocumento': 'Cédula',
        'numeroDocumento': '12345678',
        'direccion': 'Cra 5 #10-20, Bogotá',
        'telefono': '+57 301 1234567',
        'email': 'juan@medisupply.com',
      },
      {
        'nombre': 'María Torres',
        'tipoDocumento': 'Cédula',
        'numeroDocumento': '987654321',
        'direccion': 'Cll 45 #20-10, Medellín',
        'telefono': '+57 302 9876543',
        'email': 'maria@medisupply.com',
      },
    ];

    // Filtro por nombre o número de documento
    final results = mockClients.where((client) {
      final nombre = client['nombre']!.toLowerCase();
      final documento = client['numeroDocumento']!.toLowerCase();
      return nombre.contains(query) || documento.contains(query);
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
                  Text('Consultar de cliente'),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Nombre o Número de Documento',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Button(
                    onPressed: _clientDetail,
                    label: 'Buscar',
                    isLoading: _isLoading,
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
        _buildTableRow('Nombre o razón social', _clientData!['nombre'] ?? ''),
        _buildTableRow(
          'Tipo de documento',
          _clientData!['tipoDocumento'] ?? '',
        ),
        _buildTableRow(
          'Número de documento',
          _clientData!['numeroDocumento'] ?? '',
        ),
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
