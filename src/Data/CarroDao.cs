using CatalogoCarros.Api.Models;

namespace CatalogoCarros.Api.Data
{
    public class CarroDao : ICarroDao
    {
        private readonly AppDbContext _context;

        public Carro BuscarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Carro> Listar()
        {
            return _context.Carros;
        }
    }
}
