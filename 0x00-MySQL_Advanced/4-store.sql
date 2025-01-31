-- SQL script that creates a trigger.
-- The trigger decreases the quantity of an item after adding a new order.
-- Quantity in the table items can be negative.

DROP TRIGGER IF EXISTS update_items_quantity;
DELIMITER $$

CREATE TRIGGER update_items_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
    SET quantity = quantity - NEW.number
    WHERE name = NEW.item_name;
END$$

DELIMITER ;
