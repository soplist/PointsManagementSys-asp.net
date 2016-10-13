using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PointsManagementSys.Startup))]
namespace PointsManagementSys
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
