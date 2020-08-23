#pragma semicolon 1

#include <sourcemod>
#include <tf2>

#define PLUGIN_VERSION "0.1"

public Plugin:myinfo = {
  name    = "Tools to deal with PropHunt retards",
  author  = "Yarr! goosmurf (smurfy@mooh.org)",
  description  = "Strip any chat with propmenu mentioned",
  version  = PLUGIN_VERSION,
  url      = ""
}

public OnPluginStart() {
  AddCommandListener(Command_Say, "say");

  LogMessage("Loaded");
}

public Action:Command_Say(client, const String:command[], argc) {
  decl String:message[192];

  if (!client || !GetCmdArgString(message, sizeof(message))) {
    return Plugin_Continue;
  }

  StripQuotes(message);
  TrimString(message);

  if(StrEqual(message, "!propmenu", false) ||
     StrEqual(message, "propmenu", false)) {
    PrintToChat(client, "\x04[SM] \x01!propmenu is disabled on this server");
    return Plugin_Handled;
  }

  return Plugin_Continue;
}
