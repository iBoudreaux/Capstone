select * from Users;
select * from Lessons;

#Truncate wipes all data and resets auto count to 1 for ID
truncate table Users;

truncate table Lessons;

#creates the foreign key on the user table
ALTER TABLE Lessons
ADD FOREIGN KEY (userIDString) REFERENCES Users(userID);

#Dropping foreign Key so we can truncate user table
ALTER TABLE Lessons
DROP FOREIGN KEY lessons_ibfk_1;

#Checks lesson table info
show create table Lessons;