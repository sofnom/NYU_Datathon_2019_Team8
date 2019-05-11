--   CREATE VIEW
--     `nyu-datathon.Team8.kdigo_creat` AS
-- Extract all creatinine values FROM `{}.Team8.labevents` around patient's ICU stay
WITH
cr_48hr AS (
SELECT
cr.patientunitstayid ,
cr.creatinine,
cr.chartoffset
-- Create an index that goes from 1, 2, ..., N
-- The index represents how early in the patient's stay a creatinine value was measured
-- Consequently, when we later select index == 1, we only select the first (admission) creatinine
-- In addition, we only select the first stay for the given subject_id
,
ROW_NUMBER () OVER (PARTITION BY cr.patientunitstayid ORDER BY cr.chartoffset ) AS rn_first
-- Similarly, we can get the highest and the lowest creatinine by ordering by VALUENUM
,
ROW_NUMBER () OVER (PARTITION BY cr.patientunitstayid ORDER BY cr.chartoffset   DESC ) AS rn_highest,
ROW_NUMBER () OVER (PARTITION BY cr.patientunitstayid ORDER BY cr.chartoffset ) AS rn_lowest
FROM
`physionet-data.eicu_crd_derived.pivoted_creatinine`  as cr
-- limit to the first 48 hours (source table has data up to 7 days)
WHERE
cr.chartoffset <= 2880 )
--     DATETIME_DIFF(cr.charttime,
                     --       cr.intime,
                     --       HOUR) <= 48 )
-- ***** --
  -- Get the highest and lowest creatinine for the first 7 days of ICU admission
-- ***** --
  , cr_7day AS (
    SELECT
    cr.patientunitstayid,
    cr.creatinine ,
    cr.chartoffset 
    -- We can get the highest and the lowest creatinine by ordering by VALUENUM
    ,
    ROW_NUMBER () OVER (PARTITION BY cr.patientunitstayid ORDER BY cr.creatinine  DESC ) AS rn_highest,
    ROW_NUMBER () OVER (PARTITION BY cr.patientunitstayid ORDER BY cr.creatinine  ) AS rn_lowest
    FROM `physionet-data.eicu_crd_derived.pivoted_creatinine`   cr )

select
ie.uniquepid , ie.patienthealthsystemstayid, ie.patientunitstayid 
, cr_48hr_admit.creatinine  as AdmCreat
, cr_48hr_admit.chartoffset  as AdmCreatTime
, cr_48hr_low.creatinine as LowCreat48hr
, cr_48hr_low.chartoffset as LowCreat48hrTime
, cr_48hr_high.creatinine as HighCreat48hr
, cr_48hr_high.chartoffset as HighCreat48hrTime

, cr_7day_low.creatinine as LowCreat7day
, cr_7day_low.chartoffset as LowCreat7dayTime
, cr_7day_high.creatinine as HighCreat7day
, cr_7day_high.chartoffset as HighCreat7dayTime

FROM `physionet-data.eicu_crd_derived.icustay_detail` ie
left join cr_48hr cr_48hr_admit
on ie.patientunitstayid = cr_48hr_admit.patientunitstayid
and cr_48hr_admit.rn_first = 1
left join cr_48hr cr_48hr_high
on ie.patientunitstayid = cr_48hr_high.patientunitstayid
and cr_48hr_high.rn_highest = 1
left join cr_48hr cr_48hr_low
on ie.patientunitstayid = cr_48hr_low.patientunitstayid
and cr_48hr_low.rn_lowest = 1
left join cr_7day cr_7day_high
on ie.patientunitstayid = cr_7day_high.patientunitstayid
and cr_7day_high.rn_highest = 1
left join cr_7day cr_7day_low
on ie.patientunitstayid = cr_7day_low.patientunitstayid
and cr_7day_low.rn_lowest = 1
order by ie.patientunitstayid;