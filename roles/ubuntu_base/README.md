## Configuring the ubuntu_base role.
There are **4** variables for this role – you can find them in the defaults and vars directories.


| Variable        | Description                                            | Directory | Set                                           |   |
|-----------------|--------------------------------------------------------|-----------|-----------------------------------------------|---|
| ubuntu_packages | A list of packages to install on the system using apt. | vars/     | `vars/main.yml`                               |   |
| pip_packages    | A list of packages to install on the system using pip. | vars/     | `vars/main.yml`                               |   |
| custom_ssh_port | The ssh port that will be used.                        | defaults/ | `system_vars.yml` in the root of ubuntu-infra |   |
| username        | The username to enable passwordless sudo for.          | defaults/ | `system_vars.yml` in the root of ubuntu-infra |   |
