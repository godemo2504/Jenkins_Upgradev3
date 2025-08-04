FROM mcr.microsoft.com/dotnet/sdk:7.0 AS builder

WORKDIR /jenkins-plugin-model/src

# Corrigé : remonter d’un dossier
COPY ../Pi.Math/Pi.Math.csproj ./Pi.Math/
COPY ../Pi.Runtime/Pi.Runtime.csproj ./Pi.Runtime/
COPY ../Pi.Web/Pi.Web.csproj ./Pi.Web/

# Optionnel : copier tout le code source si nécessaire
# COPY ../Pi.Math ./Pi.Math/
# COPY ../Pi.Runtime ./Pi.Runtime/
# COPY ../Pi.Web ./Pi.Web/

WORKDIR /jenkins-plugin-model/src/Pi.Web
RUN dotnet restore

# app image
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=builder /jenkins-plugin-model/src/Pi.Web .

EXPOSE 80
ENTRYPOINT ["dotnet", "Pi.Web.dll"]
