# React App Feature-Based Folder Structure Guide

A comprehensive guide for organizing React applications using feature-based architecture with modern file-based routing.

## 🚀 Quick Navigation

### 📋 Choose Your Framework:

| Framework | Description | Link |
|-----------|-------------|------|
| 🌐 **Next.js** | Web applications with SSR/SSG | [📖 Next.js Guide](#-nextjs-app-router-structure) |
| 📱 **React Native Expo** | Cross-platform mobile apps | [📖 Expo Guide](#-react-native-expo-structure) |
| ⚛️ **React (CRA/Vite)** | Traditional React apps | [📖 React Guide](#-create-react-app--vite) |

---

## 🎯 Core Principles

### ✨ Why Feature-Based Architecture?

**Traditional approach (❌ Don't do this):**
```
src/
├── components/     # All components mixed together
├── hooks/          # All hooks mixed together  
├── services/       # All services mixed together
└── utils/          # All utilities mixed together
```

**Feature-based approach (✅ Recommended):**
```
src/
├── features/
│   ├── auth/       # Everything auth-related
│   ├── chat/       # Everything chat-related
│   └── orders/     # Everything order-related
├── components/ui/  # Shared UI components only
└── app/           # File-based routing
```

### 🔑 Key Benefits:
- **🎯 Focused Development** - Work on one feature at a time
- **🔧 Easy Maintenance** - Related code lives together
- **👥 Team Collaboration** - Clear feature ownership
- **🧪 Better Testing** - Test features in isolation
- **📈 Scalability** - Add features without restructuring

---

## 🌐 Next.js App Router Structure

Perfect for **web applications** with server-side rendering, static generation, and API routes.

### 📁 Folder Overview
```
my-nextjs-app/
├── src/
│   ├── app/                    # Next.js App Router
│   │   ├── (auth)/            # Route group - Auth pages
│   │   ├── (dashboard)/       # Route group - Protected pages  
│   │   ├── api/               # API routes
│   │   └── page.tsx           # Home page
│   ├── features/              # Feature modules
│   ├── components/ui/         # shadcn/ui components
│   └── lib/                   # Configurations
└── public/                    # Static assets
```

### 🎯 Next.js Specific Features:
- ✅ **App Router** with `page.tsx`, `layout.tsx`, `loading.tsx`
- ✅ **API Routes** co-located with frontend code
- ✅ **Server Components** by default
- ✅ **Route Groups** for organization
- ✅ **Built-in SEO** and metadata

**[📖 View Complete Next.js Guide →](#detailed-nextjs-implementation)**

---

## 📱 React Native Expo Structure

Perfect for **cross-platform mobile apps** with native features and easy deployment.

### 📁 Folder Overview
```
my-expo-app/
├── src/
│   ├── app/                    # Expo Router
│   │   ├── (auth)/            # Auth stack
│   │   ├── (tabs)/            # Tab navigation
│   │   ├── (modals)/          # Modal screens
│   │   └── _layout.tsx        # Root layout
│   ├── features/              # Feature modules
│   ├── components/ui/         # UI components
│   ├── assets/                # Images, fonts, sounds
│   └── services/              # Background tasks, notifications
└── assets/                    # Expo root assets
```

### 🎯 Expo Specific Features:
- ✅ **Expo Router** with file-based routing
- ✅ **Tab & Stack Navigation** through layouts
- ✅ **Native Services** (camera, notifications, etc.)
- ✅ **Cross-platform** (iOS, Android, Web)
- ✅ **Easy Deployment** with EAS Build

**[📖 View Complete Expo Guide →](#detailed-expo-implementation)**

---

## ⚛️ Create React App / Vite

For traditional React applications with custom routing solutions.

### 📁 Folder Overview
```
my-react-app/
├── src/
│   ├── pages/                 # Route components
│   ├── features/              # Feature modules
│   ├── components/ui/         # UI components
│   ├── hooks/                 # Global hooks
│   └── utils/                 # Helper functions
└── public/                    # Static assets
```

### 🎯 Traditional React Features:
- ✅ **React Router** for navigation
- ✅ **Flexible architecture** for any use case  
- ✅ **Custom build** configurations
- ✅ **Third-party routing** libraries

---

## 🏗️ Universal Feature Structure

**This structure works across ALL React frameworks:**

```typescript
features/auth/
├── components/           # Feature-specific components
│   ├── LoginForm.tsx
│   ├── SignUpForm.tsx
│   └── AuthButton.tsx
├── hooks/               # Feature-specific hooks
│   ├── useAuth.ts
│   └── useAuthForm.ts
├── services/            # API calls & business logic
│   ├── authApi.ts
│   └── authValidation.ts
├── store/              # Feature-specific state
│   └── authStore.ts
├── types.ts            # Feature-specific types
└── index.ts            # Public API exports
```

### 💡 Pro Tips:
- **Keep features independent** - Avoid cross-feature imports
- **Use barrel exports** - Clean public APIs with `index.ts`
- **Co-locate related code** - Tests, stories, etc. near components
- **Consistent naming** - Use clear, descriptive names

---

## 🔧 Setup Instructions

### 1. **Choose Your Framework** (click links above)
### 2. **Set up Path Aliases**
```json
// tsconfig.json
{
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"],
      "@/features/*": ["src/features/*"],
      "@/components/*": ["src/components/*"]
    }
  }
}
```

### 3. **Create Your First Feature**
```bash
mkdir src/features/auth
mkdir src/features/auth/{components,hooks,services}
touch src/features/auth/{types.ts,index.ts}
```

### 4. **Start Building**
- Add routing in your framework's routing directory
- Build reusable components in `/components/ui`
- Create feature-specific logic in `/features`

---

## 📚 Detailed Framework Guides

Choose your framework below for complete implementation details:

<details>
<summary><h3>📖 Detailed Next.js Implementation</h3></summary>

### 🌐 Complete Next.js App Router Structure

```
my-nextjs-app/
├── src/
│   ├── app/                      # Next.js App Router (file-based routing)
│   │   ├── (auth)/              # Route group - Auth pages
│   │   │   ├── login/
│   │   │   │   └── page.tsx
│   │   │   ├── register/
│   │   │   │   └── page.tsx
│   │   │   └── layout.tsx
│   │   ├── (dashboard)/         # Route group - Protected pages
│   │   │   ├── dashboard/
│   │   │   │   └── page.tsx
│   │   │   ├── profile/
│   │   │   │   └── page.tsx
│   │   │   └── layout.tsx
│   │   ├── api/                 # API routes
│   │   │   ├── auth/
│   │   │   │   └── route.ts
│   │   │   └── users/
│   │   │       └── route.ts
│   │   ├── globals.css
│   │   ├── layout.tsx           # Root layout
│   │   ├── loading.tsx          # Global loading UI
│   │   ├── error.tsx            # Global error UI
│   │   ├── not-found.tsx        # 404 page
│   │   └── page.tsx             # Home page
│   │
│   ├── features/                # Feature-based modules
│   │   ├── auth/
│   │   │   ├── components/
│   │   │   │   ├── LoginForm.tsx
│   │   │   │   └── SignUpForm.tsx
│   │   │   ├── hooks/
│   │   │   │   └── useAuth.ts
│   │   │   ├── services/
│   │   │   │   └── authApi.ts
│   │   │   ├── server/          # Server-side code
│   │   │   │   └── authActions.ts
│   │   │   └── types.ts
│   │   ├── dashboard/
│   │   └── profile/
│   │
│   ├── components/              # Global reusable components
│   │   ├── ui/                  # shadcn/ui components
│   │   │   ├── button.tsx
│   │   │   ├── input.tsx
│   │   │   └── card.tsx
│   │   └── shared/              # App-specific shared components
│   │       ├── Header.tsx
│   │       ├── Footer.tsx
│   │       └── Sidebar.tsx
│   │
│   ├── lib/                     # Third-party lib configurations
│   │   ├── auth.ts              # NextAuth config
│   │   ├── db.ts                # Database connection
│   │   ├── utils.ts             # cn() and other utilities
│   │   └── validations.ts       # Zod schemas
│   │
│   ├── hooks/                   # Global custom hooks
│   │   ├── useLocalStorage.ts
│   │   └── useDebounce.ts
│   │
│   ├── store/                   # Global state management
│   │   ├── authStore.ts
│   │   └── uiStore.ts
│   │
│   ├── constants/               # App-wide constants
│   │   ├── routes.ts
│   │   └── config.ts
│   │
│   ├── types/                   # Global TypeScript types
│   │   └── index.d.ts
│   │
│   └── styles/                  # Global styles
│       ├── globals.css
│       └── components.css
│
├── public/                      # Static assets
│   ├── images/
│   ├── icons/
│   └── favicon.ico
│
├── prisma/                      # Database schema (if using Prisma)
│   └── schema.prisma
│
├── .env.local                   # Environment variables
├── next.config.js              # Next.js configuration
├── tailwind.config.js          # Tailwind CSS config
├── tsconfig.json               # TypeScript config
└── package.json
```

#### Next.js Specific Implementation Examples:

```typescript
// app/layout.tsx - Root Layout
import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: 'My Next.js App',
  description: 'Built with Next.js App Router',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>{children}</body>
    </html>
  )
}

// app/(auth)/layout.tsx - Auth Layout
export default function AuthLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <div className="min-h-screen flex items-center justify-center">
      <div className="max-w-md w-full space-y-8">
        {children}
      </div>
    </div>
  )
}

// app/(auth)/login/page.tsx - Login Page
import { LoginForm } from '@/features/auth/components/LoginForm'

export default function LoginPage() {
  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Sign In</h1>
      <LoginForm />
    </div>
  )
}

// app/api/auth/route.ts - API Route
import { NextRequest, NextResponse } from 'next/server'

export async function POST(request: NextRequest) {
  const { email, password } = await request.json()
  
  // Authentication logic
  
  return NextResponse.json({ success: true })
}

// features/auth/server/authActions.ts - Server Actions
'use server'

import { redirect } from 'next/navigation'

export async function loginAction(formData: FormData) {
  const email = formData.get('email') as string
  const password = formData.get('password') as string
  
  // Server-side authentication logic
  
  redirect('/dashboard')
}
```

#### Next.js Configuration:

```javascript
// next.config.js
/** @type {import('next').NextConfig} */
const nextConfig = {
  experimental: {
    typedRoutes: true,
  },
  images: {
    domains: ['example.com'],
  },
}

module.exports = nextConfig
```

</details>

<details>
<summary><h3>📖 Detailed Expo Implementation</h3></summary>

### 📱 Complete React Native Expo Structure

```
my-expo-app/
├── src/
│   ├── app/                     # Expo Router (file-based routing)
│   │   ├── (auth)/             # Route group - Auth stack
│   │   │   ├── login.tsx
│   │   │   ├── register.tsx
│   │   │   └── _layout.tsx
│   │   ├── (tabs)/             # Route group - Tab navigation
│   │   │   ├── index.tsx       # Home tab
│   │   │   ├── explore.tsx     # Explore tab
│   │   │   ├── profile.tsx     # Profile tab
│   │   │   └── _layout.tsx
│   │   ├── (modals)/           # Route group - Modal screens
│   │   │   ├── settings.tsx
│   │   │   └── _layout.tsx
│   │   ├── chat/
│   │   │   ├── [id].tsx        # Dynamic chat screen
│   │   │   └── _layout.tsx
│   │   ├── +html.tsx           # Custom HTML (web)
│   │   ├── +not-found.tsx      # 404 screen
│   │   └── _layout.tsx         # Root layout
│   │
│   ├── features/               # Feature-based modules
│   │   ├── auth/
│   │   │   ├── components/
│   │   │   │   ├── LoginForm.tsx
│   │   │   │   └── SocialLogin.tsx
│   │   │   ├── hooks/
│   │   │   │   ├── useAuth.ts
│   │   │   │   └── useBiometric.ts
│   │   │   ├── services/
│   │   │   │   ├── authApi.ts
│   │   │   │   └── secureStorage.ts
│   │   │   └── types.ts
│   │   ├── chat/
│   │   ├── camera/
│   │   └── notifications/
│   │
│   ├── components/             # Global reusable components
│   │   ├── ui/                 # Basic UI components
│   │   │   ├── Button.tsx
│   │   │   ├── Input.tsx
│   │   │   ├── Card.tsx
│   │   │   └── LoadingSpinner.tsx
│   │   └── shared/             # App-specific shared components
│   │       ├── Header.tsx
│   │       ├── TabBar.tsx
│   │       └── Modal.tsx
│   │
│   ├── assets/                 # Static assets
│   │   ├── fonts/
│   │   │   ├── SpaceMono.ttf
│   │   │   └── Inter.ttf
│   │   ├── images/
│   │   │   ├── logo.png
│   │   │   └── placeholder.png
│   │   ├── icons/
│   │   │   ├── home.svg
│   │   │   └── profile.svg
│   │   ├── lottie/
│   │   │   └── loading.json
│   │   └── sounds/
│   │       └── notification.mp3
│   │
│   ├── constants/              # App-wide constants
│   │   ├── Colors.ts
│   │   ├── Layout.ts
│   │   └── Config.ts
│   │
│   ├── hooks/                  # Global custom hooks
│   │   ├── useColorScheme.ts
│   │   ├── useAsyncStorage.ts
│   │   └── useNetworkStatus.ts
│   │
│   ├── store/                  # Global state management
│   │   ├── authStore.ts
│   │   ├── settingsStore.ts
│   │   └── chatStore.ts
│   │
│   ├── services/               # Global services
│   │   ├── backgroundTask.ts
│   │   ├── pushNotifications.ts
│   │   ├── analytics.ts
│   │   └── crashReporting.ts
│   │
│   ├── utils/                  # Helper functions
│   │   ├── formatters.ts
│   │   ├── validators.ts
│   │   └── deviceInfo.ts
│   │
│   ├── types/                  # Global TypeScript types
│   │   └── index.d.ts
│   │
│   └── config/                 # App configuration
│       ├── database.ts
│       ├── api.ts
│       └── theme.ts
│
├── assets/                     # Expo assets (root level)
│   ├── adaptive-icon.png
│   ├── icon.png
│   └── splash.png
│
├── .env                        # Environment variables
├── app.json                    # Expo configuration
├── babel.config.js             # Babel configuration
├── expo-env.d.ts              # Expo TypeScript declarations
├── tsconfig.json              # TypeScript config
└── package.json
```

#### Expo Specific Implementation Examples:

```typescript
// app/_layout.tsx - Root Layout
import { Stack } from 'expo-router'
import { useFonts } from 'expo-font'
import * as SplashScreen from 'expo-splash-screen'
import { useEffect } from 'react'

SplashScreen.preventAutoHideAsync()

export default function RootLayout() {
  const [loaded, error] = useFonts({
    SpaceMono: require('../assets/fonts/SpaceMono-Regular.ttf'),
  })

  useEffect(() => {
    if (loaded || error) {
      SplashScreen.hideAsync()
    }
  }, [loaded, error])

  if (!loaded && !error) {
    return null
  }

  return (
    <Stack>
      <Stack.Screen name="(tabs)" options={{ headerShown: false }} />
      <Stack.Screen name="(auth)" options={{ headerShown: false }} />
      <Stack.Screen name="(modals)" options={{ presentation: 'modal' }} />
    </Stack>
  )
}

// app/(tabs)/_layout.tsx - Tab Navigation
import { Tabs } from 'expo-router'
import { TabBarIcon } from '@/components/ui/TabBarIcon'

export default function TabLayout() {
  return (
    <Tabs
      screenOptions={{
        tabBarActiveTintColor: '#007AFF',
        headerShown: false,
      }}>
      <Tabs.Screen
        name="index"
        options={{
          title: 'Home',
          tabBarIcon: ({ color, focused }) => (
            <TabBarIcon name={focused ? 'home' : 'home-outline'} color={color} />
          ),
        }}
      />
      <Tabs.Screen
        name="explore"
        options={{
          title: 'Explore',
          tabBarIcon: ({ color, focused }) => (
            <TabBarIcon name={focused ? 'compass' : 'compass-outline'} color={color} />
          ),
        }}
      />
    </Tabs>
  )
}

// services/pushNotifications.ts - Expo specific service
import * as Notifications from 'expo-notifications'
import * as Device from 'expo-device'
import Constants from 'expo-constants'

Notifications.setNotificationHandler({
  handleNotification: async () => ({
    shouldShowAlert: true,
    shouldPlaySound: false,
    shouldSetBadge: false,
  }),
})

export async function registerForPushNotificationsAsync() {
  let token
  
  if (Device.isDevice) {
    const { status: existingStatus } = await Notifications.getPermissionsAsync()
    let finalStatus = existingStatus
    
    if (existingStatus !== 'granted') {
      const { status } = await Notifications.requestPermissionsAsync()
      finalStatus = status
    }
    
    if (finalStatus !== 'granted') {
      alert('Failed to get push token for push notification!')
      return
    }
    
    token = await Notifications.getExpoPushTokenAsync({
      projectId: Constants.expoConfig?.extra?.eas?.projectId,
    })
  }
  
  return token?.data
}
```

#### Expo Configuration:

```json
// app.json
{
  "expo": {
    "name": "my-expo-app",
    "slug": "my-expo-app",
    "version": "1.0.0",
    "orientation": "portrait",
    "icon": "./assets/icon.png",
    "userInterfaceStyle": "light",
    "splash": {
      "image": "./assets/splash.png",
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
        "foregroundImage": "./assets/adaptive-icon.png",
        "backgroundColor": "#ffffff"
      }
    },
    "web": {
      "favicon": "./assets/favicon.png",
      "bundler": "metro"
    },
    "plugins": [
      "expo-router",
      "expo-font"
    ],
    "experiments": {
      "typedRoutes": true
    }
  }
}
```

</details>

---

## 🔄 Key Framework Differences

| Feature | Next.js App Router | React Native Expo | React (CRA/Vite) |
|---------|-------------------|-------------------|------------------|
| **Routing** | `page.tsx`, `layout.tsx` | `.tsx` files, `_layout.tsx` | React Router |
| **Navigation** | Built-in navigation | Expo Router with Stack/Tabs | Custom routing |
| **Styling** | CSS, Tailwind, CSS-in-JS | StyleSheet, styled-components | CSS, CSS-in-JS |
| **Assets** | `public/` folder | `assets/` + `src/assets/` | `public/` folder |
| **API** | API routes in `app/api/` | External API calls only | External APIs |
| **State** | Server/Client state | Client state only | Client state |
| **Platform** | Web (SSR/SSG) | Mobile + Web | Web only |

---

## 📊 Benefits of This Structure

### ✅ **Scalability**
- Add new features without touching existing code
- Clear boundaries between features
- Easy to split into micro-frontends later

### ✅ **Maintainability** 
- Related code lives together
- Easy to find and fix bugs
- Consistent patterns across features

### ✅ **Team Collaboration**
- Clear feature ownership
- Parallel development possible
- Reduced merge conflicts

### ✅ **Testing**
- Test features in isolation
- Mock dependencies easily
- Clear test boundaries

### ✅ **Performance**
- Better tree-shaking
- Easier code splitting
- Lazy loading by feature

---

## 🚀 Getting Started

1. **Choose your framework** using the links above
2. **Copy the folder structure** for your chosen framework
3. **Set up path aliases** in your bundler configuration
4. **Create your first feature** in the `/features` directory
5. **Add routing** in the appropriate routing directory
6. **Build reusable components** in `/components/ui`

---

## 🤝 Contributing

We welcome contributions! This guide aims to be the definitive resource for React folder structure.

### Ways to Contribute:
- 📝 **Documentation improvements**
- 🔧 **Real-world examples**
- 🌐 **Framework adaptations**
- 🐛 **Issue reports**

**[📖 View Contributing Guide →](CONTRIBUTING.md)**

---

**⭐ Star this repo if it helped you organize your React projects better!**

**Happy coding! 🚀**

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

## 🚀 Framework-Specific Implementations

### 🌐 Next.js App Router Implementation

#### Key Features:
- **App Router** with file-based routing using `page.tsx`, `layout.tsx`, `loading.tsx`
- **API Routes** co-located with frontend code
- **Server Components** by default with client components when needed
- **Route Groups** for organizing without affecting URL structure

#### Next.js Specific Files:

```typescript
// app/layout.tsx - Root Layout
import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: 'My Next.js App',
  description: 'Built with Next.js App Router',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>{children}</body>
    </html>
  )
}

// app/(auth)/layout.tsx - Auth Layout
export default function AuthLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <div className="min-h-screen flex items-center justify-center">
      <div className="max-w-md w-full space-y-8">
        {children}
      </div>
    </div>
  )
}

// app/(auth)/login/page.tsx - Login Page
import { LoginForm } from '@/features/auth/components/LoginForm'

export default function LoginPage() {
  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Sign In</h1>
      <LoginForm />
    </div>
  )
}

// app/api/auth/route.ts - API Route
import { NextRequest, NextResponse } from 'next/server'

export async function POST(request: NextRequest) {
  const { email, password } = await request.json()
  
  // Authentication logic
  
  return NextResponse.json({ success: true })
}

// features/auth/server/authActions.ts - Server Actions
'use server'

import { redirect } from 'next/navigation'

export async function loginAction(formData: FormData) {
  const email = formData.get('email') as string
  const password = formData.get('password') as string
  
  // Server-side authentication logic
  
  redirect('/dashboard')
}
```

#### Next.js Configuration:

```javascript
// next.config.js
/** @type {import('next').NextConfig} */
const nextConfig = {
  experimental: {
    typedRoutes: true,
  },
  images: {
    domains: ['example.com'],
  },
}

module.exports = nextConfig

// tsconfig.json paths
{
  "compilerOptions": {
    "paths": {
      "@/*": ["./src/*"],
      "@/components/*": ["./src/components/*"],
      "@/features/*": ["./src/features/*"],
      "@/lib/*": ["./src/lib/*"]
    }
  }
}
```

### 📱 React Native Expo Implementation

#### Key Features:
- **Expo Router** with file-based routing using `.tsx` files
- **Tab Navigation** through `_layout.tsx` files
- **Stack Navigation** for hierarchical screens
- **Modal Screens** using route groups
- **Deep Linking** support out of the box

#### Expo Specific Files:

```typescript
// app/_layout.tsx - Root Layout
import { Stack } from 'expo-router'
import { useFonts } from 'expo-font'
import * as SplashScreen from 'expo-splash-screen'
import { useEffect } from 'react'

SplashScreen.preventAutoHideAsync()

export default function RootLayout() {
  const [loaded, error] = useFonts({
    SpaceMono: require('../assets/fonts/SpaceMono-Regular.ttf'),
  })

  useEffect(() => {
    if (loaded || error) {
      SplashScreen.hideAsync()
    }
  }, [loaded, error])

  if (!loaded && !error) {
    return null
  }

  return (
    <Stack>
      <Stack.Screen name="(tabs)" options={{ headerShown: false }} />
      <Stack.Screen name="(auth)" options={{ headerShown: false }} />
      <Stack.Screen name="(modals)" options={{ presentation: 'modal' }} />
    </Stack>
  )
}

// app/(tabs)/_layout.tsx - Tab Navigation
import { Tabs } from 'expo-router'
import { TabBarIcon } from '@/components/ui/TabBarIcon'

export default function TabLayout() {
  return (
    <Tabs
      screenOptions={{
        tabBarActiveTintColor: '#007AFF',
        headerShown: false,
      }}>
      <Tabs.Screen
        name="index"
        options={{
          title: 'Home',
          tabBarIcon: ({ color, focused }) => (
            <TabBarIcon name={focused ? 'home' : 'home-outline'} color={color} />
          ),
        }}
      />
      <Tabs.Screen
        name="explore"
        options={{
          title: 'Explore',
          tabBarIcon: ({ color, focused }) => (
            <TabBarIcon name={focused ? 'compass' : 'compass-outline'} color={color} />
          ),
        }}
      />
    </Tabs>
  )
}

// app/(tabs)/index.tsx - Home Screen
import { StyleSheet, View, Text } from 'react-native'
import { HomeFeature } from '@/features/home/components/HomeFeature'

export default function HomeScreen() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Welcome Home</Text>
      <HomeFeature />
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  title: {
    fontSize: 20,
    fontWeight: 'bold',
  },
})

// app/(auth)/_layout.tsx - Auth Stack
import { Stack } from 'expo-router'

export default function AuthLayout() {
  return (
    <Stack>
      <Stack.Screen
        name="login"
        options={{
          title: 'Sign In',
          headerStyle: { backgroundColor: '#007AFF' },
          headerTintColor: '#fff',
        }}
      />
      <Stack.Screen
        name="register"
        options={{
          title: 'Sign Up',
          headerStyle: { backgroundColor: '#007AFF' },
          headerTintColor: '#fff',
        }}
      />
    </Stack>
  )
}

// services/pushNotifications.ts - Expo specific service
import * as Notifications from 'expo-notifications'
import * as Device from 'expo-device'
import Constants from 'expo-constants'

Notifications.setNotificationHandler({
  handleNotification: async () => ({
    shouldShowAlert: true,
    shouldPlaySound: false,
    shouldSetBadge: false,
  }),
})

export async function registerForPushNotificationsAsync() {
  let token
  
  if (Device.isDevice) {
    const { status: existingStatus } = await Notifications.getPermissionsAsync()
    let finalStatus = existingStatus
    
    if (existingStatus !== 'granted') {
      const { status } = await Notifications.requestPermissionsAsync()
      finalStatus = status
    }
    
    if (finalStatus !== 'granted') {
      alert('Failed to get push token for push notification!')
      return
    }
    
    token = await Notifications.getExpoPushTokenAsync({
      projectId: Constants.expoConfig?.extra?.eas?.projectId,
    })
  }
  
  return token?.data
}
```

#### Expo Configuration:

```json
// app.json
{
  "expo": {
    "name": "my-expo-app",
    "slug": "my-expo-app",
    "version": "1.0.0",
    "orientation": "portrait",
    "icon": "./assets/icon.png",
    "userInterfaceStyle": "light",
    "splash": {
      "image": "./assets/splash.png",
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
        "foregroundImage": "./assets/adaptive-icon.png",
        "backgroundColor": "#ffffff"
      }
    },
    "web": {
      "favicon": "./assets/favicon.png",
      "bundler": "metro"
    },
    "plugins": [
      "expo-router",
      "expo-font"
    ],
    "experiments": {
      "typedRoutes": true
    }
  }
}

// babel.config.js
module.exports = function (api) {
  api.cache(true)
  return {
    presets: ['babel-preset-expo'],
    plugins: [
      [
        'module-resolver',
        {
          root: ['./src'],
          alias: {
            '@': './src',
            '@/components': './src/components',
            '@/features': './src/features',
            '@/assets': './src/assets',
          },
        },
      ],
      'expo-router/babel',
    ],
  }
}
```

### 🔄 Key Differences Summary

| Feature | Next.js App Router | React Native Expo |
|---------|-------------------|-------------------|
| **Routing** | `page.tsx`, `layout.tsx` | `.tsx` files, `_layout.tsx` |
| **Navigation** | Built-in navigation | Expo Router with Stack/Tabs |
| **Styling** | CSS, Tailwind, CSS-in-JS | StyleSheet, styled-components |
| **Assets** | `public/` folder | `assets/` folder + `src/assets/` |
| **API** | API routes in `app/api/` | External API calls only |
| **State** | Server/Client state | Client state only |
| **Platform** | Web (SSR/SSG) | Mobile (iOS/Android) + Web |

### Create React App / Vite

For traditional React apps without file-based routing:

- Replace `app/` folder with `pages/` or `views/`
- Use React Router for navigation
- Keep the feature-based organization
- Adapt asset handling to your bundler

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
