using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CatalogoCarros.Api.Models.Maps
{
    public class CarroMap : IEntityTypeConfiguration<Carro>
    {
        public void Configure(EntityTypeBuilder<Carro> builder)
        {
            builder.ToTable("carros");
            builder.HasKey(c => c.Id);

            builder.Property(c => c.Marca).IsRequired().HasMaxLength(50);
            builder.Property(c => c.Modelo).IsRequired().HasMaxLength(50);
            builder.Property(c => c.Ano).IsRequired();
            builder.Property(c => c.Cor).IsRequired().HasMaxLength(20);
        }
    }
}
