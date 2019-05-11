-- Query to calculate creatinine baseline level
with c as 
(
  select 
  cr.patientunitstayid
  , cr.chartoffset as chartoffset_baseline
  , cr.creatinine as creatinine_baseline
  , cr2.chartoffset as chartoffset
  , cr2.creatinine as creatinine
  , ROW_NUMBER() OVER (PARTITION BY cr.patientunitstayid ORDER BY cr2.creatinine DESC) as rn
  from `physionet-data.eicu_crd_derived.pivoted_creatinine` cr
  left join `physionet-data.eicu_crd_derived.pivoted_creatinine` cr2
  on cr.patientunitstayid = cr2.patientunitstayid
  and cr2.chartoffset >= cr.chartoffset
  and cr2.chartoffset < (cr.chartoffset + (60*24*7))
)
select c.patientunitstayid
, c.chartoffset_baseline
, c.creatinine_baseline
, c.chartoffset
, c.creatinine
from c
-- keep only the highest creatinine in the following 7 days
WHERE c.rn = 1
order by c.patientunitstayid;