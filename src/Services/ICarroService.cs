using CatalogoCarros.Api.Models;

namespace CatalogoCarros.Api.Services
{
    public interface ICarroService
    {
        IEnumerable<Carro> Listar();
    }
}
