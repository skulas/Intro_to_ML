use [SafetyCenter2]

SELECT
TET.tulip_ID AS Event_ID,
st.event_name AS 'Event Name',
s.session_id AS Trip_ID,
First_Name + ' ' + Last_Name AS Driver_Name,
Unit_Id,
-- This is not the user ID, but userlastdata.Id OU.ID AS Usuario_ID,
--CASE SE.SafetyLevel
--WHEN 0 THEN 'Sababa'
--WHEN 1 THEN 'Green'
--WHEN 2 THEN 'Yellow'
--WHEN 3 THEN 'Red'
--END AS SafetyLevel,
SE.SafetyLevel AS 'Safety Level',
ROUND(CAST(MaxX/130.0 AS Float), 2) AS 'Longitudinal Acceleration (G)',
ROUND(CAST(MaxY/130.0 AS Float), 2) AS 'Lateral Acceleration (G)',
EventStartSpeed AS 'Speed (km\h)',
CONVERT(VARCHAR(20),EventStartTimeUTC, 113) AS 'Event Time (IL Time)',
ROUND(CAST(LocationMult100KLong/100000.0 AS FLOAT),5) AS Longitude,
ROUND(CAST(LocationMult100KLat/100000.0 AS FLOAT),5) AS Latitude,
DATEDIFF(S, start_time, EventStartTimeOUTime) AS 'Time from Trip Start (s)',
DATEDIFF(S, EventStartTimeOUTime, end_time) AS 'Time from Trip End (s)',
DATEDIFF(S, '2017-01-01 17:00:29.000', end_time) AS 'Time from first session (s)'
 
FROM Sessions S
INNER JOIN SessionEvents SE ON SE.SessionId = S.Session_ID
INNER JOIN SessionEventTypes ST ON ST.event_type_ID = SE.SessionEventTypeID
INNER JOIN Tulip_Event_Types TET ON TET.event_ID = ST.event_type_ID
INNER JOIN Users U ON U.ID = S.Driver_ID
INNER JOIN Organizational_unit OU ON OU.ID = S.Driver_OU

--WHERE OU.ID IN (18270,18055)
--WHERE First_Name = 'Oren'
-- WHERE Last_Name = 'Pesi'
--WHERE (EventStartTimeUTC between '2017-01-24 00:00:00.000' and '2017-01-26 23:00:00.000')
--AND (EventStartSpeed <> 0) 
--AND OU.ID IN (18270,18055)
WHERE s.session_id = 516187209		-- << TRIP ID

ORDER BY EventStartTimeUTC asc -- DESC
--ORDER BY Trip_Id asc -- DESC
--ORDER BY SE.SafetyLevel, EventStartTimeUTC ASC
--ORDER BY SE.SafetyLevel ASC
