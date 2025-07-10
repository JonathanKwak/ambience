# Ambience Volume Scaler
To help with environment design in my game, I've decided to add dynamic ambient volume scaling. An ambient sound (i.e, shore SFX, seagulls SFX, etc) would play near the 'shore', but would gradually scale down as the player got further away from the 'shore'.

## Features

- Dynamic scaling with player distance
- Adjustable distance threshold
- Drag-and-drop compatibility; you can simply drop any sound into the `Ambience` folder, set a few attributes, then you're done

## Setup

1. Insert code into a `LocalScript` and place in `StarterGui`
2. Create an invisible `Part` parented underneath the `LocalScript` named "ZMarker"
3. Insert desired sound effects (preferrably ambience), set attributes like "`Inverse`" and "`Volume`"

## Limitations

- Built for Roblox games only
- Only accounts for the distances in the Z axis
