-- Tạo một thủ tục có tên là XINCHAOTG và in ra câu 'HELLO WORLD'
-- TẠO THỦ TỤC
CREATE PROCEDURE XINCHAOTG
AS
	PRINT 'HELLO WORLD'
-- THỰC THI THỦ TỤC
EXEC XINCHAOTG
-- XOÁ THỦ TỤC
DROP PROC XINCHAOTG


-- Thủ tục nhập vào họ tên và in ra câu 'Xin chào ' + họ tên được nhập vào

CREATE PROCEDURE XINCHAO
@HOTEN NVARCHAR(40), @LOP NVARCHAR(30)
AS
	BEGIN
	PRINT N'XIN CHÀO ' +@HOTEN + ' '+@LOP
	END
GO

EXEC XINCHAO @HOTEN = N'Đinh Thị Tuyết Chinh', @LOP = '12DHTH13'
	-- THAY ĐỔI NỘI DUNG THỦ TỤC
ALTER PROC XINCHAO
@HOTEN NVARCHAR(40), @LOP NVARCHAR(30)
AS
	BEGIN
	PRINT N'Chào ' +@HOTEN + ' '+@LOP
	END
GO

EXEC XINCHAO @HOTEN = N'Đinh Thị Tuyết Chinh', @LOP = '12DHTH13'
	-- Ví dụ tham số đầu vào
CREATE PROC CONG @a INT, @b INT
AS
	PRINT @a + @b
GO

EXEC CONG @a = 3, @b = 2

	CREATE PROC DSLOP @MALOP CHAR(10)
	AS
		SELECT *
		FROM SINHVIEN
		WHERE MALOP = @MALOP
	GO


	CREATE PROC TT_SV @MASV CHAR(10) = 'SV001'
	AS
		SELECT *
		FROM SINHVIEN
		WHERE MASV = @MASV
	GO

	-- EXEC TT_SV

--- Mã hoá thủ tục
CREATE PROC ENCRYTION_MASV
@MASV CHAR(10)
WITH ENCRYPTION
AS
	BEGIN
		SELECT *
		FROM SINHVIEN
		WHERE MASV = @MASV
	END
GO
sp_HelpText ENCRYTION_MASV

--- Biên dịch thủ tục
--CREATE PROC RECOMPILE
--@MASV CHAR
--WITH RECOMPILE
--AS
--	BEGIN
--		SELECT *
--		FROM SINHVIEN
--		WHERE MASV = @MASV
--	END
--GO


CREATE PROCEDURE sp_dosomething_sub
@AdrID CHAR
WITH RECOMPILE
AS
    SELECT TENKHOA FROM KHOA WHERE MAKHOA = @AdrID
GO


EXEC  sp_recompile sp_dosomething_sub @AdrID = 'QT'

	SELECT * FROM KHOA

--- Gọi hàm trong thủ tục	
-- Định nghĩa một hàm
CREATE FUNCTION MyFunction (@param1 INT)
RETURNS INT
AS
BEGIN
    DECLARE @result INT
    -- Thực hiện các công việc trong hàm và gán kết quả cho @result
    SET @result = @param1 * 2
    RETURN @result
END


-- Gọi hàm
 DECLARE @PARAM INT
 SET @PARAM = dbo.MyFunction(5)
 PRINT @PARAM
-- Định nghĩa một thủ tục lưu trữ
CREATE PROCEDURE MyProcedure
AS
BEGIN
    DECLARE @output INT
    -- Gọi hàm MyFunction và lưu kết quả vào @output
    SET @output = dbo.MyFunction(5)
    -- Sử dụng kết quả trong thủ tục lưu trữ
    PRINT N'Kết quả từ hàm là: ' + CAST(@output AS VARCHAR)
END
EXEC MyProcedure