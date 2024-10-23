-- SQL script that creates a stored procedure `AddBonus`
-- `AddBonus` adds a new correction for a student

-- Requirements: 
--- '''Procedure''' `AddBonus` takes 3 inputs (in this order):
-- user_id, a users.id value (you can assume user_id is linked to an existing users)
-- project_name, a new or already exists projects -- if no projects.name found in the table, you should create it
-- score, the score value for the correction
