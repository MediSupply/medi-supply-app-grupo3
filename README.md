# Medi Supply App Grupo 3

Proyecto aplicación mobile para MediSupply en Flutter.

## Requisitos Previos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (>=3.35.4)
- [Dart SDK](https://dart.dev/get-dart) (>=3.9.2 <4.0.0)
- [Android Studio](https://developer.android.com/studio) o [VS Code](https://code.visualstudio.com/) (opcional)
- Un emulador o dispositivo físico (Android o iOS)

## Instalación

1. **Clona el repositorio:**

   ```bash
   git clone <URL_DEL_REPOSITORIO>
   cd medi-supply-app-grupo3
   ```

2. **Instala las dependencias:**

   ```bash
   flutter pub get
   ```

3. **(Opcional) Selecciona la versión de Flutter con FVM:**

   Si usas [FVM](https://fvm.app/):

   ```bash
   fvm use 3.35.4
   fvm flutter pub get
   ```

## Ejecución del Proyecto

### En Android

1. Conecta un dispositivo Android o inicia un emulador.
2. Ejecuta:

   ```bash
   flutter run
   ```

### En iOS

1. Asegúrate de tener Xcode instalado y configurado.
2. Instala los pods de CocoaPods:

   ```bash
   cd ios
   pod install
   cd ..
   ```

3. Conecta un dispositivo iOS o inicia un simulador.
4. Ejecuta:

   ```bash
   flutter run
   ```

## Estructura del Proyecto

- `lib/` — Código fuente principal de la aplicación.
- `assets/` — Imágenes e íconos utilizados en la app.
- `test/` — Pruebas unitarias y de widget.

## Notas

- Modifica el archivo `pubspec.yaml` para agregar nuevas dependencias.
- Si tienes problemas con dependencias, ejecuta `flutter clean` y luego `flutter pub get`.

## Recursos

- [Documentación oficial de Flutter](https://docs.flutter.dev/)
- [Guía de instalación de Flutter](https://docs.flutter.dev/get-started/install)

