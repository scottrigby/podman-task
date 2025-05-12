from alpine:latest as build

run apk add curl \
    && sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d

run apk add openssl bash \
    && curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

run curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" \
    && if echo "$(cat kubectl.sha256)  kubectl" | sha256sum -c; \
            then install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl; \
        fi;
    
from alpine:latest
copy --from=build /usr/local/bin/helm /usr/local/bin/kubectl /bin/task /usr/local/bin/

entrypoint ["task"]
cmd ["--list"]
