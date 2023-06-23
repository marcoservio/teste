using CatalogoCarros.Api.Data;
using CatalogoCarros.Api.Models;

namespace CatalogoCarros.Api.Services
{
    public class CarroService : ICarroService
    {
        private readonly ICarroDao _dao;

        public IEnumerable<Carro> Listar()
        {
            return _dao.Listar();
        }
    }
}
