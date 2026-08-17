# Build: top-down run-and-gun shooter

You are building a complete, playable game in this directory. The deliverable is
a single file, `game.html`, that runs by being opened directly in a browser.

## Hard constraints

- ONE self-contained file: `game.html`. No external assets, no libraries, no CDN
  links, no network requests. All art drawn procedurally with Canvas 2D.
- Do NOT print the contents of `game.html` into the conversation. Write it to
  disk with your tools and describe changes in one or two sentences. Your context
  window is limited and dumping the file will exhaust it.
- After stage 1, use targeted edits. Do not rewrite the whole file to change one
  function, and do not re-read the entire file when you only need one section.
- After each stage, run `./check.sh`. It syntax-checks the JS inside the HTML.
  Fix any failure before starting the next stage.

## Build order

Work in stages. Finish and check each one before starting the next.

1. **Movement + camera.** Canvas, frame loop, the commando, WASD, mouse aim, a
   world larger than the viewport that scrolls.
2. **Shooting.** The rifle, projectiles, grunt enemies that advance and shoot,
   collision, damage, player death.
3. **Terrain + arsenal.** Cover that blocks movement and bullets, destructible
   crates, the spread gun and the flame gun.
4. **Enemy variety.** Gunners and heavies, enemies using cover, waves that
   thicken as the player advances north.
5. **Presentation.** Feel, HUD, title and death screens.

## The game

Military run-and-gun in the spirit of Metal Slug, but viewed strictly top-down —
closer to Dogs of War or Ikari Warriors. A lone commando pushing north through an
enemy-held valley. Chunky and readable: at a glance I should always be able to
tell what is a threat, what is cover, and what is a pickup.

**Controls.** WASD moves the commando, 8-directional; diagonals must not be
faster than cardinals. The mouse aims, and the gun rotates to face the cursor at
all times. Left click fires, and holding the button fires continuously at the
weapon's rate. Movement and aim are fully independent — I can run north while
firing south.

**World.** The map is much larger than the viewport and scrolls as I advance. The
camera follows the commando and stops at the world edges. The level runs north,
resistance thickens as I push up it, and it ends at a fortified position.

**Cover.** Sandbag walls, crates and burnt-out vehicles are scattered around.
They block movement for me and for enemies, and they stop bullets from both
sides. Crates are destructible and drop a weapon pickup when destroyed.

**Weapons.** Start with the rifle. The others are picked up and have limited
ammo; running dry drops back to the rifle.

- *Rifle* — infinite ammo, single accurate shot, moderate rate of fire.
- *Spread gun* — a fan of 5 pellets across roughly a 30° arc. Devastating up
  close, thins out at range.
- *Flame gun* — a short-range cone of fire. It does NOT fire discrete bullets.
  It is a continuous stream that pours out, lingers briefly in the air, and burns
  anything caught in it over time. Enemies hit by it keep burning for a moment
  after they leave the flame.

**Enemies.** Grunts advance on my position and fire in bursts once in range.
Gunners are stationary, entrenched behind cover, with a high rate of sustained
fire. Heavies are slow, armoured, and close to melee range. Enemies should use
the cover on the map rather than walking across open ground in a straight line,
and they should not pile up on top of each other.

**Feel.** This matters as much as the mechanics. Muzzle flashes, shell casings,
screen shake on explosions, bodies and scorch marks that stay on the ground,
enemies flinching and flashing white when hit, debris thrown outward. The flame
gun in particular should look genuinely dangerous.

**HUD and flow.** Health bar, current weapon with ammo count, kill counter. Title
screen, then play, then a death screen whose restart returns the game to a
completely clean state.

## Done

When all five stages pass `./check.sh`, tell me it's ready and list anything you
know is unfinished or shaky. Do not claim it works if you have not verified it.
