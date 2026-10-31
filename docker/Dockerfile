# Reference multi-stage build for the ERP Integration API
# (https://github.com/kratos0722/erp-integration-service). Build context is that repo's root.
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY . .
RUN dotnet restore \
 && dotnet publish src/ErpIntegration.Api/ErpIntegration.Api.csproj -c Release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app .
EXPOSE 8080
ENV ASPNETCORE_URLS=http://+:8080
ENTRYPOINT ["dotnet", "ErpIntegration.Api.dll"]
