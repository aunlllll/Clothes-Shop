use[master]
go
create database [clothes_shop]
go

USE [clothes_shop]
GO
/****** Object:  Table [dbo].[fatora]    Script Date: 10/23/2017 14:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fatora](
	[f_number] [int] NOT NULL,
	[f_s_code] [int] NULL,
	[f_s_name] [nvarchar](200) NULL,
	[f_s_maqas] [nvarchar](50) NULL,
	[f_s_color] [nvarchar](50) NULL,
	[f_s_prize] [money] NULL,
	[f_date] [date] NULL,
	[f_s_gomla] [money] NULL,
	[f_s_maksab] [money] NULL,
	[f_s_mol] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mowareden]    Script Date: 10/23/2017 14:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mowareden](
	[m_name] [nvarchar](200) NOT NULL,
	[m_mobile] [int] NULL,
	[m_telephone] [int] NULL,
	[m_facs] [nvarchar](100) NULL,
	[m_e_mail] [nvarchar](100) NULL,
	[m_adress] [nvarchar](100) NULL,
	[m_nashat] [nvarchar](100) NULL,
	[m_draft] [nvarchar](100) NULL,
	[m_egmaly_mostahak] [money] NULL,
	[m_date] [date] NULL,
 CONSTRAINT [PK_mowareden] PRIMARY KEY CLUSTERED 
(
	[m_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[message]    Script Date: 10/23/2017 14:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message](
	[m_s_name] [nvarchar](200) NOT NULL,
	[m_s_number] [int] NULL,
	[m_s_less_number] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_detail]    Script Date: 10/23/2017 14:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_detail](
	[m_name] [nvarchar](200) NOT NULL,
	[m_sdd] [money] NULL,
	[m_baky] [money] NULL,
	[m_mtbky] [money] NULL,
	[m_date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[asnaf]    Script Date: 10/23/2017 14:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[asnaf](
	[s_code] [int] NOT NULL,
	[s_name] [nvarchar](200) NOT NULL,
	[s_maqas] [nvarchar](50) NULL,
	[s_color] [nvarchar](50) NULL,
	[s_prize] [money] NOT NULL,
	[s_gomla] [money] NULL,
	[s_maksab] [money] NULL,
	[s_mol] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[s_select_by_s_name]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[s_select_by_s_name]
	@s_name nvarchar(200)
AS
	SELECT s_code 'كود الصنف' , s_name 'إسم الصنف' ,s_maqas 'مقاس الصنف' , s_color 'لون الصنف' , s_prize 'سعر الصنف' from asnaf where s_name like '%'+@s_name+'%'
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[s_insert]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[s_insert]
@s_code int,
@s_name nvarchar(200),
@s_maqas nvarchar(50),
@s_color nvarchar(50),
@s_prize float,
@s_gomla float,
@s_maksab float,
@s_mol nvarchar(1000)
as 
insert into asnaf
(s_code,
s_name,
s_maqas,
s_color,
s_prize,
s_gomla,
s_maksab,
s_mol)

values
(@s_code,
@s_name,
@s_maqas,
@s_color,
@s_prize,
@s_gomla,
@s_maksab,
@s_mol)

return
GO
/****** Object:  StoredProcedure [dbo].[s_delete]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[s_delete]
@s_code int

as
delete from asnaf where s_code=@s_code

return
GO
/****** Object:  StoredProcedure [dbo].[m_delete_by_name]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[m_delete_by_name]
@m_s_name nvarchar(200)
as
delete from message where m_s_name=@m_s_name
return
GO
/****** Object:  StoredProcedure [dbo].[m_delete]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[m_delete]
@m_name nvarchar(200)

as
delete from mowareden where m_name=@m_name

return
GO
/****** Object:  StoredProcedure [dbo].[m_d_select_by_name]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[m_d_select_by_name]
	@m_name nvarchar(200)
AS
	select m_sdd'مبلغ مسدد' , m_baky'إضافة باقى' , m_mtbky'المتبقى' , m_date'التاريخ' from m_detail where m_name =@m_name
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[m_d_insert]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[m_d_insert]
@m_name nvarchar(200),
@m_sdd money,
@m_baky money,
@m_mtbky money,
@m_date date

as 
insert into m_detail(m_name,
m_sdd,
m_baky,
m_mtbky,
m_date)
values(@m_name,
@m_sdd,
@m_baky,
@m_mtbky,
@m_date)

return
GO
/****** Object:  StoredProcedure [dbo].[m_all_by_name]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[m_all_by_name]
	@m_name nvarchar(200)
AS
	SELECT * from mowareden where m_name like @m_name
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[m_update_egmaly_mostahak]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[m_update_egmaly_mostahak]
	@m_name nvarchar(200),
	@m_egmaly_mostahak money
AS
	update mowareden set m_egmaly_mostahak=@m_egmaly_mostahak where m_name=@m_name
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[m_update_by_name_for_less_number]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[m_update_by_name_for_less_number]

@m_s_name nvarchar(200),
@m_s_less_number int

AS

	update message set m_s_less_number=@m_s_less_number where m_s_name=@m_s_name
	return 0
GO
/****** Object:  StoredProcedure [dbo].[m_update_by_name]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[m_update_by_name]

@m_s_name nvarchar(200),
@m_s_number int

AS

	update message set m_s_number=@m_s_number where m_s_name=@m_s_name
	return 0
GO
/****** Object:  StoredProcedure [dbo].[m_select_egmaly_mostahak]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[m_select_egmaly_mostahak]
	@m_name nvarchar(200)
AS
	SELECT m_egmaly_mostahak,m_date from mowareden where m_name like @m_name
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[m_select_all_txt]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[m_select_all_txt]
AS

	SELECT m_s_name , m_s_number , m_s_less_number from message
return 0
GO
/****** Object:  StoredProcedure [dbo].[m_select_all_by_s_name]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[m_select_all_by_s_name]
@m_s_name nvarchar(200)

AS

	SELECT * from message where m_s_name=@m_s_name
return 0
GO
/****** Object:  StoredProcedure [dbo].[m_select_all]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[m_select_all]
AS

	SELECT m_s_name 'إسم الصنف' , m_s_number 'العدد' , m_s_less_number 'حد أدنى' from message
return 0
GO
/****** Object:  StoredProcedure [dbo].[m_insert_all]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[m_insert_all]
@m_s_name nvarchar(200),
@m_s_number int,
@m_s_less_number int
AS
	insert into message(m_s_name,m_s_number,m_s_less_number)
	values(@m_s_name,@m_s_number,@m_s_less_number)
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[m_insert]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[m_insert]
@m_name nvarchar(200),
@m_mobile int,
@m_telephone int,
@m_facs nvarchar(100),
@m_e_mail nvarchar(100),
@m_adress nvarchar(100),
@m_nashat nvarchar(100),
@m_draft nvarchar(100),
@m_date date

as 
insert into mowareden(m_name,
m_mobile,
m_telephone,
m_facs,
m_e_mail,
m_adress,
m_nashat,
m_draft,
m_date)
values(@m_name,
@m_mobile,
@m_telephone,
@m_facs,
@m_e_mail,
@m_adress,
@m_nashat,
@m_draft,
@m_date)

return
GO
/****** Object:  StoredProcedure [dbo].[f_select_gard]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[f_select_gard]
	@f_s_date date,
	@f_f_date date
AS
	SELECT f_number 'رقم فاتورة الصنف' , f_s_code 'كود الصنف' , f_s_name 'إسم الصنف' , f_s_color 'لون الصنف' , f_s_prize 'سعر الصنف' ,f_s_gomla 'سعر الجمله' , f_s_maksab 'المكسب' , f_date 'التاريخ' , f_s_mol '      الملاحظات      '  from fatora where (f_date >= @f_s_date) and (f_date <= @f_f_date) 
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[f_select_fatora_id]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[f_select_fatora_id]
AS

	SELECT f_number from fatora
return 0
GO
/****** Object:  StoredProcedure [dbo].[f_select_by_s_id_t_1]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[f_select_by_s_id_t_1]
	@s_code int
AS
	SELECT s_code 'كود الصنف' , s_name 'إسم الصنف' , s_color 'لون الصنف' , s_prize 'سعر الصنف', s_gomla 'سعر الجمله' , s_maksab 'المكسب' , s_mol 'ملاحظات' from asnaf where s_code = @s_code
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[f_select_by_s_id]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[f_select_by_s_id]
	@s_code int
AS
	SELECT s_code , s_name ,s_maqas , s_color , s_prize , s_gomla , s_maksab , s_mol from asnaf where s_code = @s_code
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[f_select_all_by_f_number]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[f_select_all_by_f_number]
@f_number int
AS

	SELECT f_s_code 'كود الصنف' , f_s_name 'إسم الصنف' , f_s_color 'لون الصنف' , f_s_prize 'سعر الصنف' ,f_s_gomla 'سعر الجمله' , f_s_maksab 'المكسب' , f_date 'التاريخ' , f_s_mol 'الملاحظات' from fatora where f_number=@f_number
return 0
GO
/****** Object:  StoredProcedure [dbo].[f_insert_f_number]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[f_insert_f_number]

AS
	insert into fatora(f_number,f_s_code)
	values (1021,1)

RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[f_insert]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[f_insert] 
@f_number int,
@f_s_code int,
@f_s_name nvarchar(200),
@f_s_maqas nvarchar(50),
@f_s_color nvarchar(50),
@f_s_prize money,
@f_date date,
@f_s_gomla money,
@f_s_maksab money,
@f_s_mol nvarchar(1000)

AS
	insert into fatora(f_number,f_s_code,f_s_name,f_s_maqas,f_s_color,f_s_prize,f_date,f_s_gomla,f_s_maksab,f_s_mol)
	values (@f_number,@f_s_code,@f_s_name,@f_s_maqas,@f_s_color,@f_s_prize,@f_date,@f_s_gomla,@f_s_maksab,@f_s_mol);

RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[f_delete_number]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[f_delete_number]

as
delete from fatora 

return
GO
/****** Object:  StoredProcedure [dbo].[f_delete_by_f_number]    Script Date: 10/23/2017 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[f_delete_by_f_number]
@f_number int

as
delete from fatora where f_number=@f_number

return
GO
