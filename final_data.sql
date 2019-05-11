select co.patientunitstayid 
, co.patienthealthsystemstayid, co.uniquepid
, hospitaldischargeyear, gender age, ethnicity, apacheadmissiondx, admissionheight, hospitaldischargeoffset, hospitaldischargelocation, hospitaldischargestatus, unitadmitsource
, admissionweight, dischargeweight, unitdischargeoffset, unitdischargelocation, unitdischargestatus
, acutephysiologyscore, apachescore, apacheversion, predictedhospitalmortality, predictedhospitallos, actualhospitallos
, unabridgedhosplos
-- aki stuff
, LowCreat7day, HighCreat7day, LowCreat7dayTime, HighCreat7dayTime
, aki.AKI_stage_7day_creat
, case when aki.AKI_stage_7day_creat > 0 then 1 else 0 end as aki
-- fluids
, tf_aki.normal_saline as normal_saline_before_aki
, tf_aki.lactated_ringers as lactated_ringers_before_aki
, tf.normal_saline, tf.lactated_ringers
-- daily labs
, bicarbonate_day1, BUN_day1, chloride_day1, creatinine_day1, sodium_day1, potassium_day1
, bicarbonate_day2, BUN_day2, chloride_day2, creatinine_day2, sodium_day2, potassium_day2
, bicarbonate_day3, BUN_day3, chloride_day3, creatinine_day3, sodium_day3, potassium_day3
, bicarbonate_day4, BUN_day4, chloride_day4, creatinine_day4, sodium_day4, potassium_day4
, bicarbonate_day5, BUN_day5, chloride_day5, creatinine_day5, sodium_day5, potassium_day5
, bicarbonate_day6, BUN_day6, chloride_day6, creatinine_day6, sodium_day6, potassium_day6
, bicarbonate_day7, BUN_day7, chloride_day7, creatinine_day7, sodium_day7, potassium_day7
from `nyu-datathon.Team8.filtered_for_apache_version_hospital_prediction` co
left join `nyu-datathon.Team8.total_fluid_for_aki` tf_aki
on co.patientunitstayid = tf_aki.patientunitstayid
left join `nyu-datathon.Team8.total_fluid_input` tf
on co.patientunitstayid = tf.patientunitstayid
left join `nyu-datathon.Team8.kdigo_stages_7day` aki
on co.patientunitstayid = aki.patientunitstayid
left join `nyu-datathon.Team8.daily_labs` dl
on co.patientunitstayid = dl.patientunitstayid
where co.patientunitstayid in
( select patientunitstayid from `nyu-datathon.Team8.total_fluid_input` where normal_saline > 0 or lactated_ringers > 0)