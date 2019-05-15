Ransack.configure do |config|
  config.custom_arrows = {
    up_arrow:   '<i class="fa fa-sort-asc  fa-fw"></i>',
    down_arrow: '<i class="fa fa-sort-desc fa-fw"></i>'
  }

  config.add_predicate 'beginning_of_day_gteq',
    arel_predicate: 'gteq',
    formatter: proc { |v| v.beginning_of_day }

  config.add_predicate 'end_of_day_lteq',
    arel_predicate: 'lteq',
    formatter: proc { |v| v.end_of_day }

  config.add_predicate 'gteq_date',
    arel_predicate: 'gteq',
    formatter: proc { |v| v },
    type: :date

  config.add_predicate 'lteq_date',
    arel_predicate: 'lteq',
    formatter: proc { |v| v },
    type: :date
end