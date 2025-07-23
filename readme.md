# React App Feature-Based Folder Structure Guide

A comprehensive guide for organizing React applications (Next.js, React Native Expo) using feature-based architecture with folder-based routing.

## 📁 Project Structure Overview

```
src/
├── app/                          # App Router pages (screens) using file-based routing
│   ├── (auth)/                   # Auth stack
│   │   ├── login.tsx
│   │   ├── register.tsx
│   │   └── _layout.tsx
│   ├── (tabs)/                   # Bottom tab layout
│   │   ├── index.tsx
│   │   └── _layout.tsx
│   ├── (chats)/                  # Nested route for chat
│   │   ├── [id].tsx              # Dynamic chat screen
│   │   └── _layout.tsx
│   ├── (orders)/                 # Order screens
│   │   └── index.tsx
│   └── _layout.tsx              # Root layout
│
├── assets/                       # Static assets
│   ├── fonts/
│   ├── icons/
│   ├── images/
│   ├── lottie/
│   └── svg/
│
├── features/                     # Feature-based modules (recommended!)
│   ├── auth/
│   │   ├── components/
│   │   ├── hooks/
│   │   ├── services/
│   │   └── types.ts
│   ├── chat/
│   ├── orders/
│   └── home/
│
├── components/                   # Global reusable components
│   ├── ui/                       # Buttons, Cards, TextInput shadcn Components etc.
│   └── shared/                   # AppHeader, Loader, etc.
│
├── constants/                    # App-wide constants
│   ├── colors.ts
│   ├── strings.ts
│   └── endpoints.ts
│
├── lib/                          # Third-party libs, wrappers, and integrations
│   ├── supabase.ts
│   └── analytics.ts
│
├── store/                        # Global state management (Zustand, Redux, etc.)
│   └── auth.store.ts
│
├── hooks/                        # Global custom hooks
│   └── useTheme.ts
│
├── navigation/                   # Custom navigation helpers (if needed) e.g (Linking: Go To external Link)
│   └── navigationRef.ts
│
├── utils/                        # Helper functions (formatting, parsing, etc.)
│   ├── formatDate.ts
│   └── validateEmail.ts
│
├── types/                        # Global TypeScript types and interfaces
│   └── index.d.ts
│
├── service/                      # Global Service (e.g Background Task fetch, Play store force Update )
│   └── backgroundTask.ts
│
└── config/                       # App configuration (themes, env, API setup)
    ├── theme.ts
    ├── env.ts
    └── apiClient.ts
```

## 🎯 Key Principles

### 1. Feature-Based Architecture

- **Organize by features, not by file types**
- Each feature is self-contained with its own components, hooks, services, and types
- Promotes modularity and maintainability
- Easy to scale and test individual features

### 2. File-Based Routing

- **Next.js App Router**: Uses the `app/` directory for routing
- **Expo Router**: Similar file-based routing system
- Parentheses `()` create route groups without affecting URL structure
- Square brackets `[]` create dynamic routes

## 📂 Folder Breakdown

### `/app` - File-Based Routing

The routing structure using modern App Router pattern:

#### Route Groups `()`

- `(auth)/` - Authentication screens (login, register)
- `(tabs)/` - Bottom navigation tabs
- `(chats)/` - Chat-related screens
- `(orders)/` - Order management screens

#### Special Files

- `_layout.tsx` - Layout components for route segments
- `[id].tsx` - Dynamic route parameters
- `index.tsx` - Default route for a segment

#### Example Structure:

```typescript
// app/(auth)/login.tsx
export default function LoginScreen() {
  return <AuthLoginForm />;
}

// app/(auth)/_layout.tsx
export default function AuthLayout({ children }) {
  return <AuthProvider>{children}</AuthProvider>;
}
```

### `/features` - Core Business Logic

Each feature contains everything related to that specific functionality:

```
features/auth/
├── components/        # Auth-specific components
│   ├── LoginForm.tsx
│   ├── RegisterForm.tsx
│   └── AuthButton.tsx
├── hooks/            # Auth-related hooks
│   ├── useAuth.ts
│   └── useAuthForm.ts
├── services/         # API calls and business logic
│   ├── authApi.ts
│   └── authValidation.ts
├── store/           # Feature-specific state
│   └── authStore.ts
└── types.ts         # Auth-related TypeScript types
```

### `/components` - Reusable UI Components

Global components used across features:

#### `/ui` - Basic UI Elements

```typescript
// components/ui/Button.tsx
interface ButtonProps {
  variant: "primary" | "secondary";
  children: React.ReactNode;
}

export const Button: React.FC<ButtonProps> = ({ variant, children }) => {
  // Implementation
};
```

#### `/shared` - Complex Shared Components

```typescript
// components/shared/AppHeader.tsx
export const AppHeader = ({ title, showBack }) => {
  // Implementation
};
```

### `/assets` - Static Resources

Organized by asset type for easy management:

- `fonts/` - Custom fonts
- `icons/` - Icon files (PNG, SVG)
- `images/` - Images and graphics
- `lottie/` - Lottie animations
- `svg/` - SVG graphics

### `/constants` - App-Wide Constants

```typescript
// constants/colors.ts
export const COLORS = {
  primary: "#007AFF",
  secondary: "#FF3B30",
  background: "#F2F2F7",
};

// constants/endpoints.ts
export const API_ENDPOINTS = {
  auth: "/api/auth",
  users: "/api/users",
};
```

### `/lib` - Third-Party Integrations

Wrapper functions and configurations for external libraries:

```typescript
// lib/supabase.ts
import { createClient } from "@supabase/supabase-js";

export const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_ANON_KEY
);
```

### `/store` - Global State Management

```typescript
// store/auth.store.ts (Zustand example)
import { create } from "zustand";

interface AuthState {
  user: User | null;
  login: (user: User) => void;
  logout: () => void;
}

export const useAuthStore = create<AuthState>((set) => ({
  user: null,
  login: (user) => set({ user }),
  logout: () => set({ user: null }),
}));
```

### `/hooks` - Global Custom Hooks

```typescript
// hooks/useTheme.ts
export const useTheme = () => {
  const [theme, setTheme] = useState("light");

  const toggleTheme = () => {
    setTheme(theme === "light" ? "dark" : "light");
  };

  return { theme, toggleTheme };
};
```

### `/utils` - Helper Functions

```typescript
// utils/formatDate.ts
export const formatDate = (date: Date): string => {
  return new Intl.DateTimeFormat("en-US").format(date);
};

// utils/validateEmail.ts
export const validateEmail = (email: string): boolean => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
};
```

### `/types` - Global TypeScript Definitions

```typescript
// types/index.d.ts
export interface User {
  id: string;
  email: string;
  name: string;
  avatar?: string;
}

export interface ApiResponse<T> {
  data: T;
  message: string;
  success: boolean;
}
```

### `/service` - Global Services

Global services that run independently and handle app-wide functionality:

```typescript
// service/backgroundTask.ts
import { BackgroundFetch } from 'expo-background-fetch';
import { TaskManager } from 'expo-task-manager';

const BACKGROUND_FETCH_TASK = 'background-fetch';

// Define the background task
TaskManager.defineTask(BACKGROUND_FETCH_TASK, async () => {
  try {
    // Fetch data, sync offline content, etc.
    const data = await syncOfflineData();
    console.log('Background sync completed:', data);
    return BackgroundFetch.BackgroundFetchResult.NewData;
  } catch (error) {
    console.error('Background task failed:', error);
    return BackgroundFetch.BackgroundFetchResult.Failed;
  }
});

// service/appUpdateService.ts
import { Updates } from 'expo-updates';
import { Alert } from 'react-native';

export class AppUpdateService {
  static async checkForUpdates() {
    try {
      const update = await Updates.checkForUpdateAsync();
      if (update.isAvailable) {
        Alert.alert(
          'Update Available',
          'A new version is available. Update now?',
          [
            { text: 'Later', style: 'cancel' },
            { text: 'Update', onPress: this.downloadAndReload }
          ]
        );
      }
    } catch (error) {
      console.error('Update check failed:', error);
    }
  }

  private static async downloadAndReload() {
    await Updates.fetchUpdateAsync();
    await Updates.reloadAsync();
  }
}

// service/notificationService.ts
import * as Notifications from 'expo-notifications';

export class NotificationService {
  static async scheduleNotification(title: string, body: string, trigger: Date) {
    await Notifications.scheduleNotificationAsync({
      content: { title, body },
      trigger: { date: trigger }
    });
  }

  static async requestPermissions() {
    const { status } = await Notifications.requestPermissionsAsync();
    return status === 'granted';
  }
}
```

**Common use cases:**
- **Background data sync** - Periodic API calls when app is backgrounded
- **App store force updates** - Check for mandatory app updates
- **Push notification handling** - Global notification management
- **Analytics tracking** - App-wide analytics service
- **Crash reporting** - Global error tracking
- **File cleanup services** - Cache management and cleanup
- **Location tracking** - Background location services
- **Sync services** - Offline/online data synchronization

### `/config` - App Configuration

```typescript
// config/theme.ts
export const theme = {
  colors: {
    primary: "#007AFF",
    secondary: "#FF3B30",
  },
  spacing: {
    xs: 4,
    sm: 8,
    md: 16,
    lg: 24,
  },
};

// config/env.ts
export const ENV = {
  API_URL: process.env.NEXT_PUBLIC_API_URL || "http://localhost:3000",
  SUPABASE_URL: process.env.NEXT_PUBLIC_SUPABASE_URL,
};
```

## 🚀 Framework-Specific Adaptations

### Next.js App Router

- Use `app/` directory for routing
- Server and client components
- Built-in layouts and loading states

### React Native Expo

- Use Expo Router for file-based routing
- Navigation between screens
- Tab and stack navigators through file structure

### Create React App / Vite

- Use React Router for routing
- Adapt the `app/` structure to your routing library
- Keep the feature-based organization

## 📝 Best Practices

### 1. Import Organization

```typescript
// External libraries
import React from "react";
import { View, Text } from "react-native";

// Internal imports
import { Button } from "@/components/ui";
import { useAuth } from "@/features/auth/hooks";
import { COLORS } from "@/constants";
```

### 2. Feature Boundaries

- Keep features independent
- Communicate between features through:
  - Global state
  - Events
  - Shared services

### 3. Component Naming

- Use PascalCase for components
- Be descriptive: `LoginForm` not `Form`
- Prefix with feature when needed: `AuthButton`

### 4. File Naming

- Use camelCase for utilities and services
- Use kebab-case for assets
- Use PascalCase for components

## 🔧 Path Aliases (Recommended)

Set up path aliases in your bundler configuration:

```json
// tsconfig.json or jsconfig.json
{
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"],
      "@/components/*": ["src/components/*"],
      "@/features/*": ["src/features/*"],
      "@/utils/*": ["src/utils/*"],
      "@/constants/*": ["src/constants/*"]
    }
  }
}
```

## 📊 Benefits of This Structure

1. **Scalability**: Easy to add new features without restructuring
2. **Maintainability**: Related code is co-located
3. **Team Collaboration**: Clear ownership and boundaries
4. **Testing**: Easy to test features in isolation
5. **Code Reuse**: Clear separation of reusable vs feature-specific code
6. **Performance**: Better tree-shaking and code splitting

## 🚀 Getting Started

1. **Clone this structure** into your new project
2. **Set up path aliases** in your bundler configuration
3. **Create your first feature** in the `/features` directory
4. **Add routing** in the `/app` directory
5. **Build reusable components** in `/components/ui`

## 🤝 Contributing

Feel free to suggest improvements or adaptations for specific frameworks and use cases.

---

**Happy coding! 🚀**
