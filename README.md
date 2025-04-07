# Dirty Coins - Ứng Dụng Shop Quần Áo

## 📱 Tổng Quan
Ứng dụng thương mại điện tử được xây dựng bằng Flutter và Firebase, cho phép người dùng dễ dàng tìm kiếm và mua sắm quần áo, phụ kiện thời trang.

## 📂 Cấu Trúc Project
```
lib/
├── model/                    # Data Models
│   ├── cartmodel.dart       # Model giỏ hàng
│   ├── product.dart         # Model sản phẩm  
│   └── usermodel.dart       # Model người dùng
│
├── provider/                 # State Management
│   ├── category_provider.dart   # Quản lý danh mục
│   └── product_provider.dart    # Quản lý sản phẩm & giỏ hàng
│
├── screens/                  # Màn hình chính
│   ├── welcomepage.dart     # Màn hình chào mừng
│   ├── login.dart          # Đăng nhập
│   ├── signup.dart         # Đăng ký
│   ├── homepage.dart       # Trang chủ
│   ├── listproduct.dart    # Danh sách sản phẩm
│   ├── detailpage.dart     # Chi tiết sản phẩm
│   ├── cartpage.dart       # Giỏ hàng
│   ├── checkout.dart       # Thanh toán
│   ├── profilepage.dart    # Trang cá nhân
│   └── search.dart         # Tìm kiếm
│
└── widgets/                 # Widgets tái sử dụng
    ├── importProduct.dart    # Card sản phẩm
    ├── importProductCart.dart # Card giỏ hàng
    ├── mybutton.dart        # Button tùy chỉnh
    ├── mytextformField.dart # Input fields
    ├── passwordtextformField.dart # Password field
    └── noficationShoppingcart.dart # Badge thông báo
```

## 🎯 Tính Năng Chi Tiết

### 1. Xác Thực & Quản Lý User
- **Đăng nhập/Đăng ký**:
  - Validation email và password
  - Xử lý lỗi Firebase Auth
  - Lưu thông tin user vào Firestore

- **Quản lý Profile**:
  - Upload ảnh đại diện (Cloudinary)
  - Cập nhật thông tin cá nhân
  - Chọn giới tính từ dropdown
  - Hiển thị thông tin user

### 2. Trang Chủ & Danh Mục
- **Giao diện chính**:
  - Carousel slider banner
  - Danh mục sản phẩm
  - Sản phẩm nổi bật & mới
  - Navigation drawer

- **Danh mục sản phẩm**:
  - Áo (T-shirt, áo thun)
  - Quần (Jeans, quần tây)
  - Váy (Ngắn, dài)
  - Giày (Sneakers)
  - Đồng hồ

### 3. Chức Năng Mua Sắm
- **Chi tiết sản phẩm**:
  - Hình ảnh sản phẩm với animation
  - Chọn size (S/M/L/XL) với hiệu ứng
  - Điều chỉnh số lượng
  - Thêm vào giỏ hàng
  - Validation khi chọn size

- **Giỏ hàng & Thanh toán**:
  - Quản lý sản phẩm đã chọn
  - Cập nhật/xóa số lượng
  - Tính tổng tiền tự động
  - Form thông tin giao hàng
  - Xác nhận đơn hàng

### 4. Tính Năng Khác
- **Tìm kiếm**: 
  - Tìm theo tên sản phẩm
  - Hỗ trợ tìm kiếm không dấu
  - Hiển thị kết quả tức thì

- **Thông báo**:
  - Badge hiển thị số lượng
  - Thông báo thêm vào giỏ hàng

## ⚙️ Công Nghệ Sử Dụng

- **Frontend**:
  - Flutter SDK
  - Material Design
  - Provider State Management

- **Backend & Database**:
  - Firebase Authentication
  - Cloud Firestore
  - Cloudinary Storage

## 🚀 Cài Đặt & Chạy

1. **Yêu cầu hệ thống**:
```bash
Flutter: ≥3.0.0
Dart: ≥3.0.0
```

2. **Clone & Setup**:
```bash
git clone https://github.com/yourusername/dirty-coins.git
cd dirty-coins
flutter pub get
```

3. **Cấu hình Firebase**:
- Tạo project Firebase mới
- Thêm file cấu hình:
  - `google-services.json` (Android)
  - `GoogleService-Info.plist` (iOS)
- Cập nhật `firebase_options.dart`

4. **Chạy ứng dụng**:
```bash
flutter run
```

## 👥 Tác Giả
[Nguyễn Đức Duy]

## 📄 License
MIT License - See [LICENSE](LICENSE) for details