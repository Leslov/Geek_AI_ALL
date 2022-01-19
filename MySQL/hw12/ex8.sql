-- Хранимая процедура / функция / триггер (на выбор, 1 шт.);


DELIMITER //
CREATE TRIGGER t_review_insert BEFORE INSERT ON review
FOR EACH ROW
BEGIN
	DECLARE error_msg VARCHAR(255);
	IF NEW.sender_name IS NULL OR NEW.sender_name = '' THEN
		 set error_msg = 'sender_name cannot be Null or Empty';
	ELSEIF NEW.text IS NULL OR NEW.text = '' THEN
		 set error_msg = 'text cannot be Null or Empty';
	END IF;
	IF error_msg <> '' THEN
		signal sqlstate '45000' set message_text = error_msg;
	END IF;
END//

CREATE TRIGGER t_review_update BEFORE UPDATE ON review
FOR EACH ROW
BEGIN
	DECLARE error_msg VARCHAR(255);
	IF NEW.sender_name IS NULL OR NEW.sender_name = '' THEN
		 set error_msg = 'sender_name cannot be Null or Empty';
	ELSEIF NEW.text IS NULL OR NEW.text = '' THEN
		 set error_msg = 'text cannot be Null or Empty';
	END IF;
	IF error_msg <> '' THEN
		signal sqlstate '45000' set message_text = error_msg;
	END IF;
END//
DELIMITER ;
