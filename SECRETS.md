# OSIMIRI-CITY Secrets & Configuration Guide

## GitHub Secrets Setup

Add these secrets to your repository for CI/CD:
- Settings → Secrets and variables → Actions → New repository secret

### Required Secrets

```
DEPLOY_TOKEN: (GitHub Personal Access Token)
DOCKER_USERNAME: (Docker Hub username)
DOCKER_PASSWORD: (Docker Hub access token)
DOCKER_REGISTRY_URL: (Docker registry URL)
```

### Optional Secrets (for blockchain/API features)

```
BLOCKCHAIN_RPC_URL: (Ethereum RPC endpoint)
SMART_CONTRACT_ADDRESS: (Deployed contract address)
WALLET_PRIVATE_KEY: (Signing key for transactions)
AI_API_KEY: (AI service API key)
DATABASE_URL: (PostgreSQL or database connection string)
```

---

## Environment Variables

### Development (.env.local)
```bash
cp .env.example .env.local
# Edit with your local values
```

### Production (GitHub Secrets / Vercel / Netlify)
Set these in your hosting platform's environment variables section.

---

## Deployment Platform Setup

### 1. GitHub Pages
- ✅ Auto-enabled via GitHub Actions
- 📍 Access: https://arts-F.github.io/OSIMIRI-CITY---OSI
- No additional setup needed!

### 2. Vercel Deployment
```bash
# Install Vercel CLI
npm i -g vercel

# Login
vercel login

# Deploy preview
vercel

# Production deployment
vercel --prod
```

### 3. Netlify Deployment
```bash
# Install Netlify CLI
npm i -g netlify-cli

# Deploy
netlify deploy --prod
```

### 4. Docker Registry (Docker Hub / GitHub Container Registry)
```bash
# Build & tag
docker build -t osimiri-city:latest .
docker tag osimiri-city:latest YOUR_REGISTRY/osimiri-city:latest

# Push
docker push YOUR_REGISTRY/osimiri-city:latest
```

---

## Secrets Checklist

- [ ] DEPLOY_TOKEN created
- [ ] DOCKER credentials set
- [ ] Blockchain RPC configured (if needed)
- [ ] API keys added
- [ ] Database connection string set
- [ ] GitHub Pages enabled
- [ ] Workflow permissions verified

---

## Troubleshooting

**Build fails in CI/CD:**
- Check `pnpm install --frozen-lockfile` doesn't error
- Verify Node.js version compatibility
- Check for missing environment variables

**Deployment fails:**
- Verify secrets are correctly named
- Check branch protection rules
- Review GitHub Actions logs

**Docker push fails:**
- Verify Docker credentials
- Check registry URL format
- Ensure image tag matches registry
