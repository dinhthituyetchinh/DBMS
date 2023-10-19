
-- HÀM UPPER => dùng để chuyển đổi một chuỗi ký tự thành chữ in hoa
SELECT UPPER(N' Đinh Thị Tuyết Chinh') as 'IN HOA TÊN' 
SELECT N'Họ và tên sinh viên' = UPPER(HOTEN) FROM SINHVIEN
-- HÀM LOWER => dùng để chuyển đổi một chuỗi ký tự thành chữ thường
SELECT LOWER(N'ĐINH THỊ TUYẾT CHINH') as 'IN THƯỜNG TÊN' 
SELECT N'Họ và tên sinh viên' = LOWER(HOTEN) FROM SINHVIEN
-- HÀM LEFT => trả về một chuỗi con được trích ra từ chuỗi nguồn bắt đầu từ vị trí bên trái
PRINT LEFT('Đinh Thị Tuyết Chinh', 4)
-- HÀM RIGHT => trả về một chuỗi con được trích ra từ chuỗi nguồn bắt đầu từ vị trí bên phải
PRINT RIGHT('Đinh Thị Tuyết Chinh', 5)
SELECT * FROM SINHVIEN
 
