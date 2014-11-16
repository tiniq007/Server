ALTER TABLE `merc_stats`  ADD COLUMN `special_abilities` TEXT NOT NULL DEFAULT '' AFTER `specialattks`;
ALTER TABLE `merc_stats` MODIFY COLUMN `special_abilities`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL;
 
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "1,1^") WHERE specialattks LIKE BINARY '%S%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "2,1^") WHERE specialattks LIKE BINARY '%E%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "3,1^") WHERE specialattks LIKE BINARY '%R%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "4,1^") WHERE specialattks LIKE BINARY '%r%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "5,1^") WHERE specialattks LIKE BINARY '%F%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "6,1^") WHERE specialattks LIKE BINARY '%T%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "7,1^") WHERE specialattks LIKE BINARY '%Q%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "8,1^") WHERE specialattks LIKE BINARY '%L%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "9,1^") WHERE specialattks LIKE BINARY '%b%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "10,1^") WHERE specialattks LIKE BINARY '%m%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "11,1^") WHERE specialattks LIKE BINARY '%Y%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "12,1^") WHERE specialattks LIKE BINARY '%U%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "13,1^") WHERE specialattks LIKE BINARY '%M%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "14,1^") WHERE specialattks LIKE BINARY '%C%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "15,1^") WHERE specialattks LIKE BINARY '%N%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "16,1^") WHERE specialattks LIKE BINARY '%I%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "17,1^") WHERE specialattks LIKE BINARY '%D%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "18,1^") WHERE specialattks LIKE BINARY '%K%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "19,1^") WHERE specialattks LIKE BINARY '%A%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "20,1^") WHERE specialattks LIKE BINARY '%B%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "21,1^") WHERE specialattks LIKE BINARY '%f%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "22,1^") WHERE specialattks LIKE BINARY '%O%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "23,1^") WHERE specialattks LIKE BINARY '%W%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "24,1^") WHERE specialattks LIKE BINARY '%H%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "25,1^") WHERE specialattks LIKE BINARY '%G%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "26,1^") WHERE specialattks LIKE BINARY '%g%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "27,1^") WHERE specialattks LIKE BINARY '%d%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "28,1^") WHERE specialattks LIKE BINARY '%i%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "29,1^") WHERE specialattks LIKE BINARY '%t%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "30,1^") WHERE specialattks LIKE BINARY '%n%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "31,1^") WHERE specialattks LIKE BINARY '%p%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "32,1^") WHERE specialattks LIKE BINARY '%J%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "33,1^") WHERE specialattks LIKE BINARY '%j%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "34,1^") WHERE specialattks LIKE BINARY '%o%';
UPDATE merc_stats SET special_abilities = CONCAT(special_abilities, "35,1^") WHERE specialattks LIKE BINARY '%Z%';
UPDATE merc_stats SET special_abilities = TRIM(TRAILING '^' FROM special_abilities);
 
ALTER TABLE `merc_stats`  DROP COLUMN `specialattks`;