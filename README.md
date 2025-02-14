# Deploy Astro to FTP

Esta acción de GitHub construye un proyecto Astro y lo sube a un servidor FTP (con o sin SSL).

## Inputs

| Nombre       | Descripción                        | Requerido | Predeterminado   |
|--------------|------------------------------------|-----------|------------------|
| `ftp_host`   | Servidor FTP                       | Sí        |                  |
| `ftp_user`   | Usuario FTP                        | Sí        |                  |
| `ftp_pass`   | Contraseña FTP                     | Sí        |                  |
| `local_dir`  | Directorio local a subir           | No        | `./dist`         |
| `remote_dir` | Directorio remoto para subir archivos | Sí        | `/public_html`   |
| `use_ssl`    | Habilitar SSL (true/false)         | No        | `false`          |
| `force_ssl`  | Forzar uso de SSL                  | No        | `false`          |

## Ejemplo de uso

```yaml
name: Auto Build Astro Page

on:
  push:
    branches: [ main ]
  workflow_dispatch:

permissions:
  contents: read

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout your repository using git
        uses: actions/checkout@v4
      
      - name: Build and upload to FTP server
        uses: abelsrzz/astro-ftps-action@v1.0.0

        with:
          ftp_host: ${{ secrets.FTP_SERVER }}
          ftp_user: ${{ secrets.FTP_USERNAME }}
          ftp_pass: ${{ secrets.FTP_PASSWORD }}
          local_dir: ./dist
          remote_dir: /suarezmuinho.com/src
          force_ssl: true
