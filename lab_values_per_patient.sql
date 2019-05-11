-- Extract all necessary lab values FROM lab table 
-- and patients of interest

select
ie.patientunitstayid, le.labname, le.labresult, le.labresulttext, le.labresultoffset
FROM `nyu-datathon.Team8.filtered_for_apache_version_hospital_prediction`  ie
left join `physionet-data.eicu_crd.lab`  le
on ie.patientunitstayid = le.patientunitstayid
and (le.labname = "creatinine" or le.labname = "sodium" or le.labname = "BUN" or le.labname = "potassium"
     or le.labname = "chloride" or le.labname = "bicarbonate")
and le.labresulttext is not null 