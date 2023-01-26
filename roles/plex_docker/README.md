## Configuring the plex_docker role.
This role uses two (2) variables:

| Variable  | Description                                          | Directory         | Set                                 |   |
|-----------|------------------------------------------------------|-------------------|-------------------------------------|---|
| media_dir | The media directory path for Plex.                   | vars/             | `vars/main.yml`                     |   |
| username  | This is used by the media_dir variable for the path. | UBUNTU-INFRA/vars | `UBUNTU-INFRA/vars/system_vars.yml` |   |
