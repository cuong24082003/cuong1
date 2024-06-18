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
