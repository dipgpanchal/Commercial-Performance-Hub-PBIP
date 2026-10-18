USE `practise`;

CREATE TABLE `dim_products` (
  `product_id` bigint unsigned NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_category` varchar(50) NOT NULL,
  `product_cost` decimal(10,2) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
