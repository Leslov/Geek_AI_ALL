-- В моей базе created_at и updated_at называются DateCreate и DateChange соответственно
ALTER TABLE users RENAME COLUMN DateCreate TO DateCreateOldVARCHAR;
ALTER TABLE users ADD COLUMN DateCreate DATETIME DEFAULT NOW();
UPDATE users SET DateCreate = STR_TO_DATE(DateCreateOldVARCHAR, '%d.%m.%Y %H:%i');
ALTER TABLE users DROP COLUMN DateCreateOldVARCHAR;