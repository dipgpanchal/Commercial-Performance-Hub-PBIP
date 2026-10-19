USE `staging`;

CREATE TABLE `stg_sales` (
  `sale_id` bigint unsigned NOT NULL,
  `sale_date` date DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `units` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
