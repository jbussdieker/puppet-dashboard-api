# Puppet Dashboard API

## Usage

### Nodes

List all nodes

    @nodes = Node.all

Find specific node

    @node = Node.find("example.com")

Delete a node

    @node = Node.find("example.com")
    @node.destroy

Update a node

    @node = Node.find("example.com")
    @node.description = "Replacement server"
    @node.save

### Node Groups

List all node groups

    @node_groups = NodeGroup.all

Find specific node group

    @node_group = NodeGroup.find("cluster1")

Delete a node

    @node_group = NodeGroup.find("cluster1")
    @node_group.destroy

Access group parameters

    @node_group = NodeGroup.find("cluster1")
    @node_group.parameters["cluster_size"]

### Node Classes

List all node classes

    @node_classes = NodeClass.all
