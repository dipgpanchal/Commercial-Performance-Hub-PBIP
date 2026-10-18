USE `raw`;

CREATE TABLE `stores` (
  `store_id` text,
  `store_name` text,
  `store_city` text,
  `store_location` text,
  `store_open_date` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
