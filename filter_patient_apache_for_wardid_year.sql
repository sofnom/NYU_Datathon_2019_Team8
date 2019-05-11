SELECT * EXCEPT (HospitalID)
FROM `nyu-datathon.Team8.join_patient_apache` INNER JOIN `nyu-datathon.Team8.ICU_id_year_filtering_criteria`  
USING (wardid, hospitaldischargeyear)