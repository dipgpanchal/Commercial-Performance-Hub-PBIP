USE `practise`;

CREATE TABLE `fact_inventory_snapshot` (
  `load_dt` date NOT NULL,
  `store_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `stock_on_hand` bigint unsigned NOT NULL,
  `inventory_cost` decimal(10,2) NOT NULL,
  `inventory_value` decimal(10,2) NOT NULL,
  PRIMARY KEY (`load_dt`,`store_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
