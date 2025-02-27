USE [CustomerSeven]
GO
/****** Object:  Table [dbo].[UnitType]    Script Date: 11-01-2025 00:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitType](
	[UnitTypeId] [uniqueidentifier] NOT NULL,
	[UnitTypeName] [nvarchar](50) NOT NULL,
	[MeasurementTypeId] [uniqueidentifier] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateLastModified] [datetime] NOT NULL,
 CONSTRAINT [PK_UnitType] PRIMARY KEY CLUSTERED 
(
	[UnitTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_UnitType_MeasurementTypeId]    Script Date: 11-01-2025 00:44:04 ******/
CREATE NONCLUSTERED INDEX [IX_UnitType_MeasurementTypeId] ON [dbo].[UnitType]
(
	[MeasurementTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQIX_UnitType_UnitTypeName]    Script Date: 11-01-2025 00:44:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQIX_UnitType_UnitTypeName] ON [dbo].[UnitType]
(
	[UnitTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UnitType] ADD  CONSTRAINT [DF_UnitType_UnitTypeId]  DEFAULT (newid()) FOR [UnitTypeId]
GO
ALTER TABLE [dbo].[UnitType] ADD  CONSTRAINT [DF_UnitType_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[UnitType] ADD  CONSTRAINT [DF_UnitType_DateLastModified]  DEFAULT (getdate()) FOR [DateLastModified]
GO
ALTER TABLE [dbo].[UnitType]  WITH CHECK ADD  CONSTRAINT [FK_UnitType_MeasurementType] FOREIGN KEY([MeasurementTypeId])
REFERENCES [dbo].[MeasurementType] ([MeasurementTypeId])
GO
ALTER TABLE [dbo].[UnitType] CHECK CONSTRAINT [FK_UnitType_MeasurementType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The UnitType entity defines the list of measurement units that categorize a MeasurementType.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnitType'
GO
