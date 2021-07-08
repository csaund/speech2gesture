FROM python
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt
WORKDIR /app
COPY . .
ENTRYPOINT ["./docker-entrypoint.sh"]

# docker-entrypoint.sh
#!/usr/bin/env bash
# Maybe do some stuff that has to happen at container runtime, not buildtime - download passwords from an external source, for instance
# Very important that you 'exec' here - otherwise the entrypoint has PID 1 instead of whatever you're trying to run, and then a bunch of things behave slightly differently than you're used to (system signal handling, mostly)
exec $@
