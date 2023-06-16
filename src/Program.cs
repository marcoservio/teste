using Microsoft.OpenApi.Models;

using Prometheus;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "CatalogoCarros", Version = "v1" });
});

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();

var counter = Metrics.CreateCounter("web_api_catalogo_carro", "Conta quantas requisi��es cada endpont recebe.",
    new CounterConfiguration
    {
        LabelNames = new[] { "method", "endpoint" }
    });

app.Use((context, next) =>
{
    counter.WithLabels(context.Request.Method, context.Request.Path).Inc();
    return next();
});

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.UseMetricServer();

app.UseHttpMetrics();

app.Run();
