/*
==========================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
==========================================================================================
Script Purpose:
  This stored procedure loads data into the 'bronze' schema from external CSV files.
  It performes the followig actions:
  - Truncates the bronze tables before loading data.
  - Uses the 'BULK INSERT' command to load data from csv Files to bronze tables.

Parameters:
  None.
This store procedures does not accept any parameters or return any values.

Usage Example:
  EXEC bronze.load_bronze;
============================================================================================
*/

create or alter procedure bronze.load_bronze AS
Begin
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME
	Begin try
	SET @batch_start_time = GETDATE();
	PRINT '>>starting batch-----';
		Print '=============================================';
		PRINT 'Loading Bronze Layer';
		Print '=============================================';

		Print'--------------------------------------------------------';
		Print 'Loading CRM Tables';
		Print'--------------------------------------------------------';

		SET @start_time = GETDATE();
		Print'>>>Truncateing Table: [bronze].[crm_cust_info]';
		truncate table [bronze].[crm_cust_info];

		Print '>>>Inserting Data Into: [bronze].[crm_cust_info]';
		BULK INSERT [bronze].[crm_cust_info]
		FROM 'C:\Users\Shaki\OneDrive\Desktop\Full_Analytics-Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with (
			firstrow = 2,
			FIELDTERMINATOR= ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT ' Load Duration: ' + CAST(Datediff(second, @start_time, @end_time) AS NVARCHAR) + ' second';
		PRINT '>>---------------';

		SET @start_time = GETDATE();
		Print'>>>Truncateing Table: [bronze].[crm_prd_info]';
		truncate table [bronze].[crm_prd_info]

		Print '>>>Inserting Data Into: [bronze].[crm_prd_info]';
		BULK INSERT [bronze].[crm_prd_info]
		FROM 'C:\Users\Shaki\OneDrive\Desktop\Full_Analytics-Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with (
			firstrow = 2,
			FIELDTERMINATOR= ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT ' Load Duration: ' + CAST(Datediff(second, @start_time, @end_time) AS NVARCHAR) + ' second';
		PRINT '>>---------------';

		SET @start_time = GETDATE();
		Print'>>>Truncateing Table: [bronze].[crm_sales_details]';
		truncate table [bronze].[crm_sales_details]

		Print '>>>Inserting Data Into: [bronze].[crm_sales_details]';
		BULK INSERT [bronze].[crm_sales_details]
		FROM 'C:\Users\Shaki\OneDrive\Desktop\Full_Analytics-Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with (
			firstrow = 2,
			FIELDTERMINATOR= ',',
			TABLOCK
		);
			SET @end_time = GETDATE();
		PRINT ' Load Duration: ' + CAST(Datediff(second, @start_time, @end_time) AS NVARCHAR) + ' second'
		PRINT '>>---------------';

		Print'--------------------------------------------------------';
		Print 'Loading ERP Tables';
		Print'--------------------------------------------------------';

		SET @start_time = GETDATE();
		Print'>>>Truncateing Table: [bronze].[erp_CUST_AZ12]';
		truncate table [bronze].[erp_CUST_AZ12]

		Print '>>>Inserting Data Into: [bronze].[erp_CUST_AZ12]';
		BULK INSERT [bronze].[erp_CUST_AZ12]
		FROM 'C:\Users\Shaki\OneDrive\Desktop\Full_Analytics-Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		with (
			firstrow = 2,
			FIELDTERMINATOR= ',',
			TABLOCK
		);
			SET @end_time = GETDATE();
		PRINT ' Load Duration: ' + CAST(Datediff(second, @start_time, @end_time) AS NVARCHAR) + ' second'
		PRINT '>>---------------';

		SET @start_time = GETDATE();
		Print'>>>Truncateing Table: [bronze].[erp_LOC_A101]';
		truncate table [bronze].[erp_LOC_A101]

		Print '>>>Inserting Data Into: [bronze].[erp_LOC_A101]';
		BULK INSERT [bronze].[erp_LOC_A101]
		FROM 'C:\Users\Shaki\OneDrive\Desktop\Full_Analytics-Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		with (
			firstrow = 2,
			FIELDTERMINATOR= ',',
			TABLOCK
		);
				SET @end_time = GETDATE();
		PRINT ' Load Duration: ' + CAST(Datediff(second, @start_time, @end_time) AS NVARCHAR) + ' second'
		PRINT '>>---------------';

		SET @start_time = GETDATE();
		Print'>>>Truncateing Table: [bronze].[erp_PX_CAT_G1V2]';
		truncate table [bronze].[erp_PX_CAT_G1V2]

		Print '>>>Inserting Data Into: [bronze].[erp_PX_CAT_G1V2]';
		BULK INSERT [bronze].[erp_PX_CAT_G1V2]
		FROM 'C:\Users\Shaki\OneDrive\Desktop\Full_Analytics-Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		with (
			firstrow = 2,
			FIELDTERMINATOR= ',',
			TABLOCK
	);
		
		SET @end_time = GETDATE();
		PRINT ' Load Duration: ' + CAST(Datediff(second, @start_time, @end_time) AS NVARCHAR) + ' second'
		PRINT '>>---------------';
		
		SET @batch_end_time = GETDATE();
		PRINT '>>Batch_Load Duration_time ' + CAST(Datediff(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' second';
	END TRY
	Begin catch
		Print '========================================================';
		Print' ERROR occured during loading bronze layer';
		Print 'ERROR message' + ERROR_MESSAGE();
		Print ' Error message' + CAST(ERROR_NUMBER() AS NVARCHAR);
		Print ' Error message' + CAST(ERROR_STATE() AS NVARCHAR);
		Print '========================================================';
	End catch
END
