Thông tin cá nhân:
Họ và tên: Phạm Nguyên Cương
Lớp: K57KMT.01
MSSV: K215480106010
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Tên đề tài: Quản lý hoạt động kinh doanh thiết bị gia đình.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Sơ đồ thực thể-liên kết
![image](https://github.com/cuong24082003/cuong1/assets/168844849/e17d9656-2fa1-4ed9-a0a3-ea11431b4fe8)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Sơ đồ dữ liệu liên kết
![image](https://github.com/cuong24082003/cuong1/assets/168844849/0a123f89-3228-48cf-829d-c325f378b546)
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

-		SanPham (MaSP , TenSP , MaNCC , NuocSX , DonViTinh , SoLuong , MaDG,MaPhieuBH)

+, Insert into SanPham(MaSP,TenSp,MaNCC,NuocSX,DonViTinh,SoLuong,MaDG,MaPhieuB H)
Values(‘DH’,’Dieu Hoa’,’LG’,’Korea’,’Chiec’,’50’,’DG1’,’BH1’)
+, Insert into SanPham(MaSP,TenSp,MaNCC,NuocSX,DonViTinh,SoLuong,MaDG,MaPhieuB H)
Values(‘TL’,’Tu Lanh’,’Toshiba’,’Japan’,’Chiec’,’50’,’DG2’,’BH2’)
+, Insert into SanPham(MaSP,TenSp,MaNCC,NuocSX,DonViTinh,SoLuong,MaDG,MaPhieuB H)
Values(‘TV’,’Ti Vi’,’LG’,’Korea’,’Chiec’,’50’,’DG3’,’BH3’)
+, Insert into SanPham(MaSP,TenSp,MaNCC,NuocSX,DonViTinh,SoLuong,MaDG,MaPhieuB H)
Values(‘NCD’,’Noi Com Dien’,’HP’,’Viet Nam’,’Chiec’,’50’,’DG4’,’BH4’)
+, Insert into SanPham(MaSP,TenSp,MaNCC,NuocSX,DonViTinh,SoLuong,MaDG,MaPhieuB H)
Values(‘MLN’,’May Loc Nuoc’,’CGG’,’Viet Nam’,’Chiec’,’50’,’DG5’,’BH5’)
 
+, Insert into SanPham(MaSP,TenSp,MaNCC,NuocSX,DonViTinh,SoLuong,MaDG,MaPhieuB H)
Values(‘MG’,’May Giat’,’LG’,’Korea’,’Chiec’,’50’,’DG6’,’BH6’)
+, Insert into SanPham(MaSP,TenSp,MaNCC,NuocSX,DonViTinh,SoLuong,MaDG,MaPhieuB H)
Values(‘LVS’,’Lo Vi Song’,’CGG’,’Viet Nam’,’Chiec’,’50’,’DG7’,’BH7’)
+, Insert into SanPham(MaSP,TenSp,MaNCC,NuocSX,DonViTinh,SoLuong,MaDG,MaPhieuB H)
Values(‘MHB’,’May Hut Bui’,’HiTaChi’,’Japan’,’Chiec’,’50’,’DG8’,’BH8’)
+, Insert into SanPham(MaSP,TenSp,MaNCC,NuocSX,DonViTinh,SoLuong,MaDG,MaPhieuB H)
Values(‘MST’,’May Say Toc’,’HiTaChi’,’Japan’,’Chiec’,’50’,’DG9’,’BH9’)
+, Insert into SanPham(MaSP,TenSp,MaNCC,NuocSX,DonViTinh,SoLuong,MaDG,MaPhieuB H)
Values(‘DTCD’,’Dien Thoai Co Dinh’,’VietTel’,’Viet Nam’,’Chiec’,’50’,’DG10’,’BH10’)

-	NhaCungCap (MaNCC , TenNCC , DiaChi , DienThoai , Email , Fax)

+, Insert into NhaCungCap(MaNCC,TenNCC,DiaChi,DienThoai,Email,Fax) Values(‘LG’,’Cong Ty LG’,’Le Chan- Hai Phong’,’0969199286’,’LG@gmail.com’,’ ’)
+, Insert into NhaCungCap(MaNCC,TenNCC,DiaChi,DienThoai,Email,Fax) Values(‘Toshiba’,’Cong Ty Toshiba’,’Duong Kinh- Hai Phong’,’0313586479’,’Toshiba@gmail.com’,’ ’)
+, Insert into NhaCungCap(MaNCC,TenNCC,DiaChi,DienThoai,Email,Fax) Values(‘LG’,’Cong Ty LG’,’Le Chan- Hai Phong’,’0969199286’,’LG@gmail.com’,’ ’)
+, Insert into NhaCungCap(MaNCC,TenNCC,DiaChi,DienThoai,Email,Fax) Values(‘HP’,’Cong Ty Hoa Phat’,’Hai Ba Trung- Ha Noi’,’0969199286’,’HP@gmail.com’,’ ’)
+, Insert into NhaCungCap(MaNCC,TenNCC,DiaChi,DienThoai,Email,Fax) Values(‘CGG’,’Cong Ty CanGuGu’,’Tan Binh- TP HCM’,’0998866888’,’CGG@gmail.com’,’ ’)
+, Insert into NhaCungCap(MaNCC,TenNCC,DiaChi,DienThoai,Email,Fax) Values(‘LG’,’Cong Ty LG’,’Le Chan- Hai Phong’,’0969199286’,’LG@gmail.com’,’ ’)
+, Insert into NhaCungCap(MaNCC,TenNCC,DiaChi,DienThoai,Email,Fax)
 
Values(‘CGG’,’Cong Ty CanGuGu’,’Tan Binh- TP HCM’,’0998866888’,’CGG@gmail.com’,’ ’)
+, Insert into NhaCungCap(MaNCC,TenNCC,DiaChi,DienThoai,Email,Fax) Values(‘HiTaChi’,’Tap Doan HiTaChi’,’Binh Duong’,’0918866385’,’HiTaChi@gmail.com’,’ ’)
+, Insert into NhaCungCap(MaNCC,TenNCC,DiaChi,DienThoai,Email,Fax) Values(‘HiTaChi’,’Tap Doan HiTaChi’,’Binh Duong’,’0918866385’,’HiTaChi@gmail.com’,’ ’)
+, Insert into NhaCungCap(MaNCC,TenNCC,DiaChi,DienThoai,Email,Fax) Values(‘VietTel’,’Tap Doan VietTel’,’Tan Binh- TP HCM’,’01258439286’,’VietTel@gmail.com’,’ ’)

-	PhieuNhap (MaPhieuNhap , NgayNhap , MaNCC , MaNV)

+, Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV) Values(‘PN1’,’2013-01-01’,’LG’,’NV1’)
+, Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV) Values(‘PN2’,’2013-01-01’,’Toshiba’,’NV2’)
+, Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV) Values(‘PN3’,’2013-01-01’,’LG’,’NV3’)
+, Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV) Values(‘PN4’,’2013-01-01’,’HP’,’NV4’)
+, Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV) Values(‘PN5’,’2013-01-01’,’CGG’,’NV5’)
+, Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV) Values(‘PN6’,’2013-01-01’,’LG’,’NV6’)
+, Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV) Values(‘PN7’,’2013-01-01’,’CGG’,’NV7’)
+, Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV) Values(‘PN8’,’2013-01-01’,’HiTaChi’,’NV8’)
+, Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV) Values(‘PN9’,’2013-01-01’,’HiTaChi’,’NV9’)
+, Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV) Values(‘PN10’,’2013-01-01’,’VietTel’,’NV10’)

-	ChiTietHD ( MaSP , SoHoaDon , GiaBan , SoLuong)

+, Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong) Values(‘DH’,’HD1’,’5000000’,’5’)
+, Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong) Values(‘TL’,’HD2’,’10000000’,’10’)
+, Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong) Values(‘TV’,’HD3’,’5000000’,’5’)
+, Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong)
 
Values(‘NCD’,’HD4’,’8000000’,’8’)
+, Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong) Values(‘MLN’,’HD5’,’3000000’,’3’)
+, Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong) Values(‘TL’,’HD6’,’2000000’,’2’)
+, Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong) Values(‘MLN’,’HD7’,’3000000’,’3’)
+, Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong) Values(‘TV’,’HD8’,’7000000’,’7’)
+, Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong) Values(‘MST’,’HD9’,’9000000’,’9’)
+, Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong) Values(‘TL’,’HD10’,’13000000’,’13’)

-	PhieuXuat (MaPhieuXuat , NgayXuat , MaKH , MaNV)

+, Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV) Values(‘PX1’,’2014-03-25’,’KH1’,’NV1’)
+, Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV) Values(‘PX2’,’2013-05-15’,’KH2’,’NV2’)
+, Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV) Values(‘PX3’,’2014-01-27’,’KH3’,’NV3’)
+, Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV) Values(‘PX4’,’2013-08-20’,’KH4’,’NV4’)
+, Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV) Values(‘PX5’,’2014-05-12’,’KH5’,’NV5’)
+, Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV) Values(‘PX6’,’2013-07-12’,’KH5’,’NV5’)
+, Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV) Values(‘PX7’,’2014-04-18’,’KH6’,’NV6’)
+, Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV) Values(‘PX8’,’2013-07-22’,’KH5’,’NV5’)
+, Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV) Values(‘PX9’,’2013-07-30’,’KH4’,’NV5’)
+, Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV) Values(‘PX10’,’2014-01-12’,’KH5’,’NV9’)

-	ChiTietNhap (MaSP , MaPhieuNhap , SoLuong)

+, Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong) Values(‘DH’,’PN1’,’50’)
+, Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong) Values(‘TL’,’PN2’,’50’)
+, Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong)
 
Values(‘TV’,’PN3’,’50’)
+, Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong) Values(‘NCD’,’PN4’,’50’)
+, Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong) Values(‘MLN’,’PN5’,’50’)
+, Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong) Values(‘MST’,’PN6’,’50’)
+, Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong) Values(‘LVS’,’PN7’,’50’)
+, Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong) Values(‘MHB’,’PN8’,’50’)
+, Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong) Values(‘DTCD’,’PN9’,’50’)
+, Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong) Values(‘MST’,’PN10’,’50’)

-	HoaDonBan (SoHoaDon, MaNV,MaKH , NgayLap , TongTien)

+, Insert into HoaDonBan(SoHoaDon,MaNV,MaKH,NgayLap,TongTien) Values(‘HDB1’,’NV1’,KH1,’2014-03-25’,’500000’)
+, Insert into HoaDonBan(SoHoaDon,MaNV,MaKH,NgayLap,TongTien) Values(‘HDB2’,’NV2’,KH2,’2013-05-15’,’10000000’)
+, Insert into HoaDonBan(SoHoaDon,MaNV,MaKH,NgayLap,TongTien) Values(‘HDB3’,’NV3’,KH3,’2014-01-27’,’5000000’)
+, Insert into HoaDonBan(SoHoaDon,MaNV,MaKH,NgayLap,TongTien) Values(‘HDB4’,’NV4’,KH4,’2013-08-20’,’8000000’)
+, Insert into HoaDonBan(SoHoaDon,MaNV,MaKH,NgayLap,TongTien) Values(‘HDB5’,’NV5’,KH5,’2014-05-12’,’3000000’)
+, Insert into HoaDonBan(SoHoaDon,MaNV,MaKH,NgayLap,TongTien) Values(‘HDB6’,’NV5’,KH6,’2013-07-12’,’2000000’)
+, Insert into HoaDonBan(SoHoaDon,MaNV,MaKH,NgayLap,TongTien) Values(‘HDB7’,’NV6’,KH7,’2014-04-18’,’3000000’)
+, Insert into HoaDonBan(SoHoaDon,MaNV,MaKH,NgayLap,TongTien) Values(‘HDB8’,’NV1’,KH8,’2013-07-22’,’7000000’)
+, Insert into HoaDonBan(SoHoaDon,MaNV,MaKH,NgayLap,TongTien) Values(‘HDB9’,’NV7’,KH9,’2013-07-30’,’9000000’)
+, Insert into HoaDonBan(SoHoaDon,MaNV,MaKH,NgayLap,TongTien) Values(‘HDB10’,’NV5’,KH10,’2014-01-12’,’13000000’)

-	ChiTietXuat (MaSP , MaPhieuXuat , SoLuong)

+,Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong) Values(‘DH’,’PX1’,’5’)
+,Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong)
 
Values(‘TL’,’PX2’,’7’)
+,Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong) Values(‘TV’,’PX3’,’3’)
+,Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong) Values(‘NCD’,’PX4’,’5’)
+,Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong) Values(‘TL’,’PX5’,’29’)
+,Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong) Values(‘MLN’,’PX6’,’21’)
+,Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong) Values(‘DTCD’,’PX7’,’42’)
+,Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong) Values(‘MLN’,’PX8’,’32’)
+,Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong) Values(‘TV’,’PX9’,’20’)
+,Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong) Values(‘MHB’,’PX10’,’12’)

-	KhachHang (MaKH , TenKH , DiaChi , SDT)

+, Insert into KhachHang(MaKH,TenKH,DiaChi,SDT) Values(‘KH1’,’Truong huu Nam’,’Tan Binh-Sai Gon’,’0969199568’)
+, Insert into KhachHang(MaKH,TenKH,DiaChi,SDT) Values(‘KH2’,’Hoang an Truong’,’Hiep Hoa-Bac Giang’,’01692199564’)
+, Insert into KhachHang(MaKH,TenKH,DiaChi,SDT) Values(‘KH3’,’Truong bao Ngoc’,’Thuy Nguyen- Hai Phong’,’0313258697’)
+, Insert into KhachHang(MaKH,TenKH,DiaChi,SDT) Values(‘KH4’,’Hoang thuy Linh,’Hoan Kiem- Ha Noi,’0969696969’)
+, Insert into KhachHang(MaKH,TenKH,DiaChi,SDT) Values(‘KH5’,’Nguyen hoang Huynh’,’An Lao- Hai Phong’,’0313193548’)
+, Insert into KhachHang(MaKH,TenKH,DiaChi,SoDT) Values(‘KH6’,’Nguyen mai Linh’,’Duong Kinh- Hai Phong’,’01697193384’)
+, Insert into KhachHang(MaKH,TenKH,DiaChi,SDT) Values(‘KH7’,’Nguyen kim Anh’,’Ngo Quyen- Hai Phong’,’0966193845’)
+, Insert into KhachHang(MaKH,TenKH,DiaChi,SDT) Values(‘KH8’,’Nguyen ngoc Khanh’,’Hai An- Hai Phong’,’0967993518’)
+, Insert into KhachHang(MaKH,TenKH,DiaChi,SDT) Values(‘KH9’,’Lam van Manh’,’Kien An- Hai Phong’,’0969193349’)
+, Insert into KhachHang(MaKH,TenKH,DiaChi,SDT) Values(‘KH10’,’Hoang linh Chi’,’Hai An- Hai Phong’,’0967297558’)

-	ChiTietDDH (MaDDH , MaSP , SoLuong)

+, Insert into ChiTietDDH(MaDDH,MaSP,SoLuong)
 
Values(‘DDH1’,’DH’,’5’)
+, Insert into ChiTietDDH(MaDDH,MaSP,SoLuong) Values(‘DDH2’,’TL’,’7’)
+, Insert into ChiTietDDH(MaDDH,MaSP,SoLuong) Values(‘DDH3’,’TV’,’3’)
+, Insert into ChiTietDDH(MaDDH,MaSP,SoLuong) Values(‘DDH4’,’NCD’,’5’)
+, Insert into ChiTietDDH(MaDDH,MaSP,SoLuong) Values(‘DDH5’,’MLN’,’29’)
+, Insert into ChiTietDDH(MaDDH,MaSP,SoLuong) Values(‘DDH6’,’MLN’,’21’)
+, Insert into ChiTietDDH(MaDDH,MaSP,SoLuong) Values(‘DDH7’,’MLN’,’42’)
+, Insert into ChiTietDDH(MaDDH,MaSP,SoLuong) Values(‘DDH8’,’MLN’,’32’)
+, Insert into ChiTietDDH(MaDDH,MaSP,SoLuong) Values(‘DDH9’,’MLN’,’20’)
+, Insert into ChiTietDDH(MaDDH,MaSP,SoLuong) Values(‘DDH10’,’MLN’,’12’)

-	DonDatHang (MaDDH , MaKH , NgayLap , NgayGiao , NoiGiaoHang)

+, Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiao,NoiGiaoHang) Values(‘DDH1’,’KH1’,’2014-02-03’,’2014-03-25’,’Tan Binh- Sai Gon’)
+, Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiao,NoiGiaoHang) Values(‘DDH2’,’KH2’,’2013-01-03’,’2013-05-15’,’Hiep Hoa- Bac Giang’)
+, Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiao,NoiGiaoHang) Values(‘DDH3’,’KH3’,’2014-01-05’,’2014-01-27’,’Thuy Nguyen- Hai Phong’)
+, Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiao,NoiGiaoHang) Values(‘DDH4’,’KH4’,’2014-04-03’,’2014-08-20’,’Hoan Kiem- Ha Noi’)
+, Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiao,NoiGiaoHang) Values(‘DDH5’,’KH5’,’2014-02-18’,’2014-05-12’,’Hai An- hai Phong’)
+, Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiao,NoiGiaoHang) Values(‘DDH6’,’KH6’,’2013-02-18’,’2013-07-12’,’Hai An- hai Phong’)
+, Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiao,NoiGiaoHang) Values(‘DDH7’,’KH7’,’2013-02-18’,’2013-04-18’,’Hai An- hai Phong’)
+, Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiao,NoiGiaoHang) Values(‘DDH8’,’KH8’,’2013-02-18’,’2013-07-22’,’Hai An- hai Phong’)
+, Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiao,NoiGiaoHang) Values(‘DDH9’,’KH9’,’2013-02-18’,’2013-07-30’,’Hai An- hai Phong’)
+, Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiao,NoiGiaoHang) Values(‘DDH10’,’KH10’,’2014-02-18’,’2014-01-12’,’Hai An- hai Phong’)

-	ChiTietTT ( MaPTT , SoHoaDon , SoTienNo )
 
+, Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo) Values(‘PTT1’,’HD1’,’’)
+, Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo) Values(‘PTT2’,’HD2’,’’)
+, Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo) Values(‘PTT3’,’HD3’,’’)
+, Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo) Values(‘PTT4’,’HD4’,’’)
+, Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo) Values(‘PTT5’,’HD5’,’’)
+, Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo) Values(‘PTT6’,’HD6’,’’)
+, Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo) Values(‘PTT7’,’HD7’,’’)
+, Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo) Values(‘PTT8’,’HD8’,’’)
+, Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo) Values(‘PTT9’,’HD9’,’’)
+, Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo) Values(‘PTT10’,’HD10’,’’)

-	PhieuThanhToan (MaPTT ,MaKH, NgayTT , SoTienTT)

+, Insert into PhieuThanhToan(MaPTT, MaKH, NgayTT,SoTienTT) Values(‘PTT1’,’KH1’,’2014-03-25’,’5000000’)
+, Insert into PhieuThanhToan(MaPTT, MaKH, NgayTT,SoTienTT) Values(‘PTT2’,’KH2’,’2013-05-15’,’7000000’)
+, Insert into PhieuThanhToan(MaPTT, MaKH, NgayTT,SoTienTT) Values(‘PTT3’,’KH3’,’2014-01-27’,’3000000’)
+, Insert into PhieuThanhToan(MaPTT, MaKH, NgayTT,SoTienTT) Values(‘PTT4’,’KH4’,’2013-08-20’,’5000000’)
+, Insert into PhieuThanhToan(MaPTT, MaKH, NgayTT,SoTienTT) Values(‘PTT5’,’KH5’,’2014-05-12’,’29000000’)
+, Insert into PhieuThanhToan(MaPTT, MaKH, NgayTT,SoTienTT) Values(‘PTT6’,’KH6’,’2013-07-12’,’21000000’)
+, Insert into PhieuThanhToan(MaPTT, MaKH, NgayTT,SoTienTT) Values(‘PTT7’,’KH7’,’2014-04-18’,’42000000’)
+, Insert into PhieuThanhToan(MaPTT, MaKH, NgayTT,SoTienTT) Values(‘PTT8’,’KH8’,’2013-07-22’,’32000000’)
+, Insert into PhieuThanhToan(MaPTT, MaKH, NgayTT,SoTienTT) Values(‘PTT9’,’KH9’,’2013-07-30’,’20000000’)
+, Insert into PhieuThanhToan(MaPTT, MaKH, NgayTT,SoTienTT) Values(‘PTT10’,’KH10’,’2014-01-12’,’12000000’)
 
-	DonGia (MaDG , NgayCapNhat , GiaGoc , GiaBan , ThueGTGT , KhongSuDung)

+, Insert into DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,ThueGTGT, KhongSuDung)
Values(‘DG1’,’900000’,’1000000’,’10%’,’1’)
+, Insert into DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,GTGT,KhongSuDung)
Values(‘DG2’,’800000’,’1000000’,’10%’,’0’)
+, Insert into DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,GTGT,KhongSuDung)
Values(‘DG3’,’700000’,’1000000’,’10%’,’1’)
+, Insert into DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,GTGT,KhongSuDung)
Values(‘DG4’,’600000’,’1000000’,’10%’,’0’)
+, Insert into DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,GTGT,KhongSuDung)
Values(‘DG5’,’850000’,’1000000’,’10%’,’1’)
+, Insert into DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,GTGT,KhongSuDung)
Values(‘DG6’,’850000’,’1000000’,’10%’,’0’)
+, Insert into DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,GTGT,KhongSuDung)
Values(‘DG7’,’850000’,’1000000’,’10%’,’0’)
+, Insert into DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,GTGT,KhongSuDung)
Values(‘DG8’,’850000’,’1000000’,’10%’,’1’)
+, Insert into DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,ThueGTGT,KhongSuDung)
Values(‘DG9’,’850000’,’1000000’,’10%’,’0’)
+, Insert into DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,ThueGTGT,KhongSuDung)
Values(‘DG10’,’850000’,’1000000’,’10%’,’0’)

-	LoaiSP (MaLoai , TenLoai)

+,Insert into LoaiSP(MaLoai,TenLoai) Values(‘ML1’,’Do Gia Dung’)
+,Insert into LoaiSP(MaLoai,TenLoai) Values(‘ML2’,’Do Gia Dung’)
+,Insert into LoaiSP(MaLoai,TenLoai) Values(‘ML3’,’Do Gia Dung’)
+,Insert into LoaiSP(MaLoai,TenLoai) Values(‘ML4’,’Do Gia Dung’)
 
+,Insert into LoaiSP(MaLoai,TenLoai) Values(‘ML5’,’Do Gia Dung’)
+,Insert into LoaiSP(MaLoai,TenLoai) Values(‘ML6’,’Do Gia Dung’)
+,Insert into LoaiSP(MaLoai,TenLoai) Values(‘ML7’,’Do Gia Dung’)
+,Insert into LoaiSP(MaLoai,TenLoai) Values(‘ML8’,’Do Gia Dung’)
+,Insert into LoaiSP(MaLoai,TenLoai) Values(‘ML9’,’Do Gia Dung’)
+,Insert into LoaiSP(MaLoai,TenLoai) Values(‘ML10’,’Do Gia Dung’)

-	PhieuBaoHanh( MaBH , NgayBatDau , NgayKetThuc)

+,Insert into PhieuBaoHanh(MaBH,NgayBatDau,NgayKetThuc) Values(‘MBH1’,’2014-03-25’,’2015-03-25’)
+,Insert into PhieuBaoHanh(MaBH,NgayBatDau,NgayKetThuc) Values(‘MBH2’,’2013-05-15’,’2014-05-15’)
+,Insert into PhieuBaoHanh(MaBH,NgayBatDau,NgayKetThuc) Values(‘MBH3’,’2014-01-27’,’2015-01-27’)
+,Insert into PhieuBaoHanh(MaBH,NgayBatDau,NgayKetThuc) Values(‘MBH4’,’2013-08-20’,’2014-08-20’)
+,Insert into PhieuBaoHanh(MaBH,NgayBatDau,NgayKetThuc) Values(‘MBH5’,’2014-05-12’,’2015-05-12’)
+,Insert into PhieuBaoHanh(MaBH,NgayBatDau,NgayKetThuc) Values(‘MBH6’,’2013-07-12’,’2014-07-12’)
+,Insert into PhieuBaoHanh(MaBH,NgayBatDau,NgayKetThuc) Values(‘MBH7’,’2014-04-18’,’2015-04-18’)
+,Insert into PhieuBaoHanh(MaBH,NgayBatDau,NgayKetThuc) Values(‘MBH8’,’2013-07-22’,’2014-07-22’)
+,Insert into PhieuBaoHanh(MaBH,NgayBatDau,NgayKetThuc) Values(‘MBH9’,’2013-07-30’,’2014-07-30’)
+,Insert into PhieuBaoHanh(MaBH,NgayBatDau,NgayKetThuc) Values(‘MBH10’,’2014-01-12’,’2015-01-12’)

-	NhanVien(MaNV , TenNV , DiaChi , DienThoai )

+,Insert into NhanVien(MaNV,TenNV,DiaChi,DienThoai) Values(‘NV1’,’Truong my Uyen’,’Dong Da- Ha Noi’,’01678564269’)
+,Insert into NhanVien(MaNV,TenNV,DiaChi,DienThoai) Values(‘NV2’,’Nguyen my Linh’,’Hai Ba Trung- Ha Noi’,’01674523269’)
+,Insert into NhanVien(MaNV,TenNV,DiaChi,DienThoai,) Values(‘NV3’,’Truong my Uyen’,’Bac Tu Liem- Ha Noi’,’01278967269’)
 
+,Insert into NhanVien(MaNV,TenNV,DiaChi,DienThoai) Values(‘NV4’,’Luu Nhat Ba,’Dong Da- Ha Noi’,’01678668219’)
+,Insert into NhanVien(MaNV,TenNV,DiaChi,DienThoai) Values(‘NV5’,’Hoang Hai Dang’,’Hai An- Hai Phong’,’01648366329’)
+,Insert into NhanVien(MaNV,TenNV,DiaChi,DienThoai) Values(‘NV6’,’Truong nam Thanh’,’Kien An- Hai Phong’,’01645331425’)
+,Insert into NhanVien(MaNV,TenNV,DiaChi,DienThoai) Values(‘NV7’,’Chu van Manh’,’Do Son- Hai Phong’,’01648135425’)
+,Insert into NhanVien(MaNV,TenNV,DiaChi,DienThoai) Values(‘NV8’,’Duong thi thanh Dung’,’Le Chan- Hai Phong’,’01698336126’)
+,Insert into NhanVien(MaNV,TenNV,DiaChi,DienThoai) Values(‘NV9’,’Phan vu van Khanh’,’Hai An- Hai Phong’,’01648356525’)
+,Insert into NhanVien(MaNV,TenNV,DiaChi,DienThoai) Values(‘NV10’,’Hoang thi Thao’,’Kien An- Hai Phong’,’01645337423’)






3.4.	Tạo các View
-	View thống kê những sản phẩm hết hạn bảo hành: create view vwSanPhanHetHanBH
AS
select S.MaSp,S.TenSp
From SanPham S inner join PhieuBaoHanh P on S.MaPhieuBH=P.MaPhieuBH where P.NgayKetThuc < GETDATE()
- View thống kê sản phẩm bán chạy nhất: Create view VwBanChayNhat
AS
Select top 1 with ties S.MaSP,S.TenSP,Sum(SoLuong) Tong From SanPham S inner join ChiTietXuat C on S.MaSP=C.MaSP Group by S.MaSP,S.TenSP
Order by Tong DESC




3.5.	Tạo các Stored Procedure

-		Thủ tục thống kê các sản phẩm có giá bán nhỏ hơn số tiền M cho trước: create proc SpDonGia (@M money)
AS
 
Begin
Select MaSP,TenSp From SanPham S inner join DonGia D On S.MaDG=D.MaDG where D.GiaBan<@M
End
-	Thủ tục thống kê các nhân viên nhập hàng trong ngày S cho trước: create proc SpNhanVien(@S datetime)
AS
Begin
Select N.MaNV,TenNV
From NhanVien N inner join PhieuNhap P On N.MaNV=P.MaNV where P.NgayNhap=@S
End

3.6.	Tạo các Function
-		Hàm trả về số nợ của khách hàng tính đến thời điểm hiện tại: create function FnTienNo( @t char(10) )
returns money as
begin
declare @kq money
select @kq = sum(sotienno)
from (ChiTietTT CT inner join PhieuThanhToan PTT on CT.MaPTT=PTT.MaPTT) inner join KhachHang KH on PTT.MaKH=KH.MaKH where KH.MaKH = @t
return @kq end
-	Hàm tính đơn giá trung bình của các sản phẩm: create function FnDonGiaTB()
returns  money
As Begin
Declare @giatb money
select @giatb=AVG(D.GiaBan) from DonGia D
return @giatb End

3.7.	Tạo các Tạo các Trigger
-	Khi thêm 1 chi tiết phiếu xuất thì số lượng tồn kho giảm đi: create trigger Trgxuat
on ChiTietXuat for insert
 
as begin
update SanPham set SanPham.TonKho = SanPham.TonKho - inserted.SoLuong
From SanPham inner join inserted on SanPham.MaSP = inserted.MaSP
end
-	Khi thêm 1 chi tiết phiếu nhập thì số lượng tồn kho tăng lên:

create trigger TrgNhap on ChiTietNhap
for insert as
begin
update SanPham set SanPham.TonKho = SanPham.TonKho + inserted.SoLuong
from SanPham inner join inserted on SanPham.MaSP = inserted.MaSP
end


