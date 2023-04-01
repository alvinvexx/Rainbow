import { Players } from "@rbxts/services";

function setUp(player: Player) {
	print(player.Name + " has requested setup 8=D");
	player.CharacterAdded.Connect((Character) => {
		Character.WaitForChild("Body Colors").Destroy();
		Character.WaitForChild("Shirt").Destroy();
		Character.WaitForChild("Pants").Destroy();
		const Children = Character.GetChildren();
		for (const part of Children) {
			if (classIs(part, "MeshPart")) {
				coroutine.wrap(() => {
					// eslint-disable-next-line roblox-ts/lua-truthiness
					while (task.wait(0.01)) {
						part.BrickColor = BrickColor.random();
					}
				})();
			}
		}
	});
}

Players.PlayerAdded.Connect(setUp);

for (const player of Players.GetPlayers()) {
	setUp(player);
}
