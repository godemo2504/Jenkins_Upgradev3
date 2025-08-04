FROM mcr.microsoft.com/dotnet/sdk:7.0 AS builder

WORKDIR /app
COPY src/Pi.Math/Pi.Math.csproj ./Pi.Math/
COPY src/Pi.Runtime/Pi.Runtime.csproj ./Pi.Runtime/
COPY src/Pi.Web/Pi.Web.csproj ./Pi.Web/

COPY src/Pi.Math ./Pi.Math/
COPY src/Pi.Runtime ./Pi.Runtime/
COPY src/Pi.Web ./Pi.Web/

WORKDIR /app/Pi.Web
RUN dotnet restore
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=builder /app/Pi.Web/out .

EXPOSE 80
ENTRYPOINT ["dotnet", "Pi.Web.dll"]
