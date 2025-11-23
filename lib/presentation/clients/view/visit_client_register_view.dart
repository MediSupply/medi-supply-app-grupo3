import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../gen/assets.gen.dart';
import '../../design_system/components/button.dart';
import '../../design_system/components/input.dart';
import '../../design_system/components/snack_bar.dart';
import '../../design_system/tokens/colors.dart';

class VisitClientRegisterView extends StatefulWidget {
  const VisitClientRegisterView({super.key});

  @override
  State<VisitClientRegisterView> createState() =>
      _VisitClientRegisterViewState();
}

class _VisitClientRegisterViewState extends State<VisitClientRegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _clientController = TextEditingController();
  final _observationsController = TextEditingController();
  DateTime? _selectedDateTime;

  // Mock data
  final List<Map<String, String>> _allClients = [
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

  List<Map<String, String>> _filteredClients = [];
  Map<String, String>? _selectedClient;

  @override
  void initState() {
    super.initState();
    _clientController.addListener(_filterClients);
  }

  void _filterClients() {
    final query = _clientController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredClients = [];
      } else {
        _filteredClients = _allClients
            .where(
              (client) =>
                  client['nombre']!.toLowerCase().contains(query) ||
                  client['nit']!.toLowerCase().contains(query) ||
                  client['razon_social']!.toLowerCase().contains(query),
            )
            .toList();
      }
    });
  }

  void _selectClient(Map<String, String> client) {
    setState(() {
      _selectedClient = client;
      _clientController.text = '${client['nombre']} (${client['nit']})';
      _filteredClients = [];
    });
  }

  Future<void> _selectDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null && mounted) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null) {
        setState(() {
          _selectedDateTime = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  void _saveVisit() {
    if (_formKey.currentState!.validate() &&
        _selectedClient != null &&
        _selectedDateTime != null) {
      // TO DO lógica para guardar la visita
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Visita registrada exitosamente')),
      );
      _resetForm();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor completa todos los campos')),
      );
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _clientController.clear();
    _observationsController.clear();
    setState(() {
      _selectedClient = null;
      _selectedDateTime = null;
      _filteredClients = [];
    });
  }

  @override
  void dispose() {
    _clientController.dispose();
    _observationsController.dispose();
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
                  Text('Registrar visita a un cliente'),
                  const SizedBox(height: 16),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Cliente',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _clientController,
                          decoration: InputDecoration(
                            hintText: 'Buscar por nombre, razón social o NIT',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) => _selectedClient == null
                              ? 'Selecciona un cliente'
                              : null,
                        ),
                        if (_filteredClients.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _filteredClients.length,
                              itemBuilder: (context, index) {
                                final client = _filteredClients[index];
                                return ListTile(
                                  title: Text(client['nombre']!),
                                  subtitle: Text(client['nit']!),
                                  onTap: () => _selectClient(client),
                                );
                              },
                            ),
                          ),
                        const SizedBox(height: 24),
                        const Text(
                          'Fecha y hora de la visita',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: _selectDateTime,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _selectedDateTime != null
                                      ? '${_selectedDateTime!.day}/${_selectedDateTime!.month}/${_selectedDateTime!.year} ${_selectedDateTime!.hour.toString().padLeft(2, '0')}:${_selectedDateTime!.minute.toString().padLeft(2, '0')}'
                                      : 'Selecciona fecha y hora',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const Icon(Icons.calendar_today),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Observaciones o comentarios',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _observationsController,
                          decoration: InputDecoration(
                            hintText: 'Ingresa observaciones...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          maxLines: 4,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Este campo es obligatorio'
                              : null,
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            Expanded(
                              child: Button(
                                onPressed: _resetForm,
                                label: 'Limpiar',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Button(
                                onPressed: _saveVisit,
                                label: 'Guardar',
                              ),
                            ),
                          ],
                        ),
                      ],
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
}
