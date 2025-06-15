# cBot – Sofindex Chatbot Frontend

> A lightweight, responsive web interface for the Sofindex cBot conversational AI platform.

---

## 🔍 Table of Contents

1. [About](#about)  
2. [Features](#features)  
3. [Tech Stack](#tech-stack)  
4. [Getting Started](#getting-started)  
   - [Prerequisites](#prerequisites)  
   - [Installation](#installation)  
   - [Configuration](#configuration)  
5. [Usage](#usage)  
6. [Deployment](#deployment)  
7. [Contributing](#contributing)  
8. [License](#license)  
9. [Contact & Support](#contact--support)  

---

## 📝 About

This repository contains the web-client for **cBot**, Sofindex’s intelligent chatbot platform. It provides a polished, mobile-friendly UI for end users to interact with the underlying NLP engine and business-logic services.

---

## ✨ Features

- **Real-time chat** with streaming responses  
- **Rich messages**: text, images, quick-reply buttons  
- **Multi-language support** (configurable via locale files)  
- **Conversation history** persisted in browser storage  
- **Customizable themes** and branding  
- **Easy integration** with 3rd-party APIs (CRM, ticketing, analytics)  
- **Offline fallback**: queue messages when disconnected  

---

## 🛠 Tech Stack

- **Frontend**: React (with Hooks) + TypeScript  
- **Styling**: Tailwind CSS / CSS Modules  
- **State Management**: Redux Toolkit (chat slices, UI slices)  
- **Real-time**: Socket.IO (WebSocket transport)  
- **Build**: Vite  
- **Testing**: Jest + React Testing Library  
- **Lint & Format**: ESLint + Prettier  

---

## 🚀 Getting Started

### Prerequisites

- Node.js v14 or higher  
- npm (v6+) or Yarn v1.22+  

### Installation

1. **Clone the repo**  
   ```bash
   git clone https://github.com/your-org/cbot-frontend.git
   cd cbot-frontend
