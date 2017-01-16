
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/15/2017 20:05:56
-- Generated from EDMX file: C:\Users\Lenin\documents\visual studio 2015\Projects\TriviaWeb\TriviaWeb\Models\DB\ModelTriviaDB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CompanyEmployee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeSet] DROP CONSTRAINT [FK_CompanyEmployee];
GO
IF OBJECT_ID(N'[dbo].[FK_GameEmployeGame]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeGameSet] DROP CONSTRAINT [FK_GameEmployeGame];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeEmployeGame]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeGameSet] DROP CONSTRAINT [FK_EmployeeEmployeGame];
GO
IF OBJECT_ID(N'[dbo].[FK_OptionAnswer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AnswerSet] DROP CONSTRAINT [FK_OptionAnswer];
GO
IF OBJECT_ID(N'[dbo].[FK_QuestionOption]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OptionSet] DROP CONSTRAINT [FK_QuestionOption];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeGameAnswer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AnswerSet] DROP CONSTRAINT [FK_EmployeGameAnswer];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoryQuestion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[QuestionSet] DROP CONSTRAINT [FK_CategoryQuestion];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[CompanySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CompanySet];
GO
IF OBJECT_ID(N'[dbo].[EmployeeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EmployeeSet];
GO
IF OBJECT_ID(N'[dbo].[GameSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GameSet];
GO
IF OBJECT_ID(N'[dbo].[EmployeeGameSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EmployeeGameSet];
GO
IF OBJECT_ID(N'[dbo].[AnswerSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AnswerSet];
GO
IF OBJECT_ID(N'[dbo].[OptionSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OptionSet];
GO
IF OBJECT_ID(N'[dbo].[QuestionSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[QuestionSet];
GO
IF OBJECT_ID(N'[dbo].[CategorySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CategorySet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'CompanySet'
CREATE TABLE [dbo].[CompanySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EmployeeSet'
CREATE TABLE [dbo].[EmployeeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Username] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Cellphone] nvarchar(max)  NOT NULL,
    [CompanyId] int  NOT NULL
);
GO

-- Creating table 'GameSet'
CREATE TABLE [dbo].[GameSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Date] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EmployeeGameSet'
CREATE TABLE [dbo].[EmployeeGameSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [GameId] int  NOT NULL,
    [EmployeeId] int  NOT NULL
);
GO

-- Creating table 'AnswerSet'
CREATE TABLE [dbo].[AnswerSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EmployeGameId] int  NOT NULL,
    [OptionId] int  NOT NULL,
    [Value] decimal(18,0)  NOT NULL,
    [State] bit  NOT NULL,
    [EmployeGame_Id] int  NOT NULL
);
GO

-- Creating table 'OptionSet'
CREATE TABLE [dbo].[OptionSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [QuestionId] int  NOT NULL
);
GO

-- Creating table 'QuestionSet'
CREATE TABLE [dbo].[QuestionSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Value] decimal(18,0)  NOT NULL,
    [CategoryId] int  NOT NULL
);
GO

-- Creating table 'CategorySet'
CREATE TABLE [dbo].[CategorySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'CompanySet'
ALTER TABLE [dbo].[CompanySet]
ADD CONSTRAINT [PK_CompanySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EmployeeSet'
ALTER TABLE [dbo].[EmployeeSet]
ADD CONSTRAINT [PK_EmployeeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'GameSet'
ALTER TABLE [dbo].[GameSet]
ADD CONSTRAINT [PK_GameSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EmployeeGameSet'
ALTER TABLE [dbo].[EmployeeGameSet]
ADD CONSTRAINT [PK_EmployeeGameSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AnswerSet'
ALTER TABLE [dbo].[AnswerSet]
ADD CONSTRAINT [PK_AnswerSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OptionSet'
ALTER TABLE [dbo].[OptionSet]
ADD CONSTRAINT [PK_OptionSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'QuestionSet'
ALTER TABLE [dbo].[QuestionSet]
ADD CONSTRAINT [PK_QuestionSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CategorySet'
ALTER TABLE [dbo].[CategorySet]
ADD CONSTRAINT [PK_CategorySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CompanyId] in table 'EmployeeSet'
ALTER TABLE [dbo].[EmployeeSet]
ADD CONSTRAINT [FK_CompanyEmployee]
    FOREIGN KEY ([CompanyId])
    REFERENCES [dbo].[CompanySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CompanyEmployee'
CREATE INDEX [IX_FK_CompanyEmployee]
ON [dbo].[EmployeeSet]
    ([CompanyId]);
GO

-- Creating foreign key on [GameId] in table 'EmployeeGameSet'
ALTER TABLE [dbo].[EmployeeGameSet]
ADD CONSTRAINT [FK_GameEmployeGame]
    FOREIGN KEY ([GameId])
    REFERENCES [dbo].[GameSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_GameEmployeGame'
CREATE INDEX [IX_FK_GameEmployeGame]
ON [dbo].[EmployeeGameSet]
    ([GameId]);
GO

-- Creating foreign key on [EmployeeId] in table 'EmployeeGameSet'
ALTER TABLE [dbo].[EmployeeGameSet]
ADD CONSTRAINT [FK_EmployeeEmployeGame]
    FOREIGN KEY ([EmployeeId])
    REFERENCES [dbo].[EmployeeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeEmployeGame'
CREATE INDEX [IX_FK_EmployeeEmployeGame]
ON [dbo].[EmployeeGameSet]
    ([EmployeeId]);
GO

-- Creating foreign key on [OptionId] in table 'AnswerSet'
ALTER TABLE [dbo].[AnswerSet]
ADD CONSTRAINT [FK_OptionAnswer]
    FOREIGN KEY ([OptionId])
    REFERENCES [dbo].[OptionSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OptionAnswer'
CREATE INDEX [IX_FK_OptionAnswer]
ON [dbo].[AnswerSet]
    ([OptionId]);
GO

-- Creating foreign key on [QuestionId] in table 'OptionSet'
ALTER TABLE [dbo].[OptionSet]
ADD CONSTRAINT [FK_QuestionOption]
    FOREIGN KEY ([QuestionId])
    REFERENCES [dbo].[QuestionSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_QuestionOption'
CREATE INDEX [IX_FK_QuestionOption]
ON [dbo].[OptionSet]
    ([QuestionId]);
GO

-- Creating foreign key on [EmployeGame_Id] in table 'AnswerSet'
ALTER TABLE [dbo].[AnswerSet]
ADD CONSTRAINT [FK_EmployeGameAnswer]
    FOREIGN KEY ([EmployeGame_Id])
    REFERENCES [dbo].[EmployeeGameSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeGameAnswer'
CREATE INDEX [IX_FK_EmployeGameAnswer]
ON [dbo].[AnswerSet]
    ([EmployeGame_Id]);
GO

-- Creating foreign key on [CategoryId] in table 'QuestionSet'
ALTER TABLE [dbo].[QuestionSet]
ADD CONSTRAINT [FK_CategoryQuestion]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[CategorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryQuestion'
CREATE INDEX [IX_FK_CategoryQuestion]
ON [dbo].[QuestionSet]
    ([CategoryId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------