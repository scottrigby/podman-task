# Podman Taskfile

Replacement function to run go-task in a container.

If you're in the current directory, runs within a container. Otherwise runs falls outside the container if you have task installed on your local system.

## Prerequisites

- [podman](https://podman.io/)

## How-to

1. Load replacement function

    ```sh
    source ./podman-task
    ```

2. Run some tasks

    ```console
    $ task
    task: Available tasks for this project:
    * foo:           Test task
    * helm:          Run helm with args inside the container (example: "task helm -- show chart ./example")
    * kubectl:       Run kubectl with args inside the container (example: "task kubectl -- version --client")

    $ task foo TWO="what\'s up"
    🚗🚗🚗 ONE=hello TWO=what's up

    $ task helm -- show chart ./charts/example
    apiVersion: v2
    name: example
    version: 0.1.0

    $ task kubectl -- version --client
    version.BuildInfo{Version:"v3.17.3", GitCommit:"e4da49785aa6e6ee2b86efd5dd9e43400318262b", GitTreeState:"clean", GoVersion:"go1.23.7"}
    ```
