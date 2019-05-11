SELECT *
  FROM `physionet-data.eicu_crd.patient` INNER JOIN `physionet-data.eicu_crd.apachepatientresult` 
USING (patientunitstayid);