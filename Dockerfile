# Utilisation de l'image SDK .NET pour build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copier le fichier csproj et restaurer les dépendances
COPY MyWebApi/*.csproj ./
RUN dotnet restore

# Copier le reste des fichiers et build de l'application
COPY MyWebApi/. ./
RUN dotnet publish -c Release -o out

# Utilisation d'une image plus légère pour exécuter l'application
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/out ./
ENTRYPOINT ["dotnet", "MyWebApi.dll"]
