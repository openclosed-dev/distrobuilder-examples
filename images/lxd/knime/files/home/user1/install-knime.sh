#!/bin/bash

mkdir -p ~/local
tar xzf ~/knime_5.2.5.linux.gtk.x86_64.tar.gz -C ~/local
mv ~/local/knime_5.2.5 ~/local/knime
rm ~/knime_5.2.5.linux.gtk.x86_64.tar.gz

# Creates the default workspace
mkdir ~/knime-workspace

mkdir -p ~/local/knime/configuration/.settings

cat <<EOT > ~/local/knime/configuration/.settings/org.eclipse.ui.ide.prefs
eclipse.preferences.version=1
MAX_RECENT_WORKSPACES=10
RECENT_WORKSPACES=/home/user1/knime-workspace
RECENT_WORKSPACES_PROTOCOL=3
SHOW_RECENT_WORKSPACES=false
SHOW_WORKSPACE_SELECTION_DIALOG=false
EOT

cat <<EOT > ~/local/knime/configuration/.settings/org.knime.ui.java.prefs
eclipse.preferences.version=1
startWithWebUI=false
EOT

update-mime-database ~/.local/share/mime

# Copies the icon for file type
mkdir -p ~/.local/share/icons/Yaru/128x128/mimetypes
cp ~/local/knime/icon.xpm ~/.local/share/icons/Yaru/128x128/mimetypes/application-x-knime-workflow.xpm
