using Microsoft.EntityFrameworkCore;

namespace BatteryPlatform.Infrastructure.Persistence;

public class BatteryPlatformDbContext : DbContext
{
    public BatteryPlatformDbContext(
        DbContextOptions<BatteryPlatformDbContext> options)
        : base(options)
    {
    }
}