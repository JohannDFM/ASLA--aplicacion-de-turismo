<img width="1254" height="1254" alt="image" src="https://github.com/user-attachments/assets/9d6a8c73-c2c6-4f36-b3f5-3a2bf1a01311" />

Hackathon Nicaragua Reto Circuitos Creativos de la Red Nacional de Ciudades Creativas 2026 - Equipo Gallopintopower
Nombre de la app: Asla

## Descripción Técnica del Proyecto
Se requiere conectar a las Ciudades Creativas de Nicaragua con el mundo, dar a conocer mapas interactivos que recorren los circuitos creativos, experiencias inmersivas para localizar, conocer y compartir riqueza histórica, natural, saberes populares, culturales y tradicionales de nuestro pueblo; agenda de actividades como presentaciones, talleres, ferias, expo-ventas.

## Arquitectura y Estructura Modular 
Este proyecto contendra una arquítectura por capas (capa datos/capa de servicios/capa de presentación) para mantener el codigo limpio, testeable y escalable. La lógica está separada por interfaz de usuario, permitiendo que el equipo de diseño y el de programación trabajen en paralelo.

## Ejecutar el proyecto (Flutter)

Requisitos previos:
tener listo descargado Android Studio Panda 4 | 2025.3.4 Patch 1.
tener el sdk de flutter ya sea desde las extensiones de visual estudio 
tener Visual studio code.
Sdk.

## Árbol de Carpetas
lib/
-Screens  → Pantallas de la aplicación
1.Bienvenida_screen.dart.  →  Pantalla de Bienvenida
2.auth_screen.dart.  →  Registro e inicio de sesión
3.map_screen.dart.  → Mapa interactivo principal 
4.activities_screen.dart.  →  Agenda de eventos y feria 
-Widgets /   ⇒ componentes reutilizables
-Models /  ⇒ Clases de datos (eventos, usuario, circuito, coordenadas).
-Services/
1. auth_servicie.dart  → autentificación de login
2. firestone_service.dart → crud de actividades, circuito
3. location_service.dar → geolocalización y gestión del mapa
-Api/ ⇒ configuraci´´on de llamadas de APIs externas (google maps, traductor).
-config/ ⇒ configuraciones globales como: temas, colores, fuentes.
-utils/ ⇒ helpers, validadores de formularios y constantes

## Dependencias
google_maps_flutter ➸ renderizado de mapas, marcadores de circuitos y ubicación de usuario.
google_translate ➸ traducción automatica de descriptores.
firebase_core/firebase_auth/cloud_firestore ➸ Autentificación y base de datos en la nube
flutter_dotenv ➸ gestión segura de variables de entorno 
provider ➸ manejo del estado global (usuario logueado, lista de eventor y ubicación actual)
image_picker ➸ permite a los emprendedores subir fotos de sus productos o negocio s

## Variables de entorno
✔️ Crear un archivo llamado .env en la raiz del proyecto.
## API Key de Google Maps (OBLIGATORIA para el mapa y geolocalización)
GOOGLE_MAPS_API_KEY=AIzaSyAquiVaTuClaveReal
##  API Key de Google Translate (OBLIGATORIA para el módulo de traducciones)
GOOGLE_TRANSLATE_API_KEY=AIzaSyAquiVaTuClaveDeTranslate

## Backend
Asla utiliza Firebase como ecosistema de backend. toda la estructura está en la nube de google y lista para escalar.
✔️ Crea un proyecto en Firebase Console.
✔️ Habilita Authentication (correo/contraseña y Google Sign-In).
✔️ Habilita Firestore Database y crea las colecciones mencionadas abajo (en modo de pruebas al inicio).
✔️ Descarga los archivos de configuración nativos  → Android: Coloca google-services.json en android/app/

# Endpoints / Estructura de Datos de Firestore
👤 colección / users
Documento: { "Id": "123", 
"name": "Juan",
"email": "juan@mail.com", 
"role": "user" 
}
📅 colección / eventos
Documento: { 
  "Id": "e01", 
  "title": "Feria Internacional de Artesanías", 
  "date": "2026-07-15", 
  "city": "Granada", 
  "circuitId": "c001", 
  "type": "feria" 
}

## Scripts 
✏️ flutter pub get - instalar dependencias de una manera segura.
✏️ flutter run - levanta la app en el emulador o dispositivo fisico.
✏️ futtler clean - limpia los archivos de caché y compilación previa (útil si hay errores extraños)
✏️ flutter test - ejecuta pruebas unitarias.

### Notas y solución de problemas

- Android SDK/Emulador: si usas emulador, asegúrate de tener Android Studio y un AVD iniciado antes de `npm run android`.
- Red/Firewall: Expo/Flutter usa puertos locales; si no se conecta el móvil, prueba el modo "Tunnel" en la UI de Expo o permite la app en el firewall.

- Versiones: Este proyecto usa visual studio code version 1.127.0, flutter  3.44.0 y visual Android Studio Panda 4 | 2025.3.4 Patch 1.

