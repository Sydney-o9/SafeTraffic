# Safe Traffic

Brought to you by @SafetyCulture.

## Introduction

You are required to produce a singleview iOS app that simulates a set of traffic lights at an
intersection. How you implement it is up to you, but you should at least meet the minimum
requirements.

## Minimum Requirements

### Layout
The traffic lights should be arranged NorthSouth and EastWest like a compass. 
And there should be a button to start/stop the animation.
It’s completely up to you how the layout is done, feel free to use code or Interface Builder,
whatever you like.

### Logic

When switching from green to red, the yellow light must be displayed for 5 seconds prior to it
switching to red. The lights will change automatically every 30 seconds.

You're not required to optimize the solution, just focus on a functional approach to requirements.
Please provide unit tests for all logic so that we can run the unit tests.

### Resources

You will be given an empty Xcode project containing 3 traffic light images. Use of the provided
images is entirely optional.

The app should use Swift 2.2 and Xcode 7.3+ to build.
If you use external libraries please just include them in the project directly.

Create a repo on bitbucket/github and provide the link as well as a description of your approach.
