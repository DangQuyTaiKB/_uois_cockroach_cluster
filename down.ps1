# down.ps1

# Stop and remove Docker containers, networks, images, and volumes
docker-compose down --remove-orphans --volumes

# Remove the 'certs' directory and its contents
Remove-Item -Recurse -Force cert