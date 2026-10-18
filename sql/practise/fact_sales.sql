USE `practise`;

CREATE TABLE `fact_sales` (
  `sale_id` bigint unsigned NOT NULL,
  `sale_date` date NOT NULL,
  `store_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `units` bigint unsigned NOT NULL,
  `revenue` decimal(18,4) NOT NULL,
  `cost` decimal(18,4) NOT NULL,
  `profit` decimal(18,4) NOT NULL,
  `unit_price` decimal(12,4) NOT NULL,
  `unit_cost` decimal(12,4) NOT NULL,
  `unit_profit` decimal(12,4) NOT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `fk_fact_sales_store` (`store_id`),
  KEY `fk_fact_sales_product` (`product_id`),
  CONSTRAINT `fk_fact_sales_product` FOREIGN KEY (`product_id`) REFERENCES `dim_products` (`product_id`),
  CONSTRAINT `fk_fact_sales_store` FOREIGN KEY (`store_id`) REFERENCES `dim_stores` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
