#!/bin/sh
set -e

echo "📥 Moving to workspace..."
cd "$GITHUB_WORKSPACE" 

echo "📦 Installing dependencies..."
npm install

echo "🏗 Building Astro..."
npm run build

echo "📤 Uploading files to FTP server..."

lftp "$FTP_HOST" -u "$FTP_USER","$FTP_PASS" -e "set ftp:ssl-force $FORCE_SSL; set ssl:verify-certificate false; set ftp:charset utf8; set file:charset utf8; set ftp:passive-mode on; set net:timeout 30; set net:max-retries 3; mirror --reverse --verbose --dereference -x ^\.git/$ -X .gitignore $LOCAL_DIR $REMOTE_DIR; quit"

echo "✅ Deployment completed!"
