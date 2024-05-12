using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Rise2024.Migrations
{
    public partial class UpdateDB : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "priceId",
                table: "Books",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "Price",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Amount = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Price", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Books_priceId",
                table: "Books",
                column: "priceId");

            migrationBuilder.AddForeignKey(
                name: "FK_Books_Price_priceId",
                table: "Books",
                column: "priceId",
                principalTable: "Price",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Books_Price_priceId",
                table: "Books");

            migrationBuilder.DropTable(
                name: "Price");

            migrationBuilder.DropIndex(
                name: "IX_Books_priceId",
                table: "Books");

            migrationBuilder.DropColumn(
                name: "priceId",
                table: "Books");
        }
    }
}
