/*
===========================================================================================
DDL Script: Create Bronze Tables
===========================================================================================
Script Purpose:
  This script creates tables in the bronze' schema, dropping existing tables
  if they already exist.
  Run this script to re-define the DDL structure of 'bronze' Tables
==========================================================================================
*/

IF OBJECT_ID ('bronze.crm_cust_info', 'U') is not null
	drop table bronze.crm_cust_info;
	GO

create table bronze.crm_cust_info(
cst_id INT,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_material_status NVARCHAR(50),
cst_gndr NVARCHAR(50),
cst_create_date DATE
);
IF OBJECT_ID ('bronze.crm_prd_info', 'U') is not null
	drop table bronze.crm_prd_info;
create table bronze.crm_prd_info (
prd_id int,
prd_nm NVARCHAR(50),
prd_cost NVARCHAR(50),
prd_line varchar(10),
prd_start_dt NVARCHAR(50),
prd_end_dt NVARCHAR(50)
);
IF OBJECT_ID ('bronze.crm_sales_details', 'U') is not null
	drop table bronze.crm_sales_details;
create table bronze.crm_sales_details(
sls_ord_num NVARCHAR(50),
sls_prd_key NVARCHAR(50),
sls_order_dt int ,
sls_ship_dt int,
sls_due_dt int,
sls_sales int,
sls_quantity int,
sls_price NVARCHAR(50)
);
IF OBJECT_ID ('bronze.erp_CUST_AZ12', 'U') is not null
	drop table bronze.erp_CUST_AZ12;
create table bronze.erp_CUST_AZ12(
CID NVARCHAR(50),
BDATE DATE,
GEN VARCHAR(50)
);
IF OBJECT_ID ('bronze.erp_LOC_A101', 'U') is not null
	drop table bronze.erp_LOC_A101;
create table bronze.erp_LOC_A101 (
CID NVARCHAR(50),
CNTRY NVARCHAR(50)
);
IF OBJECT_ID ('bronze.erp_PX_CAT_G1V2', 'U') is not null
	drop table bronze.erp_PX_CAT_G1V2;
create table bronze.erp_PX_CAT_G1V2 (
ID NVARCHAR(20),
CAT NVARCHAR(50),
SUBCAT NVARCHAR(50),
MAINTENANCE VARCHAR(20)
)
