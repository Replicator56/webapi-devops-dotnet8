using Xunit;
using MyWebApi.Controllers;

public class WeatherForecastTests
{
    [Fact]
    public void Get_ReturnsHelloWorld()
    {
        var controller = new WeatherForecastController();
        var result = controller.Get();
        Assert.NotNull(result);
    }
}
