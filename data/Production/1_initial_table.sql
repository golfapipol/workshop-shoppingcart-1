
# Dump of table cart
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) DEFAULT NULL,
  `subtotal` decimal(9,2) DEFAULT NULL,
  `total` decimal(9,2) DEFAULT NULL,
  `shippingMethod` varchar(20) DEFAULT NULL,
  `shippingFee` decimal(5,2) DEFAULT NULL,
  `shippingId` int(10) DEFAULT NULL,
  `createDatetime` datetime DEFAULT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dump of table cart_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cart_product`;

CREATE TABLE `cart_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cartId` int(10) DEFAULT NULL,
  `productId` int(10) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cartId` int(10) DEFAULT NULL,
  `userId` int(10) DEFAULT NULL,
  `subtotal` decimal(9,2) DEFAULT NULL,
  `total` decimal(9,2) DEFAULT NULL,
  `shippingMethod` varchar(20) DEFAULT NULL,
  `shippingFee` decimal(5,2) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `postcode` varchar(5) DEFAULT NULL,
  `createDatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dump of table order_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_products`;

CREATE TABLE `order_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderId` int(10) DEFAULT NULL,
  `productId` int(10) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gender` enum('FEMALE','NEUTRAL','MALE') DEFAULT NULL,
  `age` enum('3_to_5','6_to_8','Baby','over8','Toddler') DEFAULT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  `availability` enum('InStock','SoldOut') DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `stockAvailability` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `gender` enum('FEMALE','NEUTRAL','MALE') DEFAULT NULL,
  `age` enum('3_to_5','6_to_8','Baby','over8','Toddler') DEFAULT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  `availability` enum('InStock','SoldOut') DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `stockAvailability` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dump of table shipping_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shipping_address`;

CREATE TABLE `shipping_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `postcode` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# Dump of table shop_profile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_profile`;

CREATE TABLE `shop_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
