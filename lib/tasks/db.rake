namespace :db do
  desc "Drops, creates, migrates and seeds database"
  task rebuild: :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
  end

  namespace :data do
    desc "TODO"
    task load: :environment do
      union = Brand.create(
        { name: 'Unión' },
      )

      brands = Brand.create([
        { name: 'Dos Hermanos' },
        { name: 'Pureza' },
        { name: 'Caserita' },
        { name: 'Favorita' },
        { name: 'Carrefour' },
        { name: 'Cañuelas' },
        { name: 'Preferido' },
        { name: 'Lucchetti' },
        { name: 'Blancaflor' },
      ])

      yerba_mate_union_tradicional = Product.create(
        { brand: union, name: 'Yerba Mate', ean_code: '1000000000000' }
      )

      yerba_mate_union_bcp = Product.create(
        { brand: union, name: 'Yerba Mate', ean_code: '7790387014167' }
      )
    end
  end

end
