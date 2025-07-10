#!/bin/bash

# Use zenity to display a file selection dialog.
# --file-filter will only show files ending in .txt or .html.
# Stderr is redirected to /dev/null to hide potential GTK warnings.
SELECTED_FILE=$(zenity --file-selection --title="Select a Text or HTML File" \
    --file-filter="Text and HTML files | *.txt *.html" \
    --file-filter="All files | *" 2>/dev/null)

# Check if the selection is a valid file and if the copy command succeeds.
if [ -f "$SELECTED_FILE" ] && wl-copy < "$SELECTED_FILE"; then
    # If successful, show a pop-up that disappears after 2 seconds.
    zenity --info --text="File content successfully copied." --title="Success" --timeout=2 2>/dev/null
else
    # If it fails, show an error pop-up that also disappears after 2 seconds.
    zenity --info --text="File copy canceled." --title="Canceled" --timeout=2 2>/dev/null
fi

exit 0