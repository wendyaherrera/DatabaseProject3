USE SocialMedia;

# Business Opportunity Problem 1
# Finding the top 10 most popular communities based on their number of followers
SELECT * FROM Community ORDER BY followers DESC LIMIT 10;

#Finding the find the total reach of the communities
SELECT SUM(followers) AS 'total users in top 10 communities' from Community WHERE id IN(138,141,206,29,245,476,272,294,259,248);

#To find the ids of the top 10 most popular posts
SELECT * FROM Post ORDER BY likes DESC LIMIT 10;

#Finding the total comments in the top posts
SELECT COUNT(id) FROM Comment WHERE post_id IN(58,941,3228,1372,1855,555,1800,3466,3000,85);

#Finding the total likes of the comments in the top 10 posts
SELECT SUM(likes) FROM Comment WHERE post_id IN(58,941,3228,1372,1855,555,1800,3466,3000,85);

#Business Opportunity Problem 2
#finding the users who have the most comment likes
SELECT author_id, COUNT(id) AS 'comments created', SUM(LIKES) AS 'total likes recieved' 
FROM Comment GROUP by author_id ORDER BY SUM(LIKES) DESC LIMIT 10;

# find users who have recieved the most post likes
SELECT author_id, COUNT(id) AS 'posts created', SUM(LIKES) AS 'total likes recieved' 
FROM Post GROUP by author_id ORDER BY SUM(LIKES) DESC LIMIT 10;

# Finding the ids of the posts that recieve the most comment likes
SELECT post_id, COUNT(id) AS 'comments generated', SUM(LIKES) AS 'comment likes' 
FROM Comment GROUP BY post_id ORDER BY SUM(LIKES) DESC LIMIT 10;

# Finding the ids of the users who created the posts with the most comment likes
SELECT author_id FROM Post WHERE id IN(1872,4533,4278,2897,3833,4176,124,608,472,3905);

# Finding the tuples of the selected top 10 users
SELECT * FROM User WHERE id IN(155,993,873,946,427,916,704,424,88,647);

# Business Problem 3

# finding the posts created by unregistered users
SELECT * FROM Post t1
LEFT JOIN User t2 ON t1.author_id=t2.id 
WHERE t2.id is NULL; 

#Statement to delete these posts 
DELETE t1 FROM Post AS t1 LEFT JOIN User AS t2 ON t1.author_id=t2.id WHERE t2.id is NULL; 

#Finding the comments made by unregistered users 
SELECT * FROM Comment t1
LEFT JOIN User t2 ON t1.author_id=t2.id 
WHERE t2.id is NULL; 

#Statement to delete these comments
DELETE t1 FROM Comment AS t1 LEFT JOIN User AS t2 ON t1.author_id=t2.id WHERE t2.id is NULL; 

