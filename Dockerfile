# Étape 1 : build avec le SDK .NET
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copier uniquement le csproj et restaurer les dépendances
COPY MyWebApi/*.csproj ./ 
RUN dotnet restore

# Copier le reste du code et publier
COPY MyWebApi/. ./
RUN dotnet publish -c Release -o /app/publish

# Étape 2 : runtime léger pour exécution
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish ./

# Configurer le port et URL
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

ENTRYPOINT ["dotnet", "MyWebApi.dll"]
