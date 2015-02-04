# Puppet Dashboard API

## Usage

### Nodes

List all nodes

`````ruby
@nodes = Node.all
`````

Find specific node
`````ruby
@node = Node.find("example.com")
`````
Delete a node
`````ruby
@node = Node.find("example.com")
@node.destroy
`````
Update a node
`````ruby
@node = Node.find("example.com")
@node.description = "Replacement server"
@node.save
`````
### Node Groups

List all node groups
`````ruby
@node_groups = NodeGroup.all
`````
Find specific node group
`````ruby
@node_group = NodeGroup.find("cluster1")
`````
Delete a node
`````ruby
@node_group = NodeGroup.find("cluster1")
@node_group.destroy
`````
Access group parameters
`````ruby
@node_group = NodeGroup.find("cluster1")
@node_group.parameters["cluster_size"]
`````
### Node Classes

List all node classes
`````ruby
@node_classes = NodeClass.all
`````
