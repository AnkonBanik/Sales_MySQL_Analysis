-- Master View Creation

CREATE VIEW master_view AS
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        c.age,
        c.email,
        c.phone_num AS cell,
        c.join_date AS enlisted_date,
        ca.category_id,
        ca.category_name,
        p.product_id,
        p.product_name,
        p.price AS unit_price,
        o.order_id,
        o.order_date,
        o.total_amount,
        oi.item_id,
        oi.quantity,
        (oi.quantity * p.price) AS total_line_item_cost
    FROM
        practice.customers c
            JOIN
        practice.orders o ON c.customer_id = o.customer_id
            JOIN
        practice.order_items oi ON o.order_id = oi.order_id
            JOIN
        practice.products p ON oi.product_id = p.product_id
            JOIN
        practice.categories ca ON p.category_id = ca.category_id
    ORDER BY o.order_date DESC;
    
    
    -- Table View
    SELECT * FROM master_view;

