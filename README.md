# Touchable Banners

Serves JPEG banners from a URL path. Touching the image redirects to a configured link.

## How it works

| URL | Behavior |
|-----|----------|
| `/` | Welcome screen |
| `/<name>` | Shows `/images/<name>.jpeg`, tap navigates to `links.json["name"]` |

## Setup

**1. Add your images**

Drop `.jpeg` files into the `images/` folder:
```
images/
  mybanner.jpeg
  anotherbanner.jpeg
```

**2. Configure links**

Edit `links.json` to map each image name to a destination URL:
```json
{
  "mybanner": "https://example.com/page",
  "anotherbanner": "https://example.com/other"
}
```

## Deploy

```bash
chmod +x run-deploy.sh
./run-deploy.sh <port>
```

Example:
```bash
chmod +x run-deploy.sh
./run-deploy.sh 8081
```

The app will be available at **http://localhost:\<port\>**.

## Requirements

- Docker
