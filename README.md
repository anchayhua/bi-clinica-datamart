# bi-clinica-datamart

https://www.youtube.com/watch?v=PF-npT-TFxE

Visual Studio 2019

Install Sql Server with Analysis Services

docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Ncnr123." -p 1433:1433 --name sql1 --hostname sql1 -d mcr.microsoft.com/mssql/server:2022-latest

Business Intelligence

1. Crear proyecto Analysis Service -> Multidimensional and Data Mining
2. Origenes de datos -> Cnx_Datamart_Clinica
	- Herencia
		- Use the credential of the current user
3. Vista de origenes de datos -> Dsv_Datamart_Clinica
4. Cubos -> Cubo_Datamart_Clinica
	
	* Seleccionar en cualquier Dimesion para trabajr en los cubos
		- Seleccionar atributos en la tabla y arrastrar al inicial,, finalizando en las Jerarquias
		- Despues darle clic en el icono de "procesar"