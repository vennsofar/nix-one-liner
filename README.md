# nix-one-liner

## Stupid NixOS installer cause im tired of reinstalling my stuff every week

### Update 1
I'm gonna start writing short little comments just to guide me on my thought process or something

I'm really not sure how I want to go about this. My original idea was to have a single command I could run to basically unattendedly install a perfect clone of a system. I'm aware of nix-anywhere but I really just wanted to use this as both a project to both learn more about the nix language and have a tool where I could get my system up and running in the shortest possible time (because my computers really love to kill themselves for no reason in particular.)

At this point I have two main ideas for to go about this:

1. Pure Nix. Fully declarative, from disk formatting to installed programs.
2. Forgo declarative partitioning and use this repo just to hold `configuration.nix`

Ultimately I'm going to need some kind of bash script if I truly want this to be "unattended" due to how the setup works.
Going to try and mess around with disko more and see if I can figure out how to use it properly.

### Update 2
Well, I got disko to work, with full thanks to the person on the disko repo. They were a big help. Declarative disk partitioning is the way I'm going to go for now. Theres a few things I need to clear up still. Im still going to be heavily reliant on the bash script, maybe theres a better way to do this? In any case, priority number one is getting a `configuration.nix` to be fully functional, which would allow me to have the basics done. I've been taking a look at nix-community/impermanance lately, it's an interesting concept, though I have concerns about how well it would work with something like steam.

I have my eyes set on a few target filesystems at the current moment, though the impermanance README suggests either tmpfs or btrfs. I'm not confident in my knowledge of btrfs subvolumes, but tmpfs setup has too many drawbacks for me to consider viable at this moment.

Either I stick with pure ZFS or change to an impermanance setup (probably with btrfs.) Evidently theres a lot more to Nix and NixOS than I first realized, perhaps I would be able to take advantage of such features to leverage my setup better? In any case, I'm not confident in my knowledge of the Nix language yet, so for now I'll be keeping things relatively basic, though this script should allow me to change and test things much easier. 

As I'm writing this it occurs to me that splitting up my setup into an impermanance one has more drawbacks than even the impermanance README suggests. For example, I would need to have two seperate partitions for my impermanant root and my persistent storage. This is concerning because I'm not a fan of the inflexible nature of having separate partitions, that is the entire reason I started pursuing ZFS after all, and by extension NixOS, though I made to switch to the latter for separate, unrelated reasons.

In any case, I'll have to weigh the pros and cons of sticking with pure ZFS or switching to impermanance.
