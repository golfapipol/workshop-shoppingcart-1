FROM mcr.microsoft.com/dotnet/core/sdk:2.1 AS build-env
WORKDIR /app
COPY . ./
RUN dotnet publish -c Release -o out -r linux-x64

FROM mcr.microsoft.com/dotnet/core/runtime:2.1
WORKDIR /app
COPY --from=build-env /app/out ./
RUN apt-get update -y && apt-get install libunwind8
ENTRYPOINT ["dotnet", "api.dll"]