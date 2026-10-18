USE `practise`;

CREATE TABLE `orderdata` (
  `order_id` int DEFAULT NULL,
  `created_at` text,
  `website_session_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `primary_product_id` int DEFAULT NULL,
  `items_purchased` int DEFAULT NULL,
  `price_usd` double DEFAULT NULL,
  `cogs_usd` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
