# Deploy Astro to FTP

This GitHub action builds an Astro project and uploads it to an FTP server (with or without SSL).

## Inputs

| Name         | Description                        | Required  | Default          |
|--------------|------------------------------------|-----------|------------------|
| `ftp_host`   | FTP Server                         | Yes       |                  |
| `ftp_user`   | FTP User                           | Yes       |                  |
| `ftp_pass`   | FTP Password                       | Yes       |                  |
| `local_dir`  | Local directory to upload          | No        | `./dist`         |
| `remote_dir` | Remote directory to upload files   | Yes       | `/public_html`   |
| `use_ssl`    | Enable SSL (true/false)            | No        | `false`          |
| `force_ssl`  | Force SSL usage                    | No        | `false`          |

## Usage example

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
