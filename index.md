---
layout: default
title: Home
nav_order: 1
description: "Battle-tested, scalable folder structures for React applications"
permalink: /
---

# React App Folder Structure Templates
{: .fs-9 }

Battle-tested, scalable folder structures for React applications using feature-based architecture.
{: .fs-6 .fw-300 }

[Get started now](#available-templates){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[View on GitHub](https://github.com/ahmad2point0/react-app-folder-structure){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## Why Feature-Based Architecture?

{: .highlight }
Feature-based architecture organizes code by business features rather than technical layers, making applications more scalable and maintainable.

- **🚀 Scalable** - Easy to add features without restructuring
- **🧹 Maintainable** - Related code stays together
- **👥 Team-friendly** - Clear ownership and reduced conflicts
- **⚡ Efficient** - Faster development and better code splitting

## Available Templates

| Framework | Status | Description | Documentation |
|:----------|:-------|:------------|:--------------|
| **React Native Expo** | ✅ Available | Mobile apps with Expo Router | [📱 View →](react-native-expo.html) |
| **Next.js App Router** | 🚧 Coming Soon | Full-stack web apps with App Router | 🔜 |
| **Vite + React** | 🚧 Coming Soon | Fast development with Vite | 🔜 |
| **Create React App** | 🚧 Coming Soon | Traditional React SPA | 🔜 |
| **React Native CLI** | 🚧 Coming Soon | Native development without Expo | 🔜 |
| **Remix** | 🚧 Coming Soon | Full-stack with server rendering | 🔜 |

## Core Structure Pattern

All templates follow this proven pattern:

```
src/
├── app/           # File-based routing (screens/pages)
├── features/      # Feature modules (auth, chat, etc.)
├── components/    # Shared UI components
├── assets/        # Static files
├── constants/     # App constants
├── lib/           # Third-party integrations
├── store/         # Global state
├── hooks/         # Global hooks
├── utils/         # Helper functions
├── types/         # TypeScript types
├── service/       # Background services
└── config/        # App configuration
```

## Quick Start

1. Choose a template from the table above
2. Click the link to view detailed documentation  
3. Copy the folder structure to your project
4. Follow the framework-specific setup guide

---

## Contributing

We welcome contributions! See our [Contributing Guide](contributing.html) for details on how to add new templates or improve existing ones.
