--1. Gender Distribution
SELECT gender, COUNT(gender) FROM healthcare_data
GROUP BY gender;

--2. Distribution according to blood type and medical condition.
SELECT blood_type, medical_condition, COUNT(patient_id) FROM healthcare_data
GROUP BY blood_type, medical_condition
ORDER BY blood_type;

--3. Emergency patient count
SELECT COUNT(*) AS "Emergency patient count" FROM healthcare_data
WHERE admission_type = 'Emergency'

--4. Patient's Count of 0-30, 31-60,60+ age groups
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

--5. Number of female patient with diabetes
SELECT COUNT(*) AS "Female and diabetic patient number" FROM healthcare_data
WHERE gender='Female' AND medical_condition='Diabetes'

--6. Which medication has been used most?
SELECT medication, COUNT(patient_id) FROM healthcare_data
GROUP BY medication
ORDER BY COUNT(patient_id) desc;

--7. What is the number of patient whose length of stay between 20-30?
SELECT COUNT(*) AS "length of stay between 20-30" FROM healthcare_data
WHERE length_of_stay BETWEEN 20 AND 30;
