-- a stored procedure called ComputeAverageWeightedScoreForUsers 
-- that is created by a SQL script and computes and stores 
-- the average weighted score for each learner.

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
DELIMITER |

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
  UPDATE users AS U, 
    (SELECT U.id, SUM(score * weight) / SUM(weight) AS w_avg 
    FROM users AS U 
    JOIN corrections as C ON U.id=C.user_id 
    JOIN projects AS P ON C.project_id=P.id 
    GROUP BY U.id)
  AS WA
  SET U.average_score = WA.w_avg 
  WHERE U.id=WA.id;
END;
