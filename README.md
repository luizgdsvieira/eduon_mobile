# EDUON Mobile App

Aplicativo móvel Flutter para o sistema EDUON - Gestão Escolar. Permite que alunos visualizem sua carteirinha digital com QR Code e que funcionários (fiscais) escaneiem e validem as carteirinhas dos alunos.

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

1. **Flutter SDK** (versão 3.10.1 ou superior)
   - Download: https://docs.flutter.dev/get-started/install
   - Verifique a instalação: `flutter doctor`

2. **Editor de Código** (opcional, mas recomendado)
   - VS Code com extensão Flutter
   - Android Studio com plugins Flutter e Dart

3. **Para Android:**
   - Android Studio
   - Android SDK (mínimo API 21)
   - Emulador Android ou dispositivo físico com USB Debugging habilitado

4. **Para iOS (apenas macOS):**
   - Xcode (versão mais recente)
   - CocoaPods: `sudo gem install cocoapods`
   - Simulador iOS ou dispositivo físico

5. **Para Windows/Linux/Mac (desktop):**
   - Dependências específicas do sistema (veja documentação do Flutter)

## 🚀 Como Executar

### 1. Clone o Repositório

```bash
git clone <url-do-repositorio>
cd eduon_mobile
```

### 2. Instale as Dependências

```bash
flutter pub get
```

### 3. Verifique a Configuração

O app está configurado para usar a API em produção por padrão:
- **API URL**: `https://projetoeduon.onrender.com/api`

Se precisar usar uma API local, edite o arquivo `lib/config/api_config.dart`:

```dart
// Para desenvolvimento local (descomente a linha apropriada):
static const String baseUrl = 'http://localhost:3000/api';
// ou para emulador Android:
// static const String baseUrl = 'http://10.0.2.2:3000/api';
```

### 4. Execute o App

**Android:**
```bash
flutter run
# ou especifique um dispositivo:
flutter devices  # lista dispositivos disponíveis
flutter run -d <device-id>
```

**iOS (apenas macOS):**
```bash
flutter run
```

**Windows:**
```bash
flutter run -d windows
```

**Linux:**
```bash
flutter run -d linux
```

**macOS:**
```bash
flutter run -d macos
```

**Web:**
```bash
flutter run -d chrome
```

## 📱 Funcionalidades

### Para Alunos (role: `student`)
- Login com credenciais fornecidas pela escola
- Visualização da carteirinha digital
- QR Code único para validação

### Para Funcionários/Fiscais (role: `staff`)
- Login com credenciais fornecidas pelo administrador
- Scanner de QR Code para validar carteirinhas de alunos
- Visualização dos dados do aluno após escanear

## 🔧 Estrutura do Projeto

```
lib/
├── config/
│   ├── api_config.dart      # Configuração da API
│   └── app_colors.dart       # Cores do app
├── models/
│   ├── student.dart          # Modelo de aluno
│   ├── user.dart             # Modelo de usuário
│   └── qr_verification_response.dart
├── screens/
│   ├── login_screen.dart     # Tela de login
│   ├── student_card_screen.dart    # Carteirinha do aluno
│   ├── staff_scanner_screen.dart   # Scanner para fiscais
│   └── student_validation_screen.dart  # Validação do aluno
└── services/
    ├── auth_service.dart     # Serviço de autenticação
    └── student_service.dart  # Serviço de alunos
```

## 🧪 Testando o App

### Login como Aluno
1. Use as credenciais geradas automaticamente ao cadastrar um aluno no sistema web
2. Após login, você verá sua carteirinha digital com QR Code

### Login como Fiscal/Funcionário
1. Use as credenciais geradas automaticamente ao cadastrar um funcionário no sistema web
2. Após login, você verá a tela de scanner
3. Aponte a câmera para o QR Code da carteirinha de um aluno
4. Os dados do aluno serão exibidos automaticamente

## 📦 Dependências Principais

- `http`: Requisições HTTP
- `shared_preferences`: Armazenamento local (tokens, preferências)
- `mobile_scanner`: Scanner de QR Code
- `qr_flutter`: Geração de QR Codes
- `jwt_decoder`: Decodificação de tokens JWT

Veja `pubspec.yaml` para a lista completa.

## 🐛 Troubleshooting

### Erro: "No devices found"
- Certifique-se de que um emulador está rodando ou um dispositivo está conectado
- Execute `flutter devices` para ver dispositivos disponíveis

### Erro: "Failed to connect to API"
- Verifique se a API está rodando e acessível
- Confirme a URL em `lib/config/api_config.dart`
- Para emulador Android, use `10.0.2.2` em vez de `localhost`

### Erro: "Permission denied" (câmera)
- Android: Verifique permissões no `AndroidManifest.xml`
- iOS: Verifique permissões no `Info.plist`

### Erro ao instalar dependências
```bash
flutter clean
flutter pub get
```

### Build falha
```bash
flutter clean
cd android && ./gradlew clean && cd ..
flutter pub get
flutter run
```

## 📝 Notas Importantes

- O app requer conexão com a internet para funcionar
- As credenciais de login são geradas automaticamente no sistema web
- O QR Code do aluno é gerado automaticamente ao cadastrá-lo
- O token JWT expira após 8 horas (é necessário fazer login novamente)

## 🔐 Segurança

- Tokens JWT são armazenados localmente usando `shared_preferences`
- Senhas nunca são armazenadas no app
- Todas as requisições usam HTTPS em produção

## 📄 Licença

[Adicione informações de licença aqui]

## 👥 Contribuindo

[Adicione instruções de contribuição se necessário]

## 📞 Suporte

Para problemas ou dúvidas, abra uma issue no repositório ou entre em contato com a equipe de desenvolvimento.
