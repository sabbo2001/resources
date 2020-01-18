USE `essentialmode`;

ALTER TABLE `owned_vehicles` ADD `security` int(1) NOT NULL DEFAULT '0' COMMENT 'Состояние системы охранной сигнализации' AFTER `owner`;

CREATE TABLE `pawnshop_vehicles` (
	`owner` varchar(30) DEFAULT NULL,
	`security` int(1) NOT NULL DEFAULT '0' COMMENT 'Alarm system state',
	`plate` varchar(12) NOT NULL,
	`vehicle` longtext,
	`price` int(15) NOT NULL,
	`expiration` int(15) NOT NULL,

	PRIMARY KEY (`plate`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `items` (name, label, `weight`) VALUES
	('hammerwirecutter', 'Молоток и кусачки', 1),
	('unlockingtool', 'Инструменты для взлома (незаконно)', 1),
	('jammer', 'Подавитель сигнала (незаконно)', 1),
	('alarminterface', "Охранная система (сигнализация)", 1),
	('alarm1', 'Базовая сигнализация', 1),
	('alarm2', 'Система сигнализации (подключения к центральному)', 1),
	('alarm3', 'Высокотехнологичная сигнализация с GPS', 1)
;
