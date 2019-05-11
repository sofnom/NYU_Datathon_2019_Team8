select
l.patientunitstayid
, MAX(CASE WHEN chartoffset >= 0 AND chartoffset < (60*24*1) THEN bicarbonate ELSE NULL END) AS bicarbonate_day1
, MAX(CASE WHEN chartoffset >= 0 AND chartoffset < (60*24*1) THEN BUN ELSE NULL END) AS BUN_day1
, MAX(CASE WHEN chartoffset >= 0 AND chartoffset < (60*24*1) THEN chloride ELSE NULL END) AS chloride_day1
, MAX(CASE WHEN chartoffset >= 0 AND chartoffset < (60*24*1) THEN creatinine ELSE NULL END) AS creatinine_day1
, MAX(CASE WHEN chartoffset >= 0 AND chartoffset < (60*24*1) THEN sodium ELSE NULL END) AS sodium_day1
, MAX(CASE WHEN chartoffset >= 0 AND chartoffset < (60*24*1) THEN potassium ELSE NULL END) AS potassium_day1

, MAX(CASE WHEN chartoffset >= (60*24*1) AND chartoffset < (60*24*2) THEN bicarbonate ELSE NULL END) AS bicarbonate_day2
, MAX(CASE WHEN chartoffset >= (60*24*1) AND chartoffset < (60*24*2) THEN BUN ELSE NULL END) AS BUN_day2
, MAX(CASE WHEN chartoffset >= (60*24*1) AND chartoffset < (60*24*2) THEN chloride ELSE NULL END) AS chloride_day2
, MAX(CASE WHEN chartoffset >= (60*24*1) AND chartoffset < (60*24*2) THEN creatinine ELSE NULL END) AS creatinine_day2
, MAX(CASE WHEN chartoffset >= (60*24*1) AND chartoffset < (60*24*2) THEN sodium ELSE NULL END) AS sodium_day2
, MAX(CASE WHEN chartoffset >= (60*24*1) AND chartoffset < (60*24*2) THEN potassium ELSE NULL END) AS potassium_day2

, MAX(CASE WHEN chartoffset >= (60*24*2) AND chartoffset < (60*24*3) THEN bicarbonate ELSE NULL END) AS bicarbonate_day3
, MAX(CASE WHEN chartoffset >= (60*24*2) AND chartoffset < (60*24*3) THEN BUN ELSE NULL END) AS BUN_day3
, MAX(CASE WHEN chartoffset >= (60*24*2) AND chartoffset < (60*24*3) THEN chloride ELSE NULL END) AS chloride_day3
, MAX(CASE WHEN chartoffset >= (60*24*2) AND chartoffset < (60*24*3) THEN creatinine ELSE NULL END) AS creatinine_day3
, MAX(CASE WHEN chartoffset >= (60*24*2) AND chartoffset < (60*24*3) THEN sodium ELSE NULL END) AS sodium_day3
, MAX(CASE WHEN chartoffset >= (60*24*2) AND chartoffset < (60*24*3) THEN potassium ELSE NULL END) AS potassium_day3

, MAX(CASE WHEN chartoffset >= (60*24*3) AND chartoffset < (60*24*4) THEN bicarbonate ELSE NULL END) AS bicarbonate_day4
, MAX(CASE WHEN chartoffset >= (60*24*3) AND chartoffset < (60*24*4) THEN BUN ELSE NULL END) AS BUN_day4
, MAX(CASE WHEN chartoffset >= (60*24*3) AND chartoffset < (60*24*4) THEN chloride ELSE NULL END) AS chloride_day4
, MAX(CASE WHEN chartoffset >= (60*24*3) AND chartoffset < (60*24*4) THEN creatinine ELSE NULL END) AS creatinine_day4
, MAX(CASE WHEN chartoffset >= (60*24*3) AND chartoffset < (60*24*4) THEN sodium ELSE NULL END) AS sodium_day4
, MAX(CASE WHEN chartoffset >= (60*24*3) AND chartoffset < (60*24*4) THEN potassium ELSE NULL END) AS potassium_day4

, MAX(CASE WHEN chartoffset >= (60*24*4) AND chartoffset < (60*24*5) THEN bicarbonate ELSE NULL END) AS bicarbonate_day5
, MAX(CASE WHEN chartoffset >= (60*24*4) AND chartoffset < (60*24*5) THEN BUN ELSE NULL END) AS BUN_day5
, MAX(CASE WHEN chartoffset >= (60*24*4) AND chartoffset < (60*24*5) THEN chloride ELSE NULL END) AS chloride_day5
, MAX(CASE WHEN chartoffset >= (60*24*4) AND chartoffset < (60*24*5) THEN creatinine ELSE NULL END) AS creatinine_day5
, MAX(CASE WHEN chartoffset >= (60*24*4) AND chartoffset < (60*24*5) THEN sodium ELSE NULL END) AS sodium_day5
, MAX(CASE WHEN chartoffset >= (60*24*4) AND chartoffset < (60*24*5) THEN potassium ELSE NULL END) AS potassium_day5

, MAX(CASE WHEN chartoffset >= (60*24*5) AND chartoffset < (60*24*6) THEN bicarbonate ELSE NULL END) AS bicarbonate_day6
, MAX(CASE WHEN chartoffset >= (60*24*5) AND chartoffset < (60*24*6) THEN BUN ELSE NULL END) AS BUN_day6
, MAX(CASE WHEN chartoffset >= (60*24*5) AND chartoffset < (60*24*6) THEN chloride ELSE NULL END) AS chloride_day6
, MAX(CASE WHEN chartoffset >= (60*24*5) AND chartoffset < (60*24*6) THEN creatinine ELSE NULL END) AS creatinine_day6
, MAX(CASE WHEN chartoffset >= (60*24*5) AND chartoffset < (60*24*6) THEN sodium ELSE NULL END) AS sodium_day6
, MAX(CASE WHEN chartoffset >= (60*24*5) AND chartoffset < (60*24*6) THEN potassium ELSE NULL END) AS potassium_day6

, MAX(CASE WHEN chartoffset >= (60*24*6) AND chartoffset < (60*24*7) THEN bicarbonate ELSE NULL END) AS bicarbonate_day7
, MAX(CASE WHEN chartoffset >= (60*24*6) AND chartoffset < (60*24*7) THEN BUN ELSE NULL END) AS BUN_day7
, MAX(CASE WHEN chartoffset >= (60*24*6) AND chartoffset < (60*24*7) THEN chloride ELSE NULL END) AS chloride_day7
, MAX(CASE WHEN chartoffset >= (60*24*6) AND chartoffset < (60*24*7) THEN creatinine ELSE NULL END) AS creatinine_day7
, MAX(CASE WHEN chartoffset >= (60*24*6) AND chartoffset < (60*24*7) THEN sodium ELSE NULL END) AS sodium_day7
, MAX(CASE WHEN chartoffset >= (60*24*6) AND chartoffset < (60*24*7) THEN potassium ELSE NULL END) AS potassium_day7

, MAX(CASE WHEN chartoffset >= (HighCreat7dayTime - 60*24) AND chartoffset < HighCreat7dayTime THEN bicarbonate ELSE NULL END) AS bicarbonate_before_aki
, MAX(CASE WHEN chartoffset >= (HighCreat7dayTime - 60*24) AND chartoffset < HighCreat7dayTime THEN BUN ELSE NULL END) AS BUN_before_aki
, MAX(CASE WHEN chartoffset >= (HighCreat7dayTime - 60*24) AND chartoffset < HighCreat7dayTime THEN chloride ELSE NULL END) AS chloride_before_aki
, MAX(CASE WHEN chartoffset >= (HighCreat7dayTime - 60*24) AND chartoffset < HighCreat7dayTime THEN creatinine ELSE NULL END) AS creatinine_before_aki
, MAX(CASE WHEN chartoffset >= (HighCreat7dayTime - 60*24) AND chartoffset < HighCreat7dayTime THEN sodium ELSE NULL END) AS sodium_before_aki
, MAX(CASE WHEN chartoffset >= (HighCreat7dayTime - 60*24) AND chartoffset < HighCreat7dayTime THEN potassium ELSE NULL END) AS potassium_before_aki

from `nyu-datathon.Team8.pivoted_lab` l
LEFT JOIN `nyu-datathon.Team8.kdigo_stages_7day` kd
on l.patientunitstayid = kd.patientunitstayid
group by l.patientunitstayid
order by l.patientunitstayid