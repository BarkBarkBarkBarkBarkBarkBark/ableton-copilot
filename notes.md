after adding the init.py to the ableton directory, mac quarentines the app as it thinks its comprimised

fix with 
```
 sudo xattr -cr '/Applications/Ableton Live 12 Trial.app'

```

move `'/Users/marco/Cursor_Folder/Cursor_Codespace/ableton-mcp/AbletonMCP_Remote_Script/__init__.py'` to `'/Applications/Ableton Live 12 Trial.app/Contents/App-Resources/MIDI Remote Scripts/AbletonMCP'`



 ```
 sudo xattr -cr '/Applications/Ableton Live 12 Trial.app'
 brew install uv     
 uvx ableton-mcp  
```

