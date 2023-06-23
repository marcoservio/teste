namespace CatalogoCarros.Api.Data
{
    public interface IQuery<T>
    {
        IEnumerable<T> Listar();
        T BuscarPorId(int id);
    }
}
