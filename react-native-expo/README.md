# React Native Expo App Folder Structure Guide

A comprehensive guide for organizing React Native Expo applications using feature-based architecture with Expo Router file-based routing.

## 📁 Project Structure Overview

```
src/
├── app/                          # Expo Router pages (screens) using file-based routing
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
│   ├── ui/                       # Buttons, Cards, TextInput React Native Components etc.
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
├── navigation/                   # Custom navigation helpers (Expo Router Linking)
│   └── navigationRef.ts
│
├── utils/                        # Helper functions (formatting, parsing, etc.)
│   ├── formatDate.ts
│   └── validateEmail.ts
│
├── types/                        # Global TypeScript types and interfaces
│   └── index.d.ts
│
├── service/                      # Global Service (Background Task fetch, App Store force Update)
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

### 2. Expo Router File-Based Routing

- **Expo Router**: Modern file-based routing system for React Native
- Parentheses `()` create route groups without affecting URL structure
- Square brackets `[]` create dynamic routes
- Native navigation performance with React Navigation under the hood

## 📂 Folder Breakdown

### `/app` - Expo Router File-Based Routing

The routing structure using Expo Router pattern:

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
import { AuthLoginForm } from '@/features/auth/components';

export default function LoginScreen() {
  return <AuthLoginForm />;
}

// app/(auth)/_layout.tsx
import { Stack } from 'expo-router';
import { AuthProvider } from '@/features/auth/store';

export default function AuthLayout() {
  return (
    <AuthProvider>
      <Stack>
        <Stack.Screen name="login" options={{ title: "Login" }} />
        <Stack.Screen name="register" options={{ title: "Register" }} />
      </Stack>
    </AuthProvider>
  );
}
```

### `/features` - Core Business Logic

Each feature contains everything related to that specific functionality:

```
features/auth/
├── components/        # Auth-specific React Native components
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

### `/components` - Reusable React Native UI Components

Global components used across features:

#### `/ui` - Basic React Native UI Elements

```typescript
// components/ui/Button.tsx
import { TouchableOpacity, Text, StyleSheet } from 'react-native';

interface ButtonProps {
  variant: "primary" | "secondary";
  children: React.ReactNode;
  onPress?: () => void;
}

export const Button: React.FC<ButtonProps> = ({ variant, children, onPress }) => {
  return (
    <TouchableOpacity 
      style={[styles.button, styles[variant]]} 
      onPress={onPress}
    >
      <Text style={styles.text}>{children}</Text>
    </TouchableOpacity>
  );
};

const styles = StyleSheet.create({
  button: {
    paddingHorizontal: 16,
    paddingVertical: 12,
    borderRadius: 8,
    alignItems: 'center',
  },
  primary: {
    backgroundColor: '#007AFF',
  },
  secondary: {
    backgroundColor: '#FF3B30',
  },
  text: {
    color: 'white',
    fontWeight: '600',
  },
});
```

#### `/shared` - Complex Shared Components

```typescript
// components/shared/AppHeader.tsx
import { View, Text, TouchableOpacity } from 'react-native';
import { router } from 'expo-router';

export const AppHeader = ({ title, showBack }: { title: string; showBack?: boolean }) => {
  return (
    <View style={styles.header}>
      {showBack && (
        <TouchableOpacity onPress={() => router.back()}>
          <Text>← Back</Text>
        </TouchableOpacity>
      )}
      <Text style={styles.title}>{title}</Text>
    </View>
  );
};
```

### `/assets` - Static Resources

Organized by asset type for React Native:

- `fonts/` - Custom fonts for React Native
- `icons/` - Icon files (PNG, SVG)
- `images/` - Images and graphics
- `lottie/` - Lottie animations for React Native
- `svg/` - SVG graphics with react-native-svg

### `/constants` - App-Wide Constants

```typescript
// constants/colors.ts
export const COLORS = {
  primary: "#007AFF",
  secondary: "#FF3B30",
  background: "#F2F2F7",
  text: "#000000",
  textSecondary: "#8E8E93",
};

// constants/endpoints.ts
export const API_ENDPOINTS = {
  auth: "/api/auth",
  users: "/api/users",
  chats: "/api/chats",
};
```

### `/lib` - Third-Party Integrations

Wrapper functions and configurations for React Native libraries:

```typescript
// lib/supabase.ts
import { createClient } from "@supabase/supabase-js";
import AsyncStorage from '@react-native-async-storage/async-storage';

export const supabase = createClient(
  process.env.EXPO_PUBLIC_SUPABASE_URL!,
  process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY!,
  {
    auth: {
      storage: AsyncStorage,
      autoRefreshToken: true,
      persistSession: true,
      detectSessionInUrl: false,
    },
  }
);

// lib/analytics.ts
import * as Analytics from 'expo-analytics';

export const trackEvent = (eventName: string, properties?: object) => {
  Analytics.track(eventName, properties);
};
```

### `/store` - Global State Management

```typescript
// store/auth.store.ts (Zustand example for React Native)
import { create } from "zustand";
import AsyncStorage from '@react-native-async-storage/async-storage';
import { persist } from 'zustand/middleware';

interface AuthState {
  user: User | null;
  isLoading: boolean;
  login: (user: User) => void;
  logout: () => void;
}

export const useAuthStore = create<AuthState>()(
  persist(
    (set) => ({
      user: null,
      isLoading: false,
      login: (user) => set({ user, isLoading: false }),
      logout: () => set({ user: null, isLoading: false }),
    }),
    {
      name: 'auth-storage',
      storage: AsyncStorage,
    }
  )
);
```

### `/hooks` - Global Custom Hooks

```typescript
// hooks/useTheme.ts
import { useColorScheme } from 'react-native';
import { useState, useEffect } from 'react';

export const useTheme = () => {
  const systemTheme = useColorScheme();
  const [theme, setTheme] = useState(systemTheme || 'light');

  useEffect(() => {
    setTheme(systemTheme || 'light');
  }, [systemTheme]);

  const toggleTheme = () => {
    setTheme(theme === "light" ? "dark" : "light");
  };

  return { theme, toggleTheme, isLight: theme === 'light' };
};
```

### `/navigation` - Custom Navigation Helpers

```typescript
// navigation/navigationRef.ts
import { router } from 'expo-router';
import * as Linking from 'expo-linking';

export const NavigationHelper = {
  // Navigate to external links
  openExternalLink: (url: string) => {
    Linking.openURL(url);
  },
  
  // Deep linking helpers
  createDeepLink: (path: string) => {
    return Linking.createURL(path);
  },
  
  // Custom navigation functions
  navigateToChat: (chatId: string) => {
    router.push(`/(chats)/${chatId}`);
  },
  
  resetToHome: () => {
    router.replace('/(tabs)/');
  },
};
```

### `/utils` - Helper Functions

```typescript
// utils/formatDate.ts
import { format } from 'date-fns';

export const formatDate = (date: Date): string => {
  return format(date, 'MMM dd, yyyy');
};

export const formatChatTime = (date: Date): string => {
  return format(date, 'HH:mm');
};

// utils/validateEmail.ts
export const validateEmail = (email: string): boolean => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
};

// utils/deviceInfo.ts
import { Dimensions, Platform } from 'react-native';

export const getDeviceInfo = () => {
  const { width, height } = Dimensions.get('window');
  return {
    width,
    height,
    isIOS: Platform.OS === 'ios',
    isAndroid: Platform.OS === 'android',
  };
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
  createdAt: Date;
}

export interface Chat {
  id: string;
  title: string;
  participants: User[];
  lastMessage?: Message;
  updatedAt: Date;
}

export interface Message {
  id: string;
  content: string;
  sender: User;
  chatId: string;
  createdAt: Date;
}

export interface ApiResponse<T> {
  data: T;
  message: string;
  success: boolean;
}

// React Native specific types
export type RootStackParamList = {
  '(auth)': undefined;
  '(tabs)': undefined;
  '(chats)/[id]': { id: string };
};
```

### `/service` - Global Services

Global services for React Native that handle app-wide functionality:

```typescript
// service/backgroundTask.ts
import * as BackgroundFetch from 'expo-background-fetch';
import * as TaskManager from 'expo-task-manager';

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

// Register background fetch
export const registerBackgroundFetch = async () => {
  return await BackgroundFetch.registerTaskAsync(BACKGROUND_FETCH_TASK, {
    minimumInterval: 15 * 60, // 15 minutes
    stopOnTerminate: false,
    startOnBoot: true,
  });
};

// service/appUpdateService.ts
import * as Updates from 'expo-updates';
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
import { Platform } from 'react-native';

Notifications.setNotificationHandler({
  handleNotification: async () => ({
    shouldShowAlert: true,
    shouldPlaySound: false,
    shouldSetBadge: false,
  }),
});

export class NotificationService {
  static async scheduleNotification(title: string, body: string, trigger: Date) {
    await Notifications.scheduleNotificationAsync({
      content: { title, body },
      trigger: { date: trigger }
    });
  }

  static async requestPermissions() {
    if (Platform.OS === 'android') {
      await Notifications.setNotificationChannelAsync('default', {
        name: 'default',
        importance: Notifications.AndroidImportance.MAX,
        vibrationPattern: [0, 250, 250, 250],
        lightColor: '#FF231F7C',
      });
    }

    const { status } = await Notifications.requestPermissionsAsync();
    return status === 'granted';
  }

  static async getPushToken() {
    const token = (await Notifications.getExpoPushTokenAsync()).data;
    return token;
  }
}
```

**Common React Native use cases:**
- **Background data sync** - Periodic API calls when app is backgrounded
- **App store force updates** - Check for mandatory app updates using Expo Updates
- **Push notification handling** - Global notification management with Expo Notifications
- **Analytics tracking** - App-wide analytics service
- **Crash reporting** - Global error tracking
- **File cleanup services** - Cache management and cleanup
- **Location tracking** - Background location services with Expo Location
- **Sync services** - Offline/online data synchronization

### `/config` - App Configuration

```typescript
// config/theme.ts
import { StyleSheet } from 'react-native';

export const theme = {
  colors: {
    primary: "#007AFF",
    secondary: "#FF3B30",
    background: "#FFFFFF",
    surface: "#F2F2F7",
    text: "#000000",
    textSecondary: "#8E8E93",
  },
  spacing: {
    xs: 4,
    sm: 8,
    md: 16,
    lg: 24,
    xl: 32,
  },
  typography: {
    fontSize: {
      small: 12,
      medium: 16,
      large: 20,
      xlarge: 24,
    },
    fontWeight: {
      normal: '400' as const,
      medium: '500' as const,
      semiBold: '600' as const,
      bold: '700' as const,
    }
  },
};

export const globalStyles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: theme.colors.background,
  },
  centered: {
    justifyContent: 'center',
    alignItems: 'center',
  },
  row: {
    flexDirection: 'row',
  },
  shadow: {
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
    elevation: 5,
  },
});

// config/env.ts
export const ENV = {
  API_URL: process.env.EXPO_PUBLIC_API_URL || "http://localhost:3000",
  SUPABASE_URL: process.env.EXPO_PUBLIC_SUPABASE_URL,
  SUPABASE_ANON_KEY: process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY,
};
```

## 🚀 React Native Expo Specific Features

### Expo Router Benefits

- **File-based routing** - Automatic route generation
- **Type-safe navigation** - Full TypeScript support
- **Native performance** - Built on React Navigation
- **Deep linking** - Automatic URL handling
- **Nested layouts** - Shared UI across routes

### React Native Optimizations

- **Platform-specific code** - iOS and Android adaptations
- **Native modules** - Access to device features
- **Performance optimizations** - Efficient rendering and state management
- **Offline capabilities** - Local storage and caching strategies

## 📝 Best Practices for React Native Expo

### 1. Import Organization

```typescript
// React Native core imports
import React from "react";
import { View, Text, StyleSheet } from "react-native";

// Expo imports
import { router } from "expo-router";
import * as SecureStore from 'expo-secure-store';

// Internal imports
import { Button } from "@/components/ui";
import { useAuth } from "@/features/auth/hooks";
import { COLORS } from "@/constants";
```

### 2. Styling Best Practices

```typescript
// Use StyleSheet.create for better performance
const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
  },
});

// Use platform-specific styles when needed
const platformStyles = StyleSheet.create({
  header: {
    ...Platform.select({
      ios: {
        paddingTop: 44,
      },
      android: {
        paddingTop: 24,
      },
    }),
  },
});
```

### 3. Feature Boundaries

- Keep features independent
- Communicate between features through:
  - Global state (Zustand/Redux)
  - Expo Router navigation
  - Event emitters
  - Shared services

### 4. Component Naming

- Use PascalCase for components: `ChatMessage`, `AuthButton`
- Be descriptive and include platform context when needed
- Prefix with feature when needed: `AuthLoginForm`

### 5. File Naming

- Use camelCase for utilities and services: `formatDate.ts`
- Use kebab-case for assets: `app-icon.png`
- Use PascalCase for components: `ChatMessage.tsx`

## 🔧 Path Aliases (Recommended)

Set up path aliases in your `tsconfig.json`:

```json
{
  "extends": "expo/tsconfig.base",
  "compilerOptions": {
    "strict": true,
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"],
      "@/components/*": ["src/components/*"],
      "@/features/*": ["src/features/*"],
      "@/utils/*": ["src/utils/*"],
      "@/constants/*": ["src/constants/*"],
      "@/assets/*": ["src/assets/*"]
    }
  }
}
```

## 📱 Expo Configuration

Update your `app.json` or `app.config.js`:

```json
{
  "expo": {
    "name": "Your App Name",
    "slug": "your-app-slug",
    "version": "1.0.0",
    "orientation": "portrait",
    "icon": "./src/assets/icon.png",
    "userInterfaceStyle": "light",
    "scheme": "yourapp",
    "splash": {
      "image": "./src/assets/splash.png",
      "resizeMode": "contain",
      "backgroundColor": "#ffffff"
    },
    "assetBundlePatterns": [
      "**/*"
    ],
    "ios": {
      "supportsTablet": true
    },
    "android": {
      "adaptiveIcon": {
        "foregroundImage": "./src/assets/adaptive-icon.png",
        "backgroundColor": "#FFFFFF"
      }
    },
    "web": {
      "favicon": "./src/assets/favicon.png"
    },
    "plugins": [
      "expo-router"
    ]
  }
}
```

## 📊 Benefits of This React Native Expo Structure

1. **Mobile-First Scalability**: Optimized for mobile app development patterns
2. **Expo Ecosystem Integration**: Takes full advantage of Expo's capabilities
3. **Native Performance**: Follows React Native best practices for optimal performance
4. **Type Safety**: Comprehensive TypeScript support throughout
5. **Cross-Platform**: Consistent structure for iOS and Android development
6. **Modern Routing**: Leverages Expo Router for efficient navigation

## 🚀 Getting Started with React Native Expo

1. **Install Expo CLI**: `npm install -g expo-cli`
2. **Create new project**: `npx create-expo-app --template`
3. **Apply this structure** to your project
4. **Set up path aliases** in `tsconfig.json`
5. **Install dependencies**: Expo Router, Zustand, React Native libraries
6. **Start developing** your features

## 📦 Recommended Dependencies

```json
{
  "dependencies": {
    "expo": "~49.0.0",
    "expo-router": "^2.0.0",
    "react": "18.2.0",
    "react-native": "0.72.0",
    "zustand": "^4.4.0",
    "@react-native-async-storage/async-storage": "1.18.2",
    "expo-secure-store": "~12.3.1",
    "expo-notifications": "~0.20.1",
    "expo-background-fetch": "~11.3.0"
  },
  "devDependencies": {
    "@types/react": "~18.2.14",
    "typescript": "^5.1.3"
  }
}
```

---

**Happy React Native Expo development! 🚀📱**

Start building your mobile application with a solid, scalable foundation optimized for the Expo ecosystem.
