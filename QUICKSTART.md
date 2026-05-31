# 🚀 Quick Start Guide - OSIMIRI-CITY

## One-Command Deployment

### **macOS / Linux**
```bash
chmod +x deploy.sh
./deploy.sh
```

### **Windows**
```cmd
deploy.bat
```

---

## Manual Deployment Steps

### **Step 1: Clone Repository**
```bash
git clone https://github.com/arts-F/OSIMIRI-CITY---OSI.git
cd OSIMIRI-CITY---OSI
```

### **Step 2: Install Dependencies**
```bash
pnpm install
```

### **Step 3: Build Project**
```bash
pnpm build
```

### **Step 4: Choose Deployment**

#### **Option A: Local Development**
```bash
pnpm dev
# Visit http://localhost:3000
```

#### **Option B: Docker (Recommended)**
```bash
docker-compose up -d
# Visit http://localhost:3000
```

#### **Option C: GitHub Pages (Free)**
1. Go to: https://github.com/arts-F/OSIMIRI-CITY---OSI/settings/pages
2. Select `main` branch → Save
3. Push to main: `git push origin main`
4. Visit: https://arts-F.github.io/OSIMIRI-CITY---OSI

#### **Option D: Vercel (Recommended)**
```bash
npm install -g vercel
vercel --prod
```

#### **Option E: Netlify**
```bash
npm install -g netlify-cli
netlify deploy --prod
```

---

## 🔐 Environment Setup

```bash
# Copy environment template
cp .env.example .env.local

# Edit with your values
nano .env.local  # or use your editor
```

**Required variables:**
```
NODE_ENV=production
PORT=3000
BLOCKCHAIN_RPC_URL=https://...
AI_API_KEY=sk-...
```

---

## 🧪 Testing

```bash
# Run all tests
pnpm test

# Run specific test
pnpm test --testNamePattern="pattern"

# Generate coverage
pnpm coverage
```

---

## 📊 Useful Commands

```bash
# Development
pnpm dev              # Start dev server
pnpm build            # Build for production
pnpm preview          # Preview production build

# Quality
pnpm lint             # Run linter
pnpm format           # Format code
pnpm test             # Run tests

# Docker
docker-compose up     # Start services
docker-compose down   # Stop services
docker build -t osimiri-city:latest .  # Build image

# Deployment
vercel --prod         # Deploy to Vercel
netlify deploy --prod # Deploy to Netlify
```

---

## 🐛 Troubleshooting

### "pnpm not found"
```bash
npm install -g pnpm
```

### "Port 3000 already in use"
```bash
# macOS/Linux
lsof -i :3000
kill -9 <PID>

# Windows
netstat -ano | findstr :3000
taskkill /PID <PID> /F
```

### "Docker command not found"
- Install Docker Desktop: https://www.docker.com/products/docker-desktop

### Build fails
```bash
# Clear cache and reinstall
rm -rf node_modules pnpm-lock.yaml
pnpm install --frozen-lockfile
pnpm build
```

---

## 📚 Documentation

- 📖 [Full Deployment Guide](DEPLOYMENT.md)
- 🔐 [Secrets & Configuration](SECRETS.md)
- ✅ [Deployment Checklist](CHECKLIST.md)
- 🐳 [Docker Setup](docker-compose.yml)

---

## 🎯 What's Next?

1. ✅ Deploy application
2. ✅ Configure environment variables
3. ✅ Set up monitoring
4. ✅ Configure custom domain
5. ✅ Set up SSL/TLS

---

**Need help?** Check the [repository issues](https://github.com/arts-F/OSIMIRI-CITY---OSI/issues)

**Last Updated:** 2026-05-31
