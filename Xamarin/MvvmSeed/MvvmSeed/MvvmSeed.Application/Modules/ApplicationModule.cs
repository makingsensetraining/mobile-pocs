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

            // TODO [WIP] Proper DbContext initalization, abstract into interface, etc..
            cb.Register(c => InitializeLocalStorageContext(c.ResolveNamed<string>("dbPath")));

            cb.Register(c => new StringRandomizerService(c.Resolve<LocalStorageContext>())).As<IStringRandomizerService>().SingleInstance();
        }

        private LocalStorageContext InitializeLocalStorageContext(string dbPath)
        {
            try
            {
                var filePath = Path.Combine(dbPath, "localStorage.db");
                if (Directory.Exists(dbPath))
                {
                    if (!File.Exists(filePath))
                    {
                        using (var stream = File.Create(filePath))
                        {
                            
                        }
                        
                    }
                }

                var dbContext = new LocalStorageContext(Path.Combine(dbPath, "localStorage.db"));
                dbContext.Database.EnsureCreated();
                return dbContext;
            }
            catch (Exception e)
            {
                var msg = e.Message;
                return null;
            }
            
        }
    }
}
