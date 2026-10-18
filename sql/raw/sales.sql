USE `raw`;

CREATE TABLE `sales` (
  `sale_id` text,
  `sale_date` text,
  `store_id` text,
  `product_id` text,
  `units` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
