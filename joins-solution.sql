--Get all customers and their addresses.
SELECT "customers".first_name, "customers".last_name, "addresses"
FROM "customers"
JOIN "addresses" ON "addresses".customer_id = "customers".id;

-- Get all orders and their line items (orders, quantity and product).
SELECT "orders", "line_items".quantity, "products".description FROM "line_items"
JOIN "orders" ON "orders".id = "line_items".order_id
JOIN "products" ON "products".id = "line_items".product_id;

-- Which warehouses have cheetos?
SELECT "warehouse".warehouse FROM "warehouse_product"
JOIN "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'cheetos';

--Which warehouses have diet pepsi?
SELECT "warehouse".warehouse FROM "warehouse_product"
JOIN "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'diet pepsi';

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers".first_name, COUNT("orders".address_id) FROM "customers"
JOIN "addresses" ON "addresses".customer_id = "customers".id
JOIN "orders" ON "orders".address_id = "addresses".id
GROUP BY "customers".first_name;

--6. How many customers do we have?
SELECT COUNT("customers".id) FROM "customers";

--7. How many products do we carry?
SELECT COUNT("products".id) FROM "products";

--8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product".on_hand) FROM "warehouse_product"
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'diet pepsi';
