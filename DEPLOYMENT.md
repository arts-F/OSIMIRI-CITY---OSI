# 🚀 OSIMIRI-CITY Deployment Guide

## Quick Start

### Option 1: Local Development
```bash
# Install dependencies
pnpm install

# Start development server
pnpm dev

# Build for production
pnpm build
```

### Option 2: Docker (Recommended)
```bash
# Build Docker image
docker build -t osimiri-city:latest .

# Run container
docker run -p 3000:3000 osimiri-city:latest

# Using Docker Compose
docker-compose up -d
```

### Option 3: GitHub Pages (Static Sites)
Automatic deployment on push to `main` via GitHub Actions.

---

## Deployment Platforms

### 1️⃣ **GitHub Pages** (Free, Static)
- Best for: Frontend/documentation sites
- Status: Auto-enabled via `.github/workflows/build-deploy.yml`
- Access: `https://arts-F.github.io/OSIMIRI-CITY---OSI`

### 2️⃣ **Vercel** (Recommended for Full-Stack)
```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel

# Production
vercel --prod
```

### 3️⃣ **Netlify**
- Connect repo at [netlify.com](https://netlify.com)
- Build command: `pnpm build`
- Publish directory: `dist/`

### 4️⃣ **Docker + AWS/Azure/DigitalOcean**
```bash
docker push your-registry/osimiri-city:latest
# Then deploy using platform's container orchestration
```

### 5️⃣ **Railway.app** (Simple Node.js Hosting)
- Connect GitHub repo
- Auto-detects Node.js project
- Auto-deploys on push

---

## CI/CD Pipeline

GitHub Actions workflow automatically:
- ✅ Installs dependencies (`pnpm install`)
- ✅ Builds project (`pnpm build`)
- ✅ Runs tests (`pnpm test`)
- ✅ Deploys to GitHub Pages

Triggered on:
- Push to `main` or `develop`
- Pull requests

---

## Environment Setup

1. Copy `.env.example` to `.env.local`
2. Fill in required secrets:
   - Blockchain RPC URLs
   - API keys
   - Wallet credentials
3. Never commit `.env` files!

---

## Health Checks & Monitoring

Docker container includes:
- HTTP health check at `/health` endpoint
- Auto-restart on failure
- Log persistence in `./logs`

---

## Troubleshooting

### Build fails
```bash
# Clear cache and reinstall
pnpm install --frozen-lockfile
pnpm build
```

### Port already in use
```bash
# Change port in docker-compose.yml
# Or kill existing process
lsof -i :3000
kill -9 <PID>
```

### Docker image issues
```bash
# Rebuild without cache
docker build --no-cache -t osimiri-city:latest .
```

---

## Next Steps

1. ✅ Set GitHub secrets (for private deployments)
2. ✅ Configure domain/DNS
3. ✅ Set up monitoring & alerts
4. ✅ Configure backup strategy
5. ✅ Document API endpoints

---

**Questions?** Open an issue or check the main README.
