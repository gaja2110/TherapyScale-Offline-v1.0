# TherapyScale Offline v1.0

🌿 **Application professionnelle de gestion de massothérapie pour ScaleGift Massages**

## 📱 Fonctionnalités

### 🔐 Sécurité
- **Chiffrement SQLCipher** avec AES-256
- **Authentification PIN** avec hachage SHA-256
- **Authentification biométrique** (Touch ID, Face ID, Windows Hello)
- **Stockage sécurisé** avec flutter_secure_storage

### 💾 Base de données
- **Base de données chiffrée** hors ligne avec SQLCipher
- **Tables optimisées** : Clients, Séances, Protocoles
- **Protocoles pré-configurés** avec tarifs en CHF
- **Sauvegarde et restauration** sécurisées

### 🎨 Interface utilisateur
- **Material 3 Design** avec couleurs ScaleGift
- **Animations fluides** avec AnimatedTextKit
- **Typographie Google Fonts** (OpenSans)
- **Thème personnalisé** Sage Green (#CDE4D2) et Beige (#F8F5EF)

### 🌍 Internationalisation
- **Français** (langue principale)
- **Anglais** 
- **Allemand**

### 📄 Génération de documents
- **Rapports PDF** des séances
- **Facturation** automatisée
- **Partage de documents** sécurisé

## 🏗️ Architecture technique

### 📦 Packages principaux
- `flutter_riverpod` - Gestion d'état
- `drift` + `sqlcipher_flutter_libs` - Base de données chiffrée
- `local_auth` - Authentification biométrique
- `flutter_secure_storage` - Stockage sécurisé
- `google_fonts` - Typographie
- `animated_text_kit` - Animations de texte
- `pdf` + `printing` - Génération PDF

### 🗂️ Structure du projet
```
lib/
├── ui/
│   ├── screens/          # Écrans de l'application
│   ├── widgets/          # Widgets réutilisables
│   └── themes/           # Thèmes et styles
├── database/             # Configuration base de données
├── models/               # Modèles de données
├── providers/            # Providers Riverpod
├── services/             # Services (auth, etc.)
└── utils/                # Utilitaires
```

## 🚀 Installation

### Prérequis
- Flutter 3.16.0+
- Dart 3.2.0+
- Android SDK / Xcode pour compilation

### Commandes
```bash
# Installer les dépendances
flutter pub get

# Générer les fichiers (base de données, localisation)
flutter packages pub run build_runner build

# Compiler pour Android
flutter build apk --release

# Compiler pour iOS
flutter build ios --release
```

## 🔧 Configuration

### PIN par défaut
- **Code PIN initial** : `123456`
- Modifiable dans les paramètres après première connexion

### Base de données
- **Clé de chiffrement** : Configurée dans `database.dart`
- **Fichier** : `therapyscale.db` (chiffré)
- **Algorithme** : AES-256 avec PBKDF2_HMAC_SHA512

### Protocoles pré-configurés
1. **Massage Relaxation** - 60 min - 120 CHF
2. **Massage Thérapeutique** - 90 min - 150 CHF
3. **Massage Sportif** - 75 min - 135 CHF
4. **Réflexologie Plantaire** - 45 min - 90 CHF
5. **Massage Crânien** - 30 min - 70 CHF

## 📱 Plateformes supportées
- ✅ **Android** 6.0+ (API 23+)
- ✅ **iOS** 11.0+
- 🔄 **Windows** (en développement)

## 🔒 Sécurité

### Chiffrement
- **SQLCipher** : AES-256 en mode CBC
- **Key derivation** : PBKDF2 avec 64 000 itérations
- **HMAC** : SHA-512 pour l'intégrité

### Authentification
- **PIN** : Hachage SHA-256 avec sel
- **Biométrie** : Intégration native (Touch ID, Face ID, Fingerprint)
- **Stockage** : flutter_secure_storage avec chiffrement matériel

## 👨‍💻 Développement

### Architecture
- **State Management** : Riverpod avec providers
- **Database** : Drift ORM avec SQLCipher
- **UI** : Material 3 avec animations personnalisées
- **Navigation** : Flutter Navigator 2.0

### Tests
```bash
# Tests unitaires
flutter test

# Tests d'intégration
flutter drive --target=test_driver/app.dart
```

## 📄 Licence

© 2024 ScaleGift Massages. Tous droits réservés.

---

**TherapyScale Offline v1.0** - Solution professionnelle pour la gestion de massothérapie