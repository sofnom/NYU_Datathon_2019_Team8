-- Query to merge intakeoutput infor and the filtered patient data

SELECT * 
  FROM `nyu-datathon.Team8.filtered_for_apache_version_hospital_prediction` LEFT JOIN `physionet-data.eicu_crd.intakeoutput` 
USING (patientunitstayid); 