CREATE TABLE DimCustomer(
	CustomerId INT NOT NULL,
	CustomerName VARCHAR(50) NOT NULL,
	Age INT NOT NULL,
	Gender VARCHAR(50) NOT NULL,
	City VARCHAR(50) NOT NULL,
	NoHp VARCHAR(50) NOT NULL,
	CONSTRAINT PK_DimCustomer PRIMARY KEY (CustomerId)
)

CREATE TABLE DimProduct(
	ProductId INT NOT NULL,
	ProductName VARCHAR(255) NOT NULL,
	ProductCategory VARCHAR(255) NOT NULL,
	ProductUnitPrice INT NULL,
	CONSTRAINT PK_DimProduct PRIMARY KEY (ProductId)
)

CREATE TABLE DimStatusOrder(
	StatusId INT NOT NULL,
	StatusOrder VARCHAR(50) NOT NULL,
	StatusOrderDesc VARCHAR(50) NOT NULL,
	CONSTRAINT PK_DimStatusOrder PRIMARY KEY (StatusId)
)

CREATE TABLE FactSalesOrder(
	OrderId INT NOT NULL,
	CustomerId INT NOT NULL,
	ProductId INT NOT NULL,
	Quantity INT NOT NULL,
	Amount INT NOT NULL,
	StatusId INT NOT NULL,
	OrderDate DATE NOT NULL,
	CONSTRAINT PK_FactSalesOrder PRIMARY KEY (OrderId),
	CONSTRAINT FK_DimCustomer FOREIGN KEY (CustomerId) REFERENCES DimCustomer (CustomerId),
	CONSTRAINT FK_DimProduct FOREIGN KEY (ProductId) REFERENCES DimProduct (ProductId),
	CONSTRAINT FK_DimStatusOrder FOREIGN KEY (StatusId) REFERENCES DimStatusOrder (StatusId)
);