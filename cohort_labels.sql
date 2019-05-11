-- Assign correct labels to data
SELECT * EXCEPT(string_field_0, int64_field_1), int64_field_1 as label
FROM `nyu-datathon.Team8.filtered_for_apache_version_hospital_prediction` main_table
LEFT JOIN `physionet-data.eicu_crd.intakeoutput` io_table
USING (patientunitstayid)
INNER JOIN `nyu-datathon.Team8.updated_review_table_filtered` review_table 
ON io_table.cellpath = review_table.string_field_0