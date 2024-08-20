# Olympics_data_analysis_SQL_Project1
--- Showing Variables: - 
 
“secure_file_priv”:  This MySQL system variable restricts file access for certain commands like LOAD DATA INFILE, SELECT INTO OUTFILE, etc. It ensures that these commands can only be used within a specific directory.

--- Loading the Olympics Dataset externally using “Data infile ”: - 
 
•	LOAD DATA INFILE: This statement loads data from a file into a table.
•	INTO TABLE olympics: Specifies the table into which the data will be loaded.
•	 FIELDS TERMINATED BY ',': Specifies that fields in the CSV file are separated by commas.
•	 ENCLOSED BY '"': Indicates that fields in the file are enclosed by double quotes.
•	LINES TERMINATED BY '\r\n': Specifies that lines in the file end with \r\n (carriage return and line feed), which is typical for files created on Windows.
•	 IGNORE 1 ROWS: Skips the first row, often used to ignore the header row in a CSV file.
