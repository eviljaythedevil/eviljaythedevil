#!/data/data/com.termux/files/usr/bin/bash
# EVILJAY: push updates to GitHub and Vercel. Run: bash ~/eviljay/deploy.sh
cd ~/eviljay || { echo "Folder ~/eviljay not found. Run eviljay-setup.sh first."; exit 1; }
echo "Deploying from: $(pwd)"
[ -d .git ] || git init -b main
git add -A
git commit -m "EVILJAY update $(date +%Y-%m-%d_%H%M)" >/dev/null 2>&1 && echo "Committed changes" || echo "No new changes to commit"
if git remote get-url origin >/dev/null 2>&1; then git push -u origin main; else echo "No GitHub repo linked yet. Run: gh auth login   then   gh repo create eviljaythedevil --public --source=. --remote=origin --push"; fi
if command -v vercel >/dev/null 2>&1; then vercel --prod --yes; else echo "Vercel CLI not installed. Run: npm i -g vercel   then   vercel login   then   vercel link (choose the jaytehedevil project)   then run this script again"; fi
