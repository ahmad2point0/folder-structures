---
layout: default
title: Contributing
nav_order: 3
---

# Contributing Guide
{: .no_toc }

Help us expand this collection of React folder structure templates!
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## What We're Looking For

- 🆕 **New framework templates** (Next.js, Vite, Create React App, etc.)
- 🔧 **Structure improvements** for existing templates
- 📚 **Better documentation** and examples
- 🐛 **Bug fixes** and optimizations

---

## Documentation with Just the Docs

We use [Just the Docs](https://just-the-docs.github.io/just-the-docs/) for our documentation site. This provides:

- **Clean, searchable documentation**
- **Easy navigation between templates**
- **Mobile-responsive design**
- **Built-in search functionality**
- **GitHub Pages integration**

---

## Setting Up Local Development

### Prerequisites

- Ruby 2.7 or higher
- Bundler gem
- Git

### Local Setup

1. **Fork and clone the repository:**
   ```bash
   git clone https://github.com/yourusername/react-app-folder-structure.git
   cd react-app-folder-structure
   ```

2. **Install Jekyll and dependencies:**
   ```bash
   gem install bundler jekyll
   bundle install
   ```

3. **Run the documentation site locally:**
   ```bash
   bundle exec jekyll serve
   ```
   
4. **View your changes:**
   Open `http://localhost:4000` in your browser

{: .note }
Changes to `_config.yml` require restarting the Jekyll server.

---

## Adding a New Framework Template

### Step 1: Create Template Structure

Create a new folder for your framework:

```
your-framework/
├── README.md          # Main documentation
├── example/           # Example project structure
│   ├── src/
│   │   ├── app/
│   │   ├── features/
│   │   └── ...
└── assets/           # Framework-specific assets
```

### Step 2: Documentation Requirements

Your `README.md` should include:

- **Framework-specific folder structure**
- **Real code examples** (not just comments)
- **Setup instructions** 
- **Best practices section**
- **Path alias configuration**
- **Dependencies and configurations**

Use the [React Native Expo template]({% link react-native-expo.md %}) as a reference.

### Step 3: Create Jekyll Documentation Page

Create a `.md` file in the root directory:

```markdown
---
layout: default
title: Your Framework
nav_order: 4
---

# Your Framework Folder Structure
{: .no_toc }

Description of your framework template.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

[Rest of your documentation]
```

### Step 4: Update Main Documentation

1. **Update the templates table** in `index.md`
2. **Change status** from 🚧 Coming Soon to ✅ Available
3. **Add proper link** to your documentation page

### Step 5: Test Your Changes

Before submitting:

- [ ] All links work correctly
- [ ] Documentation renders properly in Jekyll
- [ ] Code examples are tested and correct
- [ ] No broken internal links
- [ ] Mobile responsive layout works

---

## Documentation Style Guide

### Markdown Conventions

- Use `{: .fs-6 .fw-300 }` for subtitles
- Use `{: .no_toc }` for headers that shouldn't appear in TOC
- Use code blocks with proper syntax highlighting
- Include table of contents for long pages

### Code Examples

Always provide **complete, working examples**:

```typescript
// ✅ Good - Complete example
import { View, Text, StyleSheet } from 'react-native';

export const Button = ({ title, onPress }) => (
  <TouchableOpacity style={styles.button} onPress={onPress}>
    <Text style={styles.text}>{title}</Text>
  </TouchableOpacity>
);

const styles = StyleSheet.create({
  button: { padding: 16, backgroundColor: '#007AFF' },
  text: { color: 'white', fontWeight: 'bold' }
});
```

```typescript
// ❌ Avoid - Incomplete examples
export const Button = ({ title, onPress }) => {
  // Implementation here
};
```

### Folder Structure Visualization

Use consistent formatting for folder structures:

```
src/
├── app/           # File-based routing
├── features/      # Feature modules
│   ├── auth/
│   │   ├── components/
│   │   ├── hooks/
│   │   └── types.ts
│   └── chat/
└── components/    # Shared components
```

---

## Pull Request Process

### 1. Branch Naming

Use descriptive branch names:
- `add-nextjs-template`
- `improve-expo-docs`
- `fix-broken-links`

### 2. Commit Messages

Write clear commit messages:
- `feat: add Next.js App Router template`
- `docs: improve setup instructions`
- `fix: correct path alias examples`

### 3. Pull Request Template

Include in your PR description:

```markdown
## Changes Made
- [ ] Added new framework template
- [ ] Updated documentation
- [ ] Fixed existing issues

## Checklist
- [ ] Tested locally with Jekyll
- [ ] All links work correctly
- [ ] Code examples are complete and tested
- [ ] Follows existing documentation style

## Screenshots
[If applicable, add screenshots of documentation changes]
```

### 4. Review Process

1. **Automated checks** will run on your PR
2. **Manual review** by maintainers
3. **Feedback and iteration** if needed
4. **Merge** once approved

---

## Getting Help

- 💬 **GitHub Discussions** - Ask questions and share ideas
- 🐛 **GitHub Issues** - Report bugs or request features  
- 📧 **Direct Contact** - Reach out for collaboration

{: .highlight }
New to open source? Don't worry! We're here to help you make your first contribution. Feel free to ask questions in the discussions.
