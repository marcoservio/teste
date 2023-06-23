using CatalogoCarros.Api.Models;
using CatalogoCarros.Api.Services;

namespace CatalogoCarrosTeste
{
    public class CarroTeste
    {
        private readonly ICarroService _carroService;

        [Fact]
        public void TestaObterTodosCarros()
        {
            // var lstCarros = _carroService.Listar();

            // Assert.NotEmpty(lstCarros);
        }
    }
}