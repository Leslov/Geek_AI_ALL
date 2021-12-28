-- В моей базе created_at и updated_at называются DateCreate и DateChange соответственно
UPDATE users SET 
DateCreate = NOW(),
DateChange = NOW();