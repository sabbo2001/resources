USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_realestateagent','Агент по недвижимости',1)
;

INSERT INTO `jobs` (name, label) VALUES
	('realestateagent','Агент по недвижимости')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('realestateagent',0,'location','Место расположения',10,'{}','{}'),
	('realestateagent',1,'vendeur','Продавец',25,'{}','{}'),
	('realestateagent',2,'gestion','Управленец',40,'{}','{}'),
	('realestateagent',3,'boss','Директор',0,'{}','{}')
;
