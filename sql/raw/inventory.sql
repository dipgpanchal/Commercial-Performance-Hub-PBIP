USE `raw`;

CREATE TABLE `inventory` (
  `store_id` text,
  `product_id` text,
  `stock_on_hand` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
