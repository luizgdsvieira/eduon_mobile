# 🚀 Setup Rápido - EDUON Mobile

## Passos Mínimos para Executar

### 1. Instalar Flutter
```bash
# Verifique se o Flutter está instalado
flutter doctor

# Se não estiver instalado, baixe em:
# https://docs.flutter.dev/get-started/install
```

### 2. Clonar e Instalar
```bash
git clone <url-do-repositorio>
cd eduon_mobile
flutter pub get
```

### 3. Executar
```bash
# Listar dispositivos disponíveis
flutter devices

# Executar no dispositivo/emulador
flutter run
```

## ⚙️ Configuração da API

Por padrão, o app usa a API em produção:
- **URL**: `https://projetoeduon.onrender.com/api`

Para usar API local, edite `lib/config/api_config.dart`:

```dart
// Descomente uma das opções:
static const String baseUrl = 'http://localhost:3000/api';  // Desktop
// static const String baseUrl = 'http://10.0.2.2:3000/api';  // Emulador Android
```

## 📱 Testando

### Login como Aluno
- Use as credenciais geradas ao cadastrar um aluno no sistema web
- Você verá sua carteirinha digital com QR Code

### Login como Fiscal
- Use as credenciais geradas ao cadastrar um funcionário no sistema web
- Você verá a tela de scanner para validar carteirinhas

## ❗ Problemas Comuns

**"No devices found"**
- Abra um emulador ou conecte um dispositivo físico
- Execute `flutter devices` para verificar

**"Failed to connect to API"**
- Verifique se a API está rodando
- Confirme a URL em `lib/config/api_config.dart`
- Para emulador Android, use `10.0.2.2` em vez de `localhost`

**Erro ao instalar dependências**
```bash
flutter clean
flutter pub get
```

## 📚 Documentação Completa

Veja o arquivo `README.md` para informações detalhadas.

