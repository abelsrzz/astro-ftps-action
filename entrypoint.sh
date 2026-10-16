#!/bin/sh
set -e

echo "📥 Moving to workspace..."
cd "$GITHUB_WORKSPACE" 

echo "📦 Installing dependencies..."
npm install

echo "🏗 Building Astro..."
npm run build

echo "📤 Uploading files to FTP server..."

lftp "$FTP_HOST" -u "$FTP_USER","$FTP_PASS" -e "
  set ssl:verify-certificate false;
  set ftp:ssl-force $FORCE_SSL;
  set ftp:charset utf8;
  set file:charset utf8;
  set ftp:passive-mode on;
  set net:timeout $TIMEOUT;
  set net:max-retries $MAX_RETRIES;
  mirror --reverse --verbose --dereference -x ^\.git/$ -X .gitignore $LOCAL_DIR $REMOTE_DIR;
  quit"

echo "✅ Deployment completed!"
