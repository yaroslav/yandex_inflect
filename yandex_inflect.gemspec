# -*- encoding: utf-8 -*-

require 'yandex_inflect/version'

Gem::Specification.new do |s|
  s.name = %q{yandex_inflect}
  s.version = YandexInflect::VERSION::STRING

  s.required_rubygems_version = '>= 1.3.5'
  s.authors = ["Yaroslav Markin"]
  s.autorequire = %q{yandex_inflect}
  s.description = %q{Yandex.Inflect webservice client (Russian language inflection)}
  s.email = %q{yaroslav@markin.net}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README.rdoc", "Rakefile", "TODO", "init.rb", "lib/yandex_inflect", "lib/yandex_inflect/version.rb", "lib/yandex_inflect.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/yandex_inflect_spec.rb"]
  s.homepage = %q{http://github.com/yaroslav/yandex_inflect/}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.platform = Gem::Platform::RUBY
  s.summary = %q{Yandex.Inflect webservice client (Russian language inflection)}

  s.add_dependency "httparty"
  
  s.add_development_dependency 'rspec', '~> 2.7.0'
end
