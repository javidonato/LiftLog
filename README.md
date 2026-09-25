# LiftLog — Fase 1

Aplicación iOS nativa construida con **SwiftUI + SwiftData**, con deployment target de **iOS 17.0**.

## Qué incluye Fase 1

- Cinco pestañas: Registrar, Rutinas, Progreso, Calendario y Resumen.
- Catálogo inicial de 40 ejercicios.
- Persistencia local con SwiftData.
- Modelos base para ejercicios, rutinas, entrenamientos y series.
- Verificación del catálogo al iniciar la app.
- Tests unitarios y de modelos SwiftData.

Las funcionalidades de registro completo de entrenamientos, entrenamiento activo, gráficos, temporizador y estadísticas se implementarán en fases posteriores.

## Desarrollo desde Windows

No es necesario tener Xcode instalado en Windows para mantener el repositorio o trabajar en el código. La compilación de iOS se ejecuta mediante GitHub Actions en un runner macOS.

## GitHub Actions

El workflow `.github/workflows/ios.yml`:

1. Descarga el repositorio.
2. Usa un runner macOS de GitHub con Xcode.
3. Compila LiftLog para iOS Simulator sin firma de código.
4. Ejecuta los tests.
5. Marca el workflow como fallido si la compilación o las pruebas fallan.

### Subir desde Windows

Desde PowerShell, dentro de la carpeta del proyecto:

```powershell
git init
git add .
git commit -m "Preparar LiftLog Fase 1 para GitHub Actions"
git branch -M main
git remote add origin https://github.com/TU_USUARIO/LiftLog.git
git push -u origin main
```

Después de hacer push, entra al repositorio de GitHub y abre la pestaña **Actions**. El workflow **LiftLog iOS** se ejecutará automáticamente.

## Firma y TestFlight

Esta fase todavía no contiene certificados, provisioning profiles ni publicación en App Store/TestFlight. Primero queremos validar que el proyecto compila y que los tests pasan de forma reproducible.
