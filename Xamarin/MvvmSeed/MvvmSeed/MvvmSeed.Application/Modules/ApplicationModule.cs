using System;
using System.IO;
using Autofac;
using MvvmCross.Core.ViewModels;
using MvvmSeed.Application.ViewModels;
using MvvmSeed.Domain.Model;
using MvvmSeed.Domain.Services;

namespace MvvmSeed.Application.Modules
{
    public class ApplicationModule : Module
    {
        protected override void Load(ContainerBuilder cb)
        {
            cb.Register(c => new MvxAppStart<SampleViewModel>()).As<IMvxAppStart>().SingleInstance();

            // TODO [TechnicalDebt | WIP] Improve DbContext initialization
            cb.Register(c => InitializeLocalStorageContext(c.ResolveNamed<string>(App.BootstrapParamaters.LocalAppDataFolder)));

            cb.Register(c => new StringRandomizerService(c.Resolve<LocalStorageContext>())).As<IStringRandomizerService>().SingleInstance();
        }

        // TODO [TechnicalDebt | WIP] Improve DbContext initialization (this method is ugly, also change it to EnsureCreatedAsync)
        private LocalStorageContext InitializeLocalStorageContext(string dbPath)
        {

            var filePath = Path.Combine(dbPath, "localStorage.db");
            if (!Directory.Exists(dbPath))
                Directory.CreateDirectory(dbPath);
            if (!File.Exists(filePath))
            {
                using (var stream = File.Create(filePath)) { /* DB context creation fails on real devices if the file doesn't exit, review while improving DbContext initialization*/ }
            }

            var dbContext = new LocalStorageContext(Path.Combine(dbPath, "localStorage.db"));
            dbContext.Database.EnsureCreated();
            return dbContext;
        }
    }
}
