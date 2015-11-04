Glove 2D, now called Bank Boss
===================

![Screenshot](http://puu.sh/iECiV/224badf5a2.png)


Abandonned projet for the french Bank LCL


##Disclamer
This game was built fast, some of the features are "more engine based" than game based, it means they be easily exported to another Love 2D project, some others, like the background system, or the Graph system are thug-style-coded, i mean it was just like "ok it works, don't touch it anymore, let's stop breaking things".

Translation is [comming *soon*](https://developer.valvesoftware.com/wiki/Valve_Time)



----------


Windows
-------------

Download it and drag the folder Glove2D over love.exe

> **Note:**

> - Save folder is appdata/roaming/Glove2D (or just LOVE if something fucked up)
> - You need a x64 system and a decent computer, administrator rights are not required


Linux and OS X
-------------
You have to download the Love software on the love 2d website.

Then drag Glove-2D/Glove2D on the binary
----------


### Todo :

*Optimize the graph system, it recalc everything even is we don't touch it (Zoom and pos).
*Finish the game ? Erh eheh



##Main engine features

*Isometric static level

*ALL resolutions AND Format compatible, with autoresizing , check it out, you'll like it.

*Event system : createEvent(date, func) with ingame time (The RP Time, or call it however you want).

*Time system (Paused if in main menu) (The Love Frame system will be paused and another love frame instance is going to be ran in the main menu)

*Menus system with popups (See video) (Some menus are powered by Love frames)

*Graph system, see the midle thing on the blackboard

*Error system reporting to master server (unfinished)

*Save system (Save the given vars in save.lua), unbfuscated for testing purposes.

*Timer libs (Gmod-like)

*Hook system (Gmod-like)

* Soon : Threaded resource lib loading.


----------



Used software
----------
*Löve 2D

*Love Frames (Modded to have more features)

*Caps Admin's LuaFFI code (even if not used, we were about to use it for testing things)

*JSON4Lua (at the start for the save files, and then only for the webapi shit)

*Some libs from Garry's mod, and others build ourself se we can use familiars functions. (Hooks, string, table ...)



### Rights
----------
You're allowed to edit it for personal use.

You're allowed to fork the project on github and do any modification only if you don't edit/remove this readme file.

You're not allowed to make money using this software/You're not allowed to SELL this software.

If you're working for a french bank/or is linked in anyway with a bank, you're not allowed to use this software.

You're not allowed to distribute this software even modded.

Anything not explicitly allowed is forbidden.



----------


a project by 

###Fabien Sacrepeigne (Screamotion) and Pierre Fichepoil (ExtReM Lapin)
###Art by Président Xerak
