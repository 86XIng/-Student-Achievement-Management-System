using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(deeptech_manager.Startup))]
namespace deeptech_manager
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
