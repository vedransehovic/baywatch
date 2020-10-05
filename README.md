# README
BAYWATCH PROJECT

This is a project based on real life that company I work for has. It's a video camera gear rental company and, as part of their services, they're offering checkout bays for clients to use while they're renting the gear. 

This program helps track rental bays, which production is using them, who is there to check out for production and the idea is (although outside of the scope of this project) to have a working chat between production and agents (employees) serving them. 

Program utilizes following:
    - Rails web framework
    - Bootstrap CSS framework
    - Javascript (for active elements of front end)

Program's database consists of 4 tables and relationships are set as follows:
    - Users (has many Productions through Bays, has many Bays)
    - Bays (belongs to Productions, belongs to Users)
    - Productions (has many Users through Bays, has many Bays, has many Clients)
    - Clients (belongs to Productions)

Program utilizes nested routes and forms to streamline and speed up data entry.
Effort has been made to make the code dry through the use of partials and reusable methods. 

To use the program after downloading it, make sure to run bundle install, run migrations and then run the server. 
Admin user is: vedran
Password for all users is: password
Admins can create/edit other users.
