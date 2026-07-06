Hackathon Nicaragua Reto de Memoria Viva Nicaragua 2025 - Equipo Echo
Nombre de la app: Kúentalo

En Nicaragua, nuestra riqueza cultural vive en la memoria de las comunidades: en los relatos de los abuelos, en las recetas tradicionales, en las ferias patronales y en las leyendas transmitidas de generación en generación, pero gran parte de este conocimiento corre el riesgo de perderse por la falta de un espacio digital donde preservarlo y compartirlo. Kuéntalo nace como una aplicación educativa y cultural para rescatar, registrar y difundir estos saberes de manera colaborativa

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

- Versiones: este proyecto usa Expo `~54`, React `19`, React Native `0.81`. Usa la app Expo Go compatible más reciente.
