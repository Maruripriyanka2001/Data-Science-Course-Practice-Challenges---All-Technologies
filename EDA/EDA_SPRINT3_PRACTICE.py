#TASK1:Display basic information about dataset which includes columns names and number of rows and number of columns and data type of columns and also display count of missing value in each column
import pandas as pd
df=pd.read_csv(r"C:\Users\marur\Downloads\DS1_C5_S3_Sales_Data_Practice.csv")
print(df.info())
print(df.isnull().sum())

#TASK2Separate the columns into categorical and numerical data types and display them.
categorical_columns = df.select_dtypes(include=['object']).columns
numerical_columns = df.select_dtypes(include=['int64', 'float64']).columns
print("Categorical Columns:")
print(categorical_columns)
print("\nNumerical Columns:")
print(numerical_columns)

#Conduct descriptive analysis of numerical columns:
#PRICEEACH, SALES, and MSRP
#Goal: Determine the unique values present in each column, their respective modes, and other relevant statistics.
print(df['PRICEEACH'].unique())
print(df['SALES'].unique())
print(df['MSRP'].unique())
print(df['PRICEEACH'].mode())
print(df['SALES'].mode())
print(df['MSRP'].mode())
print(df['PRICEEACH'].describe())
print(df['SALES'].describe())
print(df['MSRP'].describe())

#Perform descriptive analysis of categorical columns:PRODUCTLINE, CUSTOMERNAME, and COUNTRY
#Goal: Identify the unique values present in each column, their respective modes, and other relevant statistics.
print(df['PRODUCTLINE'].unique())
print(df['CUSTOMERNAME'].unique())
print(df['COUNTRY'].unique())
print(df['PRODUCTLINE'].mode())
print(df['CUSTOMERNAME'].mode())
print(df['COUNTRY'].mode())
print(df['PRODUCTLINE'].describe())
print(df['CUSTOMERNAME'].describe())
print(df['COUNTRY'].describe())

#Perform descriptive analysis of the numerical columns PRICEEACH, SALES,MSRP by using the following:
#Bar chart, Pie chart
#Measures of central tendency (mean, median)
#Standard deviation of the column
#Skewnness of the column
import matplotlib.pyplot as plt
import numpy as np
# Bar chart
plt.figure(figsize=(10, 6))
plt.bar(df['PRICEEACH'], df['SALES'])
plt.xlabel('PRICEEACH')
plt.ylabel('SALES')
plt.title('Bar Chart: PRICEEACH vs SALES')
plt.show()
# Pie chart
plt.figure(figsize=(8, 8))
plt.pie(df['MSRP'], labels=df['PRODUCTLINE'], autopct='%1.1f%%', startangle=140)
plt.title('Pie Chart: MSRP Distribution')

#Measures of central tendency (mean, median)
mean_priceeach = df['PRICEEACH'].mean()
median_priceeach = df['PRICEEACH'].median()
mean_sales = df['SALES'].mean()
median_sales = df['SALES'].median()
mean_msrp = df['MSRP'].mean()
median_msrp = df['MSRP'].median()
print("Mean PRICEEACH:", mean_priceeach)
print("Median PRICEEACH:", median_priceeach)
print("Mean SALES:", mean_sales)
print("Median SALES:", median_sales)
print("Mean MSRP:", mean_msrp)
print("Median MSRP:", median_msrp)
#Standard deviation of the column
std_priceeach = df['PRICEEACH'].std()
std_sales = df['SALES'].std()
std_msrp = df['MSRP'].std()
print("Standard Deviation PRICEEACH:", std_priceeach)
print("Standard Deviation SALES:", std_sales)
print("Standard Deviation MSRP:", std_msrp)

#Skewnness of the column
skew_priceeach = df['PRICEEACH'].skew()
skew_sales = df['SALES'].skew()
skew_msrp = df['MSRP'].skew()
print("Skewness PRICEEACH:", skew_priceeach)
print("Skewness SALES:", skew_sales)
print("Skewness MSRP:", skew_msrp)

#TASK4
#Perform descriptive analysis of the categorical columns PRODUCTLINE, CUSTOMERNAME, and COUNTRY by using the following:
#Bar chart, Pie chart
#Measures of central tendency (mode)
#Standard deviation of the column
#Skewnness of the column
# Bar chart
plt.figure(figsize=(10, 6))
plt.bar(df['PRODUCTLINE'], df['COUNTRY'])
plt.xlabel('PRODUCTLINE')
plt.ylabel('COUNTRY')
plt.title('Bar Chart: PRODUCTLINE vs COUNTRY')

#Pie chart
import matplotlib.pyplot as plt

# Group by 'PRODUCTLINE' and count the number of customers in each group
data = df.groupby('PRODUCTLINE')['CUSTOMERNAME'].count()

# Plot the pie chart
plt.pie(data, labels=data.index, autopct='%1.1f%%')
plt.title('Distribution of Customers by Product Line')
plt.show()

#Measures of central tendency (mode)
mode_productline = df['PRODUCTLINE'].mode()[0]
mode_customername = df['CUSTOMERNAME'].mode()[0]
mode_country = df['COUNTRY'].mode()[0]
print("Mode PRODUCTLINE:", mode_productline)
print("Mode CUSTOMERNAME:", mode_customername)
print("Mode COUNTRY:", mode_country)
#Skewness of column
skew_productline = df['PRODUCTLINE'].value_counts().skew()
skew_customername = df['CUSTOMERNAME'].value_counts().skew()
skew_country = df['COUNTRY'].value_counts().skew()
print("Skewness PRODUCTLINE:", skew_productline)
print("Skewness CUSTOMERNAME:", skew_customername)
print("Skewness COUNTRY:", skew_country)


#Standard deviation of the column
import pandas as pd
import matplotlib.pyplot as plt

# Convert categorical columns to numeric codes
df['ProductLine_Codes'] = pd.Categorical(df['PRODUCTLINE']).codes
df['CustomerName_Codes'] = pd.Categorical(df['CUSTOMERNAME']).codes
df['Country_Codes'] = pd.Categorical(df['COUNTRY']).codes

# Print the numeric codes for reference
print("Product Line Codes:\n", df[['PRODUCTLINE', 'ProductLine_Codes']])
print("\nCustomer Name Codes:\n", df[['CUSTOMERNAME', 'CustomerName_Codes']])
print("\nCountry Codes:\n", df[['COUNTRY', 'Country_Codes']])

# Calculate and print the standard deviation for each column
std_productline = df['ProductLine_Codes'].std()
std_customername = df['CustomerName_Codes'].std()
std_country = df['Country_Codes'].std()

print(f"\nStandard Deviation of ProductLine Codes: {std_productline}")
print(f"Standard Deviation of CustomerName Codes: {std_customername}")
print(f"Standard Deviation of Country Codes: {std_country}")








