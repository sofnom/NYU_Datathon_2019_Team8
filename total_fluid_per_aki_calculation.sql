-- Total fluid per aki calculation
select i.patientunitstayid
, sum(
  case 
  when label = 1 
  and kd.AKI_stage_7day_creat > 0
  and i.intakeoutputoffset <= kd.HighCreat7dayTime
  then cellvaluenumeric
  else 0 end) as normal_saline
, sum(
  case when label = 2 
  and kd.AKI_stage_7day_creat > 0
  and i.intakeoutputoffset <= kd.HighCreat7dayTime
  then cellvaluenumeric else 0 end
) as lactated_ringers
, max(kd.AKI_stage_7day_creat) as AKI_stage_7day_creat
from `nyu-datathon.Team8.kdigo_stages_7day` kd
left join `nyu-datathon.Team8.cohort_labels_0511` i
on kd.patientunitstayid = i.patientunitstayid
where kd.AKI_stage_7day_creat > 0
group by i.patientunitstayid