namespace CatalogoCarros.Api.Models
{
    public class Carro
    {
        public int Id { get; set; }
        public string Marca { get; set; }
        public string Modelo { get; set; }
        public string Ano { get; set; }
        public string Cor { get; set; }
        public string TipoCorpo { get; set; }
        public string Motor { get; set; }
        public string Transmissao { get; set; }
        public string Quilometragem { get; set; }
        public string Preco { get; set; }
        public string NumeroPortas { get; set; }
        public string CapacidadePassageiros { get; set; }
        public string Descricao { get; set; }
    }
}
