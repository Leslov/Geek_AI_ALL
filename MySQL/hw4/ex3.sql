-- ALTER TABLE profiles ADD COLUMN IsActive BOOL NOT NULL DEFAULT TRUE;

UPDATE profiles SET IsActive = FALSE WHERE (YEAR(CURDATE()) - YEAR(Birthday)) < 18