
# Healthcare Data Analysis w/SQL

## Table of Contents

- Problem Statement
- Data Source
- Tools
- Data Analyzing

## Problem Statement

After cleaning and preprocessing the data, the below questions were queried.

```
1. What's the gender distribution?
2. Distribution according to blood type and medical condition.
3. Emergency patient count
4. Patient's Count of 0-30, 31-60,60+ age groups
5. Number of female patient with diabetes
6. Which medication has been used most?
7. What is the number of patient whose length of stay between 20-30?
```

## Data Source

**Explanation of the data table**

- **Patient_Id**  **:** Unique id for all patient
- **Patient_Name :** Patient Name
- **Age:** Patient Age
- **Gender:** Patient Gender
- **Blood_Type:** Patient Blood Type
- **Medical_Condition:** Patient Medical Condition
- **Doctor_Id:** Doctor ID
- **Doctor_Name:** Doctor Name
- **Hospital_Id:** Hospital ID
- **Hospital_Name:** Hospital Name
- **Insurance_Provider_Id:** Insurance Provider Company ID
- **Insurance_Provider_Name:** Insurance Provider Company Name
- **Billing_Amount:** Billing
- **Room_Number:** Patient’s Room Number
- **Admission_Type:** Patient Admission Type ****
- **Date_of_Admission:** Date of Admission
- **Discharge_Date:** Patient ****Discharge Date
- **Medication:** Type of Medication
- **Test_Results:** Test Results
- **Length_Of_Stay:** Patient Length of Stay

## **Tools**

PostgreSQL

#### Functions Used in PostgreSQL

- Create Table
- Select
- Case Statement
- Group By
- Order By
- Where
- Between
- Count
- As

## Data Analyzing

**Step 1:** I created a database and tables in the pgAdmin to import CSV files. Creating Table query was added into the file.

**Step 2:** I wrote proper queries to answer below questions. You can reach all queries within the repo.

```
1. What's the gender distribution?

SELECT gender, COUNT(gender) FROM healthcare_data
GROUP BY gender;

2. Distribution according to blood type and medical condition.

SELECT blood_type, medical_condition, COUNT(patient_id) FROM healthcare_data
GROUP BY blood_type, medical_condition
ORDER BY blood_type;

3. Emergency patient count

SELECT COUNT(*) AS "Emergency patient count" FROM healthcare_data
WHERE admission_type = 'Emergency'

4. Patient's Count of 0-30, 31-60,60+ age groups.

SELECT 
	CASE
		WHEN age BETWEEN 0 AND 30 THEN '0-30'
		WHEN age BETWEEN 31 AND 60 THEN '31-60'
		ELSE '60+'
	END AS age_groups,
	COUNT(*) AS patient_count
FROM healthcare_data
GROUP BY age_groups
ORDER BY age_groups;

5. Number of female patient with diabetes

SELECT COUNT(*) AS "Female and diabetic patient number" FROM healthcare_data
WHERE gender='Female' AND medical_condition='Diabetes'

6. Which medication has been used most?

SELECT medication, COUNT(patient_id) FROM healthcare_data
GROUP BY medication
ORDER BY COUNT(patient_id) desc;

7. What is the number of patient whose length of stay between 20-30?

SELECT COUNT(*) AS "length of stay between 20-30" FROM healthcare_data
WHERE length_of_stay BETWEEN 20 AND 30;
```

