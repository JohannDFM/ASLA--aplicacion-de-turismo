Hackathon Nicaragua Reto Circuitos Creativos de la Red Nacional de Ciudades Creativas 2026 - Equipo Gallopintopower
Nombre de la app: Asla

Se requiere conectar a las Ciudades Creativas de Nicaragua con el mundo, dar a conocer mapas interactivos que recorren los circuitos creativos, experiencias inmersivas para localizar, conocer y compartir riqueza histórica, natural, saberes populares, culturales y tradicionales de nuestro pueblo; agenda de actividades como presentaciones, talleres, ferias, expo-ventas.

## Ejecutar el proyecto (Expo React Native)

Requisitos previos:
tener descargado Android Studio.
tener el sdk de flutter.
tener Visual studio code.
Sdk.
### 1) Instalar dependencias

En Windows PowerShell, desde la carpeta del proyecto (`echo-app`):

```powershell
npm install
```

O puedes usar la tarea ya creada en VS Code: Terminal > Run Task… > "Install dependencies".

### 2) Iniciar el servidor de desarrollo

- Modo general (Expo Dev Server):

```powershell
npm run start
```

Esto abrirá Expo Developer Tools. Desde ahí puedes:
- Android: presionar "a" o usar "Run on Android device/emulator".
- Web: presionar "w" o ejecutar `npm run web`.

También tienes tareas en VS Code:
- "Start Expo" (equivale a `npm run start`)
- "Start Android" (equivale a `npm run android`)
- "Start Web" (equivale a `npm run web`)

### Notas y solución de problemas

- Android SDK/Emulador: si usas emulador, asegúrate de tener Android Studio y un AVD iniciado antes de `npm run android`.
- Red/Firewall: Expo usa puertos locales; si no se conecta el móvil, prueba el modo "Tunnel" en la UI de Expo o permite la app en el firewall.
- Limpiar caché de Expo si ves errores extraños:

```powershell
npx expo start -c
```

- Versiones: Este proyecto usa visual studio code version 1.127.0, flutter  3.44.0 y visual Android Studio Panda 4 | 2025.3.4 Patch 1.

