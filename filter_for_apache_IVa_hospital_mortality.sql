SELECT *
  FROM `nyu-datathon.Team8.filtered_patient_apache_wardid_year` 
where (apacheversion = "IVa") and (predictedhospitalmortality > 0)