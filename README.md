Thông tin cá nhân:
Họ và tên: Phạm Nguyên Cương
Lớp: K57KMT.01
MSSV: K215480106010
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Tên đề tài: Quản lý hoạt động kinh doanh thiết bị gia đình.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Create database QLKD On primary
(	name=’QLKD’,
Filename=’D:\QLKD.mdf’, Size=5, Maxsize=unlimited, Filegrowth=5MB
)
Log on
(	name=’QLKD_log’, Filename=’D:\QLKD.ldf’, Size=5, Maxsize=unlimited, Filegrowth=5MB
)

3.2.	Tạo các bảng dữ liệu và ràng buộc trên các bảng

-	Tạo bảng NhaCungCap: Create table Nhacungcap(
MaNCC	char(10) primary key, TenNCC	nvarchar(30) ,
DiaChi		nvarchar(40) , DienThoai	varchar(15) , Email		nvarchar(30) ,
Fax	varchar(20)
)
 
-	Tạo bảng SanPham: Create table SanPham(
MaSP	char(10) primary key,
MaNCC	char(10) references NhaCungCap(MaNCC), TenSP nvarchar(30) ,
MaLoaiSP	char(10) references LoaiSP(MaLoaiSP), DonViTinh	varchar(20) ,
TonKho	int ,
MaPhieuBH char(10) references PhieuBaoHanh, MaDG char(10) references DonGia(MaDG), NuocSX	varchar(20)
)
-	Tạo bảng LoaiSP: Create table LoaiSP(
MaLoaiSP	char(10) primary key, TenLoaiSP		nvarchar(30)
)
-	Tạo bảng PhieuBaoHanh: Create table PhieuBaoHanh(
MaPhieuBH	char(10) primary key, NgayBatDau datetime ,
NgayKetThuc datetime
)
-	Tạo bảng PhieuThanhToan: Create table PhieuThanhToan(
MaPTT	char(10) primary key, NgayTT	datetime ,
 
SoTienTT	money
)
-	Tạo bảng ChiTietTT: Create table ChiTietTT(
MaPTT	char(10) references PhieuthanhToan(MaPTT), SoHoaDon char(10) references HoaDonBan(SoHoaDon), SoTienNo  money,
Constraint PK_ChiTietTT primary key(MaPTT,SoHoaDon)
)
-	Tạo bảng DonDatHang: Create table DonDatHang(
MaDDH	char(10) primary key, NgayLap	datetime ,
MaKH	char(10) references (KhachHang), NgayGiaoHang datetime ,
NoiGiaoHang nvarchar(40)
)
-	Tạo bảng ChiTietDDH: Create table ChiTietDDH(
MaDDH	char(10) references DonDatHang(MaDDH), MaSP	char(10) references SanPham(MaSP), SoLuong	int,
Constraint PK_ChiTietDDH primary key(MaDDH,MaSP)
)
-	Tạo bảng PhieuXuat: Create table PhieuXuat(
MaPhieuXuat char(10) primary key,
 
NgayXuat	datetime ,
MaKH	char(10) references KhachHang(MaKH), MaNV	char(10) references NhanVien(MaNV)
)
-	Tạo bảng ChiTietXuat: Create table ChiTieTXuat(
MaPhieuXuat char(10) references PhieuXuat(MaPhieuXuat), MaSP	char(10) references SanPham(MaSP), SoLuong	nt,
Constraint PK_ChiTietXuat primary key (MaPhieuXuat,MaSP)

)

-	Tạo bảng PhieuNhap: Create table PhieuNhap(
MaPhieuNhap	char(10) primary key, NgayNhap	datetime ,
MaNCC	char(10) references NhaCungCap(MaNCC),
MaNV	char(10) references NhanVien(MaNV)
)
-	Tạo bảng ChiTietNhap Create table ChiTietNhap(
MaPhieuNhap char(10) references PhieuNhap(MaPhieunhap), MaSP	char(10) references SanPham (MaSP), SoLuong	int,
Contraint PK_ChiTietNhap primary key (MaPhieuNhap,MaSP)

)

-	Tạo bảng DonGia:
 
Create table DonGia(
MaDG	char(10) primary key, NgayCapNhat datetime ,
GiaGoc	money ,
GiaBan	money , ThueGTGT	float, KhongSuDung bit
)
-	Tạo bảng KhachHang: Create table KhachHang(
MaKH	char(10) primary key
TenKH	nvarchar(30) ,
DiaChi		nvarchar(50) , SDT	varchar(20)
)
-	Tạo bảng NhaVien: Create table NhanVien(
MaNV		char(10) primary key, TenNV	nvarchar(30) ,
DiaChi		nvarchar(50) , DIenThoai	varchar(30)
)
-	Tạo bảng HoaDonBan: Create table HoaDonBan(
SoHoaDon	char(10) primary key,
MaKH	char(10) references KhachHang(MaKH), NgayLap	datetime ,
 
TongTien	money
)
-	Tạo bảng ChiTietHD Create table ChiTietHD(
SoHoaDon	char(10) references HoaDonBan(SoHoaDon), MaSP	char(10) references SanPham(MaSP), GiaBan	money,
SoLuong	int,
Constraint PK_ChitietHD primary key(SoHoaDon,MaSP)
)

