use [SafetyCenter2]

SELECT
* 
FROM Sessions S

INNER JOIN SessionEvents SE ON SE.SessionId = S.Session_ID
INNER JOIN SessionEventTypes ST ON ST.event_type_ID = SE.SessionEventTypeID
INNER JOIN Tulip_Event_Types TET ON TET.event_ID = ST.event_type_ID
INNER JOIN Users U ON U.ID = S.Driver_ID
INNER JOIN Organizational_unit OU ON OU.ID = S.Driver_OU

--WHERE (EventStartTimeUTC between '2017-10-01 00:00:00.000' and '2017-10-10 23:00:00.000')
--AND (EventStartSpeed <> 0) 
AND OU.ID IN (18270,18055)
-- Where S.Session_ID = 594988217


ORDER BY S.session_id asc -- DESC
--ORDER BY SE.SafetyLevel, EventStartTimeUTC ASC
--ORDER BY SE.SafetyLevel ASC

