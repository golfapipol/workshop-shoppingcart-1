ALTER TABLE `workshop_shoppingcart`.`cart` 
CHANGE COLUMN `subtotal` `subtotal` DECIMAL(9,2) NULL DEFAULT 0 ,
CHANGE COLUMN `total` `total` DECIMAL(9,2) NULL DEFAULT 0 ,
CHANGE COLUMN `shippingFee` `shippingFee` DECIMAL(5,2) NULL DEFAULT 0 ,
ADD COLUMN `discount` DECIMAL(9,2) NULL DEFAULT 0 AFTER `total`,
ADD COLUMN `discountCode` VARCHAR(45) NULL DEFAULT NULL AFTER `discount`;