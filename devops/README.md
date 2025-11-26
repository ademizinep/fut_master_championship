# Fut Master Championship

### Install

- Do you use linux or mac? Configure your host: https://github.com/juniormesquitadandao/gerlessver
- Do you use windows? I'm sorry, docker doesn't work well on Windows.

```bash
cd fut_master_championship
  sh devops/chmod.sh
  ./devops/compose/build.sh --no-cache
  ./devops/compose/up.sh
  ./devops/compose/exec.sh app bash
    cat /etc/hosts | grep dockerhost
    echo > /dev/tcp/postgres/5432 && echo "Postgresql is running."
    exit
  ./devops/compose/down.sh
  exit
```

### Development

- Start terminal

```bash
cd fut_master_championship
  ./devops/compose/up.sh
  ./devops/compose/exec.sh app bash
    mix deps.get
    ./devops/phoenix/reset.sh
    mix test
    ./devops/phoenix/terminal_development.sh
    # CTRL + C
    ./devops/phoenix/server_development.sh
    # browser: http://localhost:4000
    # CTRL + C
    exit
  ./devops/compose/down.sh
  exit
```

### Credentials

Baixar os arquivos ".key" do s3 (se aplicável)
Salvar os arquivos ".key" dentro da pasta "config/credentials" (se aplicável)

```bash
cd fut_master_championship
  ./devops/compose/up.sh
  ./devops/compose/exec.sh app bash
    # Configure credentials as needed for your project
    exit
  exit
```

### Restore from homolog
devops/postgres/README.md

### Accessing depends?

```bash
cd fut_master_championship
  ./devops/compose/up.sh
    # browser: http://localhost:4000
    # CTRL + C
  ./devops/compose/exec.sh postgres bash
    psql -U username -d fut_master_championship_development
    exit
```

### Upgrading versions?

```bash
cd fut_master_championship
  ./devops/compose/down.sh
  ./devops/compose/delete.sh
  ./devops/compose/build.sh
  ./devops/compose/up.sh
  exit
```

### Uninstall

```bash
cd fut_master_championship
  ./devops/compose/down.sh
  ./devops/compose/delete.sh
  exit
```
