# pokerednuzlocke

### A Nuzlocke variant of Pokémon Red, based on the pret/pokered disassembly.

TL;DR: Check RELEASES for specific information on the different versions of this hack.
       This project is based on pret/pokered commit #5380594 from Dec 3, 2022 ('Use rgbds 0.6.1 (0.6.0 also still works)').

This hack started out predominantly as a way for me to learn about coding. I have always enjoyed Pokémon, especially the original Game Boy games, and now also enjoy watching Pokémon-related content online. I have been wanting to learn to code for quite a while and, seeing a lot of streamers performing Nuzlocke challenges but having to self-enforce the rules, I thought trying to create my own hack with hard-coded restrictions would be a motivating project. With the exception of some very basic and "self-taught" HTML knowledge, I started this hack with no previous coding experience (which may be very obvious to those evaluating my work...!), so this has been an interesting challenge.

Despite discovering early on that ROM-hackers would probably recommend that newbies start with later generations of Pokémon games, I picked Red for a few reasons:
* it is by far my favourite generation, having quickly become obsessed with it after getting a Game Boy Color and Pokémon Red at 5-years-old.
* I have a bit of a soft spot for retro tech in general, so starting with the original games appealed even more.
* knowing that assembly is apparently a less intuitive programming language to learn provoked that competitive nature in me!
As a result, finding specific learning resources has been a little tedious. I would like to thank Keith from the YouTube channel ChibiAkumas and highlight the 'Learn Multi platform Z80 Assembly Programming... With Vampires!' playlist in particular. Credit is obviously also due to the pret members for their work on the disassembly and the Pokémon community as a whole for their numerous and well-maintained forums.

To make this hack as accommodating as possible, I decided to have a 'core' version with only the basic Nuzlocke rules enforced, those being:
* once a Pokémon faints it is considered dead and cannot be revived, and
* only the first encounter in each area can be caught.
Due to the prevalence of 'optional' additional rules, the core version intentionally leaves a little bit of wiggle room on the encounter restrictions, although this does then mean that some self-enforcing of rules is necessary depending on what clauses are desired. It is my intention to have several minor variations of the core version that have different degrees of freedom hard-coded, hopefully leading to a selection of setups with minimal/no self-enforcing required.

I have actually never attempted a Nuzlocke run of any Pokémon game before, partly because I would not fully trust myself to stick to whatever rules I initially set (another reason for wanting to make a strict Nuzlocke hack), so there are likely things that I have got wrong or not considered. It is also improbable that this hack will ever be tested exhaustively, especially on my own. Therefore, bug-reports and (constructive!) criticism would be appreciated. I also plan to experiment with this hack and create a more personal variant, with my desired ruleset and some quality-of-life improvements, e.g. all 151 Pokémon being accessible. This is likely to be a continuous process, so any ideas or suggestions would be welcome too. Git and GitHub are also new to me, having originally just kept a log of experimental changes in a text document. I came across Vincent Driessen's 'A successful Git branching model' blog post during my research and decided to adopt the workflow for this project. Any tips or tricks on how to use Git or GitHub properly or more efficiently would also be appreciated.
