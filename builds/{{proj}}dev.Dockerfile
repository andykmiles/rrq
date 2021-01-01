FROM {{proj}}
SHELL ["/bin/zsh", "-c", "-o", "pipefail"]
USER root

RUN pip install --no-cache-dir wheel \
    && pip install --no-cache-dir -e /home/andy/app \
    && pip install --no-cache-dir loguru \
    && pip install --no-cache-dir pysnooper \
    && pip install --no-cache-dir pytest \
    && pip install --no-cache-dir pytest-cov \
    && pip install --no-cache-dir pytest-bdd \
    && pip install --no-cache-dir tox \
    && pip install --no-cache-dir mypy \
    && pip install --no-cache-dir pytest-mock \
    && pip install --no-cache-dir pre-commit \
    && pip install --no-cache-dir black \
    && chown -R andy /home/andy

USER andy
WORKDIR /home/andy/app