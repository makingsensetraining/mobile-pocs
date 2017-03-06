using MvvmCross.Core.ViewModels;
using MvvmCross.Platform;
using MvvmSeed.Application.ViewModels;

namespace MvvmSeed.Application
{
    public class App : MvxApplication
    {
        public App()
        {
            //TODO - Integrate Autofac and create separate modules
            Mvx.RegisterSingleton<IMvxAppStart>(new MvxAppStart<SampleViewModel>());
        }
    }
}
