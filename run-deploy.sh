#!/bin/bash
set -e

IMAGE="touchble-banners"
CONTAINER="touchble-banners"
PORT=$1

if [ -z "$PORT" ]; then
  echo ""
  echo "  Usage: ./run-deploy.sh <port>"
  echo "  Example: ./run-deploy.sh 8081"
  echo ""
  exit 1
fi

echo ""
echo "  Touchable Banners — Deploy"
echo "  ──────────────────────────"
echo ""

# Stop and remove existing container if running
if docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER}$"; then
  echo "  Stopping existing container..."
  docker rm -f "$CONTAINER" > /dev/null
fi

echo "  Building image..."
docker build --build-arg PORT="$PORT" -t "$IMAGE" . 2>&1 | sed 's/^/    /'

echo ""
echo "  Starting container on port ${PORT}..."
docker run -d --name "$CONTAINER" -p "${PORT}:${PORT}" --restart unless-stopped "$IMAGE" > /dev/null

echo ""
echo "  Done!  http://localhost:${PORT}"
echo ""
