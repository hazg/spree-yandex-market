Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_yandex_market'
  s.version     = '2.3.0.beta'
  s.summary     = 'Export products to Yandex.Market'
  s.required_ruby_version = '>= 1.8.7'

  s.author       = 'pronix, divineforest, romul, myfreeweb'
  s.homepage     = 'https://github.com/myfreeweb/spree-yandex-market'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('spree_core', '~> 2.3.0.beta')
  s.add_dependency('nokogiri', '~> 1.6')
end
