USE `staging`;

CREATE TABLE `stg_inventory` (
  `store_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `stock_on_hand` int unsigned NOT NULL,
  PRIMARY KEY (`store_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
