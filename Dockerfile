FROM mcr.microsoft.com/dotnet/core/sdk:2.1
WORKDIR /app
COPY ./ ./
ADD run.api.test.sh .
RUN chmod 755 run.api.test.sh
ENTRYPOINT ["/bin/bash", "-c", "./run.api.test.sh"]