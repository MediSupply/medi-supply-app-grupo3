import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class VisitLocalStorage {
  static const String key = 'visitas';

  /// Guardar una visita
  static Future<void> saveVisit(Map<String, dynamic> newVisit) async {
    final prefs = await SharedPreferences.getInstance();

    final stored = prefs.getString(key);
    final List<dynamic> visits = stored != null ? jsonDecode(stored) : [];

    visits.add(newVisit);

    await prefs.setString(key, jsonEncode(visits));
  }

  /// Obtener todas las visitas
  static Future<List<dynamic>> getVisits() async {
    final prefs = await SharedPreferences.getInstance();

    final stored = prefs.getString(key);
    if (stored == null) return [];

    return jsonDecode(stored);
  }

  /// Limpiar todas las visitas
  static Future<void> clearVisits() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
