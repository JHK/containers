# containers

Container images published to Docker Hub as [`julianknocke/containers`](https://hub.docker.com/r/julianknocke/containers), one tag per image.

| Image | Tag | Purpose |
|---|---|---|
| [shell](shell/) | `shell` | Ubuntu debug shell with fish, database clients, and network tools |
| [web](web/) | `web` | OpenResty test server with configurable endpoints, see [web/README.md](web/README.md) |

## Tasks

Run `mise tasks` to list them.

```sh
mise run build          # build all images
mise run publish        # push all images
mise run pod [COMMAND]  # start the shell image as a pod in the current kube context
```
