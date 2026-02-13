# DD1338 Week 18

## Artificial Life

Complex behavior doesn't always need complex brains. Sometimes, it just needs simple rules.

This task, we are simulating flock behavior, hundres or thousands of individual boids that move like birds and fish.

## Prepare for your assignment

1) Create a repository named `<KTH_ID>-boid`.
2) Get started!

## Assignment

The basic setup is quite simple, and nothing new is introduced. It's important to keep the complexity below O(n^2). The minimal requirements are:

- Implement a Boids flocking simulation in 3D. (at least 100 boids)
- Make it stay realistic for about a minute.
  - Separation
  - Alignment
  - Cohesion
- Not a full 360° area of influence. Varying or static is fine, but max 320°.
- To check collisions, use a fixed grid.

The fun part comes with the optional addons:

- Optimize the neighbor detection, some useful datastructures / techniques:
  - Quad/octree
  - Spacial hashing
  - BVH
- Add more interactions
  - Predators
  - Environment
  - Lifecycle
  - Evolution
- Can you make it multithreaded?
- How about running on the GPU?
- How many boids can you simulate?
