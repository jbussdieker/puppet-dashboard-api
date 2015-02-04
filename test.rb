require 'active_resource'
require 'logger'

class Node < ActiveResource::Base
  self.site = "http://localhost:3000"
  self.logger = Logger.new(STDERR)
  self.include_format_in_path = false
  self.include_root_in_json = true
end

class NodeGroup < ActiveResource::Base
  self.site = "http://localhost:3000"
  self.logger = Logger.new(STDERR)
  self.include_format_in_path = false
  self.include_root_in_json = true
end

node_group = NodeGroup.all.first
puts node_group.parameters
node_group.description = "foo"
puts node_group.to_json
if node_group.save
  puts "OK"
else
  puts "NG - Failed to save"
end

=begin
### CREATE ###
node_group = NodeGroup.new(name: "testing")
if node_group.save
  puts "OK"
else
  puts "NG - Failed to create"
end

### INDEX ###
NodeGroup.all.each do |node_group|
  puts "#{node_group.id} #{node_group.name}"
end

### UPDATE ###
node_group = NodeGroup.all.first
node_group.description = "foo"
if node_group.save
  puts "OK"
else
  puts "NG - Failed to save"
end
=end

=begin
### CREATE ####
#node = Node.create(name: "example.com")
node = Node.new(name: "example.com")
if node.save
  puts "OK"
else
  puts "NG - Failed to create"
end

### INDEX ###
Node.all.each do |node|
  puts "#{node.id} #{node.name}"
end

### UPDATE ###
node = Node.all.first
node.environment = "stage"
node.save

### DELETE ###
node = Node.all.first
node.destroy
=end
