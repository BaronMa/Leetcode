Create table If Not Exists tree (id int, p_id int)
Truncate table tree
insert into tree (id, p_id) values ('1', 'None')
insert into tree (id, p_id) values ('2', '1')
insert into tree (id, p_id) values ('3', '1')
insert into tree (id, p_id) values ('4', '2')
insert into tree (id, p_id) values ('5', '2')

# Given a table tree, id is identifier of the tree node and p_id is its parent node's id.
# Each node in the tree can be one of three types:
#     Leaf: if the node is a leaf node.
#     Root: if the node is the root of the tree.
#     Inner: If the node is neither a leaf node nor a root node.

# Write a query to print the node id and the type of the node. Sort your output by the node id.

SELECT DISTINCT t1.id, CASE WHEN t1.p_id IS NULL THEN "Root"
                            WHEN t2.id IS NULL THEN "Leaf"
                            WHEN t2.id IS NOT NULL THEN "Inner"
                       END AS Type
FROM tree t1
LEFT JOIN tree t2 ON t1.id = t2.p_id
ORDER BY t1.id

# Use left join to join the table itself, the first table's id is connected to the second table's p_id. If the new column has
# values, means the parents node is root or inner, else the parent node is leaf.

# Runtime: 211 ms, faster than 96.84% of MySQL online submissions
