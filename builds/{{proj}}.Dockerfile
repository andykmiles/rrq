FROM docker.pkg.github.com/andykmiles/py/basepy:latest
RUN mkdir -p /home/andy/app \
    && mkdir -p /home/andy/app/src/{{proj}} \
    && mkdir -p /home/andy/app/tests \
    && mkdir -p /home/andy/app/docs \
    && mkdir -p /home/andy/data

RUN echo 'export PS1="$ "' >> /home/andy/.zshrc

COPY requirements.txt setup.py /home/andy/app/
RUN pip install --no-cache-dir --upgrade pip \
    && pip --no-cache-dir install wheel \
    && cd /home/andy/app \
    && pip --no-cache-dir install -e /home/andy/app \
    && pip --no-cache-dir install -r /home/andy/app/requirements.txt

USER andy
WORKDIR /home/andy/app
CMD python /home/andy/app/src/app.py
