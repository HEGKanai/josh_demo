CREATE TABLE IF NOT EXISTS dog (
                                   id SERIAL PRIMARY KEY,
                                   name TEXT,
                                   description TEXT,
                                   owner TEXT
);

WITH dog_data AS (
    SELECT
        unnest(ARRAY[
                   'Max', 'Bella', 'Charlie', 'Luna', 'Rocky', 'Daisy', 'Buddy', 'Molly', 'Jack', 'Sadie',
               'Toby', 'Lola', 'Duke', 'Zoe', 'Cooper', 'Lucy', 'Bear', 'Roxy', 'Tucker', 'Bailey'
                   ]) AS name,
        unnest(ARRAY[
                   'Energetic and loves to play fetch',
               'Calm and gentle, perfect for cuddling',
               'Intelligent and easy to train',
               'Protective and loyal to the family',
               'Playful and great with children',
               'Athletic and excels in agility courses',
               'Friendly and gets along with other pets',
               'Curious and always exploring',
               'Laid-back and enjoys lazy afternoons',
               'Vocal and good at alerting to visitors',
               'Affectionate and loves attention',
               'Independent but loving',
               'Eager to please and quick learner',
               'Graceful and elegant in movement',
               'Adventurous and loves outdoor activities',
               'Patient and gentle with small animals',
               'Energetic and requires lots of exercise',
               'Intelligent and problem-solver',
               'Social butterfly, loves meeting new people',
               'Calm and well-behaved in public'
                   ]) AS description,
        unnest(ARRAY[
                   'John Smith', 'Emma Johnson', 'Michael Brown', 'Sophia Davis', 'William Wilson',
               'Olivia Taylor', 'James Anderson', 'Ava Martinez', 'Robert Thomas', 'Isabella White',
               'David Garcia', 'Mia Robinson', 'Joseph Lee', 'Charlotte Clark', 'Daniel Rodriguez',
               'Amelia Lewis', 'Christopher Walker', 'Harper Hall', 'Matthew Allen', 'Evelyn Young'
                   ]) AS owner
)
INSERT INTO dog (name, description, owner)
SELECT name, description, owner
FROM dog_data
         LIMIT 20;