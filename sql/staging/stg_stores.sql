USE `staging`;

CREATE TABLE `stg_stores` (
  `store_id` bigint unsigned NOT NULL,
  `store_name` varchar(100) NOT NULL,
  `store_city` varchar(50) NOT NULL,
  `store_location` varchar(50) NOT NULL,
  `store_open_date` date NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
