# GMS1-Harmony
A poor man's sad attempt of bringing Harmony's collision to GMS1.
Locks right when the character collides with the ground.

Mostly copied from Harmony and pushed through beautifier.io.
Also includes character_direction() and empty character_object_collision() and check_object() scripts.
Variables were copied mostly in their entirety just because I didn't feel like cherry picking.

Some functions are exlcusive to Studio 2 and so replacements had to be made for GMS1. They share the name with their GMS2 counterparts.

collision_rectangle_list()
collision_line_list()
collision_point_list()

collision_rectangle_list is from https://pastebin.com/1V44YjKR which is an edit of https://www.gmlscripts.com/script/collision_rectangle_list
The other two were made by me applying the differences I noticed between the paste bin and original GMLscripts alternatives.

However, AFAIK, Harmony doesn't use the order function. And unordered lists differ between this code and GMS2. So this is likely what causes the game to freeze.
