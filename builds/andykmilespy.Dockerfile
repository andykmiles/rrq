FROM python:3.9.1-slim-buster
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN apt-get update && apt-get install -y zsh

SHELL ["/bin/zsh", "-c", "-o", "pipefail"]

RUN if ! getent passwd andy; then groupadd -g 1000 andy && useradd -u 1000 -g 1000 -d /home/andy -m -s /bin/zsh andy; fi \
    && echo andy:andy | chpasswd \
    && echo 'andy ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && mkdir -p /etc/sudoers.d \
    && echo 'andy ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/andy \
    && chmod 0440 /etc/sudoers.d/andy \
	&& apt-get autoremove \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
