# React App Folder Structure Templates

Battle-tested, scalable folder structures for React applications using feature-based architecture.

📖 **[View Documentation](https://ahmad2point0.github.io/react-app-folder-structure/)** | 🤝 **[Contributing Guide](contributing.md)** | 🛠️ **[Setup Instructions](SETUP.md)**

## 🎯 Why Feature-Based Architecture?

- **🚀 Scalable** - Easy to add features without restructuring
- **🧹 Maintainable** - Related code stays together
- **👥 Team-friendly** - Clear ownership and reduced conflicts
- **⚡ Efficient** - Faster development and better code splitting

## � Available Templates

| Framework | Status | Description | Link |
|-----------|--------|-------------|------|
| **React Native Expo** | ✅ Available | Mobile apps with Expo Router | [📱 View →](react-native-expo/README.md) |
| **Next.js App Router** | 🚧 Coming Soon | Full-stack web apps with App Router | 🔜 |
| **Vite + React** | 🚧 Coming Soon | Fast development with Vite | 🔜 |
| **Create React App** | 🚧 Coming Soon | Traditional React SPA | 🔜 |
| **React Native CLI** | 🚧 Coming Soon | Native development without Expo | 🔜 |
| **Remix** | 🚧 Coming Soon | Full-stack with server rendering | 🔜 |

## �️ Core Structure Pattern

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

## ⚡ Quick Start

1. Choose a template from the table above
2. Click the link to view detailed documentation
3. Copy the folder structure to your project
4. Follow the framework-specific setup guide

### 🔧 Running Documentation Locally

**Windows Users:**
```cmd
# Run the automated setup script
setup.bat

# Or manually:
# 1. Install Ruby from https://rubyinstaller.org/downloads/
# 2. Install dependencies
bundle install

# 3. Start the server
bundle exec jekyll serve
```

**macOS/Linux Users:**
```bash
# Install Ruby (if not already installed)
# macOS: brew install ruby
# Ubuntu: sudo apt-get install ruby-full

# Install dependencies
bundle install

# Start the server  
bundle exec jekyll serve
```

Then open `http://localhost:4000` to view the documentation.

📖 **Detailed setup instructions:** [SETUP.md](SETUP.md)

## 🤝 Contributing

Help us expand this collection! We're looking for:

- 🆕 **New framework templates**
- 🔧 **Structure improvements** 
- 📚 **Better documentation**
- 🐛 **Bug fixes**

### 📖 Documentation with Just the Docs

We use [Just the Docs](https://just-the-docs.github.io/just-the-docs/) for our documentation site. This provides:

- **Clean, searchable documentation**
- **Easy navigation between templates**
- **Mobile-responsive design**
- **Built-in search functionality**

### 🚀 For New Contributors

**Setting up documentation locally:**

1. **Fork this repository**
2. **Clone your fork:**
   ```bash
   git clone https://github.com/yourusername/react-app-folder-structure.git
   cd react-app-folder-structure
   ```

3. **Install Jekyll and dependencies:**
   ```bash
   gem install bundler jekyll
   bundle install
   ```

4. **Run the documentation site locally:**
   ```bash
   bundle exec jekyll serve
   ```
   Visit `http://localhost:4000` to see your changes

### 📝 Adding a New Framework Template

**Step-by-step guide:**

1. **Create framework folder:**
   ```
   your-framework/
   ├── README.md          # Main documentation
   ├── example/           # Example project structure
   └── assets/           # Framework-specific assets
   ```

2. **Update main README table:**
   - Add your framework to the table with ✅ Available status
   - Include description and link

3. **Documentation requirements:**
   - Follow the same structure as `react-native-expo/README.md`
   - Include real code examples
   - Add setup instructions
   - Provide best practices section

4. **Test your changes:**
   - Verify all links work
   - Check formatting in the Jekyll site
   - Ensure examples are correct

**How to contribute:**
1. Fork this repository
2. Create a new branch (`git checkout -b add-nextjs-template`)
3. Add your template or improvement
4. Test documentation locally with Jekyll
5. Submit a pull request with clear description

## 📄 License

MIT License - feel free to use in your projects!

---

**🚀 Start building with better structure today!**
