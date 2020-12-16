USE hexadices;

SELECT ses.id, ses.name, ses.inviteCode, ses.settingId, s.id, s.name as settingName FROM `session` AS ses  INNER JOIN `setting` as s ON ses.settingId = s.id WHERE ses.id = :id;