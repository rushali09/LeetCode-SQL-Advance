# Write your MySQL query statement below
# A node without parent node = Root node
# A node with a parent node and a child node = Inner node
# A node with a parent node and without child node = Leaf

# Start with root node case condition and then leaf- node case condition
# As every other node will be an inner node
# How to find leaf node
# Find all id's not present in p_id column
# As p_id contains only parent nodes
# Think logically, 
    # if p_id is null then "root node"
    #if id is not present in p_id, then it is a "leaf node"
    # rest all is "Inner node"

select id, 
    case 
       when p_id is null then "Root"
       when id not in (select p_id from tree where p_id is not null) then "Leaf"
        else "Inner"
    end as type
from tree