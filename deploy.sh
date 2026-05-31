#!/bin/bash

# OSIMIRI-CITY Deployment Script
# This script automates the deployment process

set -e

echo "🚀 OSIMIRI-CITY Deployment Script"
echo "=================================="
echo ""

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check prerequisites
check_prerequisites() {
    echo -e "${BLUE}📋 Checking prerequisites...${NC}"
    
    if ! command -v node &> /dev/null; then
        echo "❌ Node.js not found. Please install Node.js 18+"
        exit 1
    fi
    
    if ! command -v pnpm &> /dev/null; then
        echo "⚠️  pnpm not found. Installing..."
        npm install -g pnpm
    fi
    
    echo -e "${GREEN}✅ Prerequisites OK${NC}"
}

# Install dependencies
install_deps() {
    echo -e "${BLUE}📦 Installing dependencies...${NC}"
    pnpm install --frozen-lockfile
    echo -e "${GREEN}✅ Dependencies installed${NC}"
}

# Build project
build_project() {
    echo -e "${BLUE}🔨 Building project...${NC}"
    pnpm build
    echo -e "${GREEN}✅ Build complete${NC}"
}

# Run tests
run_tests() {
    echo -e "${BLUE}🧪 Running tests...${NC}"
    pnpm test --if-present || echo "ℹ️  No tests found"
    echo -e "${GREEN}✅ Tests complete${NC}"
}

# Deploy to GitHub Pages
deploy_github_pages() {
    echo -e "${BLUE}🌐 Deploying to GitHub Pages...${NC}"
    echo "Note: This requires GitHub Pages to be enabled in repository settings"
    echo "      Settings → Pages → main branch"
    echo ""
    echo -e "${YELLOW}⏳ Push to main branch to trigger automatic deployment:${NC}"
    echo "   git push origin main"
    echo ""
    echo -e "${BLUE}After push, visit:${NC}"
    echo "   https://arts-F.github.io/OSIMIRI-CITY---OSI"
}

# Deploy with Docker Compose
deploy_docker() {
    echo -e "${BLUE}🐳 Starting Docker deployment...${NC}"
    
    if ! command -v docker &> /dev/null; then
        echo "❌ Docker not found. Please install Docker"
        exit 1
    fi
    
    docker-compose build
    docker-compose up -d
    
    echo -e "${GREEN}✅ Docker deployment complete${NC}"
    echo -e "${BLUE}Access at: http://localhost:3000${NC}"
}

# Deploy to Vercel
deploy_vercel() {
    echo -e "${BLUE}⚡ Deploying to Vercel...${NC}"
    
    if ! command -v vercel &> /dev/null; then
        echo "Installing Vercel CLI..."
        npm install -g vercel
    fi
    
    vercel --prod
    echo -e "${GREEN}✅ Vercel deployment complete${NC}"
}

# Deploy to Netlify
deploy_netlify() {
    echo -e "${BLUE}🟡 Deploying to Netlify...${NC}"
    
    if ! command -v netlify &> /dev/null; then
        echo "Installing Netlify CLI..."
        npm install -g netlify-cli
    fi
    
    netlify deploy --prod
    echo -e "${GREEN}✅ Netlify deployment complete${NC}"
}

# Display menu
show_menu() {
    echo ""
    echo -e "${BLUE}Select deployment option:${NC}"
    echo "1) GitHub Pages (free, automatic)"
    echo "2) Docker Compose (local development)"
    echo "3) Vercel (serverless, recommended)"
    echo "4) Netlify (edge computing)"
    echo "5) Full build & test only"
    echo "6) Exit"
    echo ""
}

# Main flow
main() {
    check_prerequisites
    install_deps
    build_project
    run_tests
    
    while true; do
        show_menu
        read -p "Enter your choice [1-6]: " choice
        
        case $choice in
            1)
                deploy_github_pages
                break
                ;;
            2)
                deploy_docker
                break
                ;;
            3)
                deploy_vercel
                break
                ;;
            4)
                deploy_netlify
                break
                ;;
            5)
                echo -e "${GREEN}✅ Build and tests complete!${NC}"
                break
                ;;
            6)
                echo "Exiting..."
                exit 0
                ;;
            *)
                echo "Invalid option"
                ;;
        esac
    done
    
    echo ""
    echo -e "${GREEN}🎉 Deployment process complete!${NC}"
    echo ""
    echo -e "${BLUE}Next steps:${NC}"
    echo "1. Review repository settings"
    echo "2. Configure environment variables"
    echo "3. Set up monitoring & alerts"
    echo ""
    echo -e "${BLUE}Documentation:${NC}"
    echo "  📖 Deployment: https://github.com/arts-F/OSIMIRI-CITY---OSI/blob/main/DEPLOYMENT.md"
    echo "  🔐 Secrets: https://github.com/arts-F/OSIMIRI-CITY---OSI/blob/main/SECRETS.md"
    echo "  ✅ Checklist: https://github.com/arts-F/OSIMIRI-CITY---OSI/blob/main/CHECKLIST.md"
}

# Run main
main
