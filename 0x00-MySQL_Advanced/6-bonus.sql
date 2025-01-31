-- SQL script that creates a stored procedure `AddBonus`
-- `AddBonus` adds a new correction for a student

-- Requirements:
-- Procedure `AddBonus` takes 3 inputs (in this order):
-- user_id, a users.id value (you can assume user_id is linked to an existing user)
-- project_name, a new or existing project -- if no projects.name is found in the table, create it
-- score, the score value for the correction

DELIMITER $$

CREATE PROCEDURE AddBonus(
    IN user_id INTEGER,
    IN project_name VARCHAR(255),
    IN score INTEGER
)
BEGIN
    -- Check if project exists, if not, create it
    IF NOT EXISTS (SELECT 1 FROM projects WHERE name = project_name) THEN
        INSERT INTO projects (name) VALUES (project_name);
    END IF;

    -- Insert correction
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (user_id, (SELECT id FROM projects WHERE name = project_name), score);
END $$

DELIMITER ;

