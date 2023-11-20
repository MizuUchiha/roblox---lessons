-- Create a new part in the workspace
local newPart = Instance.new("Part")
newPart.Parent = workspace
newPart.Name = "MyNewPart"

-- Set the size, position, and color of the part
newPart.Size = Vector3.new(5, 1, 5)
newPart.Position = Vector3.new(0, 10, 0)
newPart.BrickColor = BrickColor.new("Bright green")

-- Print a message to the output
print("New part created and modified")
