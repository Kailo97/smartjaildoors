// © Maxim "Kailo" Telezhenko, 2015
// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>

// Include Smart Jail Doors
#include <smartjaildoors>

// Include Warden plugin API
#include <warden> // Link to plugin on AlliedMods forum https://forums.alliedmods.net/showthread.php?t=157860

// Plugin info
public Plugin myinfo =
{
	name = "Plugin sample for Smart Jail Doors",
	author = "Maxim 'Kailo' Telezhenko",
	description = "Allow to warden open jails by command.",
	version = "sample",
	url = "http://steamcommunity.com/id/kailo97/"
};

// OnPluginStart forward
public void OnPluginStart()
{
	// Reg our cmd
	RegConsoleCmd("sm_openjails", Command_OpenJails);
}

// Cmd callback
public Action Command_OpenJails(int client, int args)
{
	// Check if client is warden
	if (warden_iswarden(client))
		// Client is warden — Open Jails
		SJD_OpenDoors();
	else
		// Client isn't warden — inform him that he can't use this cmd
		ReplyToCommand(client, "You can't use this cmd. You are not warden.");
	
	return Plugin_Handled;
}