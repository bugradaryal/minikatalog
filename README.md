# Katalog Uygulaması (minikatalog)

Flutter ile geliştirilmiş mobil katalog uygulamasıdır. Kullanıcı giriş ekranından ad ve soyad bilgisiyle giriş yapar. Ürünler `wantapi.com` REST API servisinden dinamik olarak çekilir ve ızgara (GridView) yapısında listelenir. Kullanıcı ürün detaylarını inceleyebilir, ürünleri sepete ekleyip sepetten çıkarabilir.

| Ana Sayfa | Ürün Detayı | Sepet (Dolu) | Sepet (Boş) |
| :---: | :---: | :---: | :---: |
| <img src="public/images/ana%20sayfa.png" width="200"/> | <img src="public/images/ürün%20içerik.png" width="200"/> | <img src="public/images/dolu%20sepet.png" width="200"/> | <img src="public/images/boş%20sepet.png" width="200"/> |

## Özellikler
- API'den ürün listesini çekme ve GridView ile kart olarak gösterme
- Ürün arama
- Ürün detay sayfası
- Sepete ürün ekleme / çıkarma
- Sepetin cihazda saklanması (uygulama kapanıp açılsa da korunur)
  
## Kullanılan Flutter Sürümü ve Araçlar
- **Flutter:** 3.50.0 (Dart 3.14.0)
- **Editör:** Visual Studio Code
- **Test ortamı:** Android Studio – Pixel 9 Emulator (Android 16 "Baklava")
  
### Proje Bağımlılıkları
- `http` (`^1.6.0`): API üzerinden ürün verilerini çekmek için
- `shared_preferences` (`^2.5.6`): Sepeti cihazda yerel olarak saklamak için
- `cupertino_icons` (`^1.0.8`): iOS tarzı ikonlar için

Uygulama tasarımında Material Design kullanıldı.
  
## Çalıştırma Adımları
 
1. Repoyu klonlayın ve klasöre girin:
```bash
git clone https://github.com/bugradaryal/minikatalog.git
cd minikatalog
```
 
2. Android Studio > **SDK Manager** üzerinden şunları kurun:
   - Android SDK Platform (Android 16 "Baklava")
   - Android SDK Build-Tools
   - Android SDK Command-line Tools
   - Android SDK Platform-Tools
   - Android Emulator

   **Device Manager**'dan **Pixel 9** (Android 16 "Baklava") emülatörünü oluşturun.
   
3. Projeyi VS Code'da açıp **F5** ile debug'ı başlatın.
