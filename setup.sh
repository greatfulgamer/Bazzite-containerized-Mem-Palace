#!/bin/bash
# Install host-spawn for Podman access
mkdir -p ~/.var/app/com.visualstudio.code/data/node_modules/bin/
cp ~/Downloads/host-spawn-x86_64 ~/.var/app/com.visualstudio.code/data/node_modules/bin/host-spawn
cd ~/.var/app/com.visualstudio.code/data/node_modules/bin/
chmod +x host-spawn && ln -s host-spawn podman

# Set VS Code settings
cat <<EOF > ~/.var/app/com.visualstudio.code/config/Code/User/settings.json
{
  "dev.containers.dockerPath": "podman",
  "dev.containers.dockerComposePath": "podman-compose",
  "dev.containers.dockerSocketPath": "/var/run/podman.sock"
}
EOF

# Start services
podman-compose up -d   
