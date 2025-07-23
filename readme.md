# React App Folder Structure Templates

> **📖 [View Full Documentation →](https://ahmad2point0.github.io/folder-structures)**

Battle-tested, scalable folder structures for React applications using feature-based architecture. This repository provides comprehensive templates and examples for organizing React projects across different frameworks.

## 🚀 Quick Overview

This repository contains:
- **Production-ready folder structures** for React frameworks
- **Complete code examples** with TypeScript support
- **Best practices** and implementation guides
- **Path alias configurations** and setup instructions

## 📁 Available Framework Templates

| Framework | Status | Description |
|-----------|--------|-------------|
| **React Native Expo** | ✅ Available | Mobile apps with Expo Router and file-based routing |
| **Next.js App Router** | 🚧 Coming Soon | Full-stack web applications with App Router |
| **Vite + React** | 🚧 Coming Soon | Fast development with Vite bundler |
| **Create React App** | 🚧 Coming Soon | Traditional React single-page applications |
| **React Native CLI** | 🚧 Coming Soon | Native development without Expo |
| **Remix** | 🚧 Coming Soon | Full-stack with server-side rendering |

## 🏗️ Core Architecture Pattern

All templates follow the same proven feature-based structure:

```
src/
├── app/           # File-based routing (screens/pages)
├── features/      # Feature modules (auth, chat, orders, etc.)
│   ├── auth/
│   │   ├── components/
│   │   ├── hooks/
│   │   ├── services/
│   │   └── types.ts
├── components/    # Shared UI components
├── assets/        # Static files (images, fonts, icons)
├── constants/     # App-wide constants
├── lib/           # Third-party integrations
├── store/         # Global state management
├── hooks/         # Global custom hooks
├── utils/         # Helper functions
├── types/         # TypeScript type definitions
├── service/       # Background services
└── config/        # App configuration
```

## ⚡ Quick Start

1. **Browse templates** in the [full documentation](https://ahmad2point0.github.io/folder-structures)
2. **Choose your framework** from the available templates
3. **Copy the folder structure** to your project
4. **Follow the setup guide** for your specific framework

## 🎯 Why Feature-Based Architecture?

- **🚀 Scalable** - Add features without restructuring existing code
- **🧹 Maintainable** - Related code stays co-located and organized  
- **👥 Team-friendly** - Clear ownership boundaries reduce conflicts
- **⚡ Efficient** - Better code splitting and faster development

## �️ Local Development

Want to contribute or run the documentation locally?

### Prerequisites
- Ruby 2.7+ with DevKit
- Bundler gem
- Git

### Setup
```bash
# Clone the repository
git clone https://github.com/ahmad2point0/react-app-folder-structure.git
cd react-app-folder-structure

# Install dependencies
bundle install

# Start the documentation server
bundle exec jekyll serve

# Visit http://localhost:4000
```

**Windows users:** Use `setup.bat` for automated setup, or see [SETUP.md](SETUP.md) for detailed instructions.

## 🤝 Contributing

We welcome contributions! Help us expand this collection:

- 🆕 **Add new framework templates**
- 🔧 **Improve existing structures**  
- 📚 **Enhance documentation**
- 🐛 **Fix bugs and issues**

### How to Contribute

1. **Fork this repository**
2. **Create a feature branch** (`git checkout -b add-nextjs-template`)
3. **Make your changes** following our patterns
4. **Test locally** with Jekyll
5. **Submit a pull request**

See our [Contributing Guide](https://ahmad2point0.github.io/folder-structures/contributing.html) for detailed instructions.

## 📄 License

MIT License - feel free to use these structures in your projects!

## 🔗 Links

- **📖 [Full Documentation](https://ahmad2point0.github.io/folder-structures)** - Complete guides and examples
- **🐛 [Issues](https://github.com/ahmad2point0/react-app-folder-structure/issues)** - Report bugs or request features
- **💬 [Discussions](https://github.com/ahmad2point0/react-app-folder-structure/discussions)** - Ask questions and share ideas

---

**🚀 Start building better React applications with proven folder structures!**

[Explore Templates →](https://ahmad2point0.github.io/folder-structures)
