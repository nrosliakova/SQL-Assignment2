# SQL-Assignment2

i used this kaggle dataset - https://www.kaggle.com/datasets/bhanupratapbiswas/superstore-sales?resource=download

I generated unoptimized query, refactored it by creating CTE "filtered" and adding index, improved readability and structure, used query hints (FORCE INDEX)

before optimization: 
	estimated rows = 35
	actual time = 14.9..14.9

after optimization: 
	estimated rows = 835
	actual time = 11.6..11.6
