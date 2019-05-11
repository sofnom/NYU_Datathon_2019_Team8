--Total fluid input query

select i.patientunitstayid
, sum(case when label = 1 then cellvaluenumeric else 0 end) as normal_saline
, sum(case when label = 2 then cellvaluenumeric else 0 end) as lactated_ringers
from `nyu-datathon.Team8.cohort_labels_0511` i
group by i.patientunitstayid