# asm-template

A simple VSCode project with everything needed for cross-platform ASM development. I made this as I'm on macOS and wanted an effective way to practice amd64 ASM.

![VSCode](https://img.shields.io/badge/VSCode-007ACC?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Make](https://img.shields.io/badge/Make-000000?style=for-the-badge&logo=makefile&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![ASM](https://img.shields.io/badge/ASM-4EAA25?style=for-the-badge&logo=hashnode&logoColor=white)

## Features
- Cross-platform
- Preconfigured for VSCode
- Ready-to-use Docker
- x84_64 / AMD64

## Installation
1. Clone the repository
2. Open the project in VSCode
3. Docker build (docker build --platform linux/amd64 -t x86_64_asm_env .)
4. Start coding in assembly!

## Usage
- Command + Shift + B to run build task

## For Ease Of Use, Use A Template Plugin
- I personally use: [cantonios - Project Templates](https://marketplace.visualstudio.com/items?itemName=cantonios.project-templates)
