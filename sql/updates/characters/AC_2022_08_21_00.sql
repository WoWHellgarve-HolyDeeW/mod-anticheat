-- run on Characters DB

DROP PROCEDURE IF EXISTS `updatemodanticheatdb`;
DELIMITER //
CREATE PROCEDURE updatemodanticheatdb()
proc:BEGIN
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'daily_players_reports' AND COLUMN_NAME = 'op_ack_hack_reports';
IF @COLEXISTS = 1 THEN LEAVE proc; END IF;
START TRANSACTION;

ALTER TABLE `daily_players_reports`
	ADD COLUMN `op_ack_hack_reports` BIGINT UNSIGNED NOT NULL DEFAULT 0 AFTER `no_fall_damage_reports`;

END //
DELIMITER ;

CALL updatemodanticheatdb();

DROP PROCEDURE IF EXISTS `updatemodanticheatdb`;
DELIMITER //
CREATE PROCEDURE updatemodanticheatdb()
proc:BEGIN
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'players_reports_status' AND COLUMN_NAME = 'op_ack_hack_reports';
IF @COLEXISTS = 1 THEN LEAVE proc; END IF;
START TRANSACTION;

ALTER TABLE `players_reports_status`
	ADD COLUMN `op_ack_hack_reports` BIGINT UNSIGNED NOT NULL DEFAULT 0 AFTER `no_fall_damage_reports`;

END //
DELIMITER ;

CALL updatemodanticheatdb();
DROP PROCEDURE IF EXISTS `updatemodanticheatdb`;
