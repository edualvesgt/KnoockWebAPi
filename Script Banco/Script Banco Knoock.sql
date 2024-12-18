/****** Object:  Database [KnoockDatabase]    Script Date: 06/12/2024 09:08:30 ******/
CREATE DATABASE [KnoockDatabase]  (EDITION = 'Standard', SERVICE_OBJECTIVE = 'S0', MAXSIZE = 250 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [KnoockDatabase] SET COMPATIBILITY_LEVEL = 160
GO
ALTER DATABASE [KnoockDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KnoockDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KnoockDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KnoockDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KnoockDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [KnoockDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KnoockDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KnoockDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KnoockDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KnoockDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KnoockDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KnoockDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KnoockDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KnoockDatabase] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [KnoockDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KnoockDatabase] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [KnoockDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [KnoockDatabase] SET ENCRYPTION ON
GO
ALTER DATABASE [KnoockDatabase] SET QUERY_STORE = ON
GO
ALTER DATABASE [KnoockDatabase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** Os scripts das configurações no escopo do banco de dados no Azure devem ser executados dentro da conexão de banco de dados de destino. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[Afiliado]    Script Date: 06/12/2024 09:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Afiliado](
	[ID] [uniqueidentifier] NOT NULL,
	[TipoUsuario_ID] [uniqueidentifier] NOT NULL,
	[KnookCoins] [int] NOT NULL,
	[Fg_Online] [bit] NOT NULL,
	[Fg_Transito] [bit] NOT NULL,
	[Fg_Resgatado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Condomino]    Script Date: 06/12/2024 09:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Condomino](
	[ID] [uniqueidentifier] NOT NULL,
	[TipoUsuario_ID] [uniqueidentifier] NOT NULL,
	[DeliveryPin] [nvarchar](10) NULL,
	[PIN] [nvarchar](6) NULL,
	[Bloco] [nvarchar](5) NULL,
	[Apartamento] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrega]    Script Date: 06/12/2024 09:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrega](
	[ID] [uniqueidentifier] NOT NULL,
	[TipoUsuario_ID] [uniqueidentifier] NOT NULL,
	[Data_Registro] [datetime] NULL,
	[Status] [nvarchar](10) NOT NULL,
	[Foto_Produto] [nvarchar](255) NULL,
	[Notificacao_Morador] [bit] NULL,
	[PIN_Retirada] [nvarchar](10) NULL,
	[Data_Retirada] [datetime] NULL,
	[Data_Notificacao] [datetime] NULL,
	[Observacao] [text] NULL,
	[Origem] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notificacao]    Script Date: 06/12/2024 09:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notificacao](
	[ID] [uniqueidentifier] NOT NULL,
	[TipoUsuario_ID] [uniqueidentifier] NOT NULL,
	[Mensagem] [nvarchar](255) NULL,
	[Data_Notificacao] [datetime] NULL,
	[Status] [nvarchar](20) NULL,
	[Tipo] [nvarchar](20) NULL,
	[Imagem_Aviso] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notificacao_Entrega]    Script Date: 06/12/2024 09:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notificacao_Entrega](
	[Notificacao_ID] [uniqueidentifier] NOT NULL,
	[Entrega_ID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Notificacao_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo]    Script Date: 06/12/2024 09:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo](
	[ID] [uniqueidentifier] NOT NULL,
	[tipo] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[tipo] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Usuario]    Script Date: 06/12/2024 09:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Usuario](
	[ID] [uniqueidentifier] NOT NULL,
	[Id_usuario] [uniqueidentifier] NOT NULL,
	[Id_Tipo] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 06/12/2024 09:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [uniqueidentifier] NOT NULL,
	[Nome] [nvarchar](100) NOT NULL,
	[Telefone] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Data_Nascimento] [date] NULL,
	[Endereco] [nvarchar](255) NULL,
	[Senha] [nvarchar](255) NOT NULL,
	[Codigo_Recuperacao] [int] NULL,
	[Foto_Usuario] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Veiculo]    Script Date: 06/12/2024 09:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Veiculo](
	[ID] [uniqueidentifier] NOT NULL,
	[TipoUsuario_ID] [uniqueidentifier] NOT NULL,
	[Entrega_ID] [uniqueidentifier] NULL,
	[Marca] [nvarchar](50) NULL,
	[Modelo] [nvarchar](50) NULL,
	[Placa] [nvarchar](10) NULL,
	[Ano] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Afiliado] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Afiliado] ADD  DEFAULT ((0)) FOR [KnookCoins]
GO
ALTER TABLE [dbo].[Condomino] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Entrega] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Entrega] ADD  DEFAULT ((0)) FOR [Notificacao_Morador]
GO
ALTER TABLE [dbo].[Notificacao] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Tipo] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Tipo_Usuario] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Veiculo] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Afiliado]  WITH CHECK ADD FOREIGN KEY([TipoUsuario_ID])
REFERENCES [dbo].[Tipo_Usuario] ([ID])
GO
ALTER TABLE [dbo].[Condomino]  WITH CHECK ADD FOREIGN KEY([TipoUsuario_ID])
REFERENCES [dbo].[Tipo_Usuario] ([ID])
GO
ALTER TABLE [dbo].[Entrega]  WITH CHECK ADD FOREIGN KEY([TipoUsuario_ID])
REFERENCES [dbo].[Tipo_Usuario] ([ID])
GO
ALTER TABLE [dbo].[Notificacao]  WITH CHECK ADD FOREIGN KEY([TipoUsuario_ID])
REFERENCES [dbo].[Tipo_Usuario] ([ID])
GO
ALTER TABLE [dbo].[Notificacao_Entrega]  WITH CHECK ADD FOREIGN KEY([Entrega_ID])
REFERENCES [dbo].[Entrega] ([ID])
GO
ALTER TABLE [dbo].[Notificacao_Entrega]  WITH CHECK ADD FOREIGN KEY([Notificacao_ID])
REFERENCES [dbo].[Notificacao] ([ID])
GO
ALTER TABLE [dbo].[Tipo_Usuario]  WITH CHECK ADD FOREIGN KEY([Id_Tipo])
REFERENCES [dbo].[Tipo] ([ID])
GO
ALTER TABLE [dbo].[Tipo_Usuario]  WITH CHECK ADD FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[Usuario] ([ID])
GO
ALTER TABLE [dbo].[Veiculo]  WITH CHECK ADD FOREIGN KEY([Entrega_ID])
REFERENCES [dbo].[Entrega] ([ID])
GO
ALTER TABLE [dbo].[Veiculo]  WITH CHECK ADD FOREIGN KEY([TipoUsuario_ID])
REFERENCES [dbo].[Tipo_Usuario] ([ID])
GO
ALTER DATABASE [KnoockDatabase] SET  READ_WRITE 
GO
