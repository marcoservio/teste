using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CatalogoCarros.Api.Migrations
{
    /// <inheritdoc />
    public partial class Alteraçãoonomedatabela : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_Carros",
                table: "Carros");

            migrationBuilder.RenameTable(
                name: "Carros",
                newName: "carros");

            migrationBuilder.AddPrimaryKey(
                name: "PK_carros",
                table: "carros",
                column: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_carros",
                table: "carros");

            migrationBuilder.RenameTable(
                name: "carros",
                newName: "Carros");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Carros",
                table: "Carros",
                column: "Id");
        }
    }
}
