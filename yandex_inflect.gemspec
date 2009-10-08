# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{yandex_inflect}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yaroslav Markin"]
  s.autorequire = %q{yandex_inflect}
  s.date = %q{2009-10-09}
  s.description = %q{Yandex.Inflect webservice client (Russian language inflection)}
  s.email = %q{yaroslav@markin.net}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README.rdoc", "Rakefile", "TODO", "init.rb", "lib/yandex_inflect", "lib/yandex_inflect/version.rb", "lib/yandex_inflect.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/yandex_inflect_spec.rb"]
  s.homepage = %q{http://github.com/yaroslav/yandex_inflect/}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Yandex.Inflect webservice client (Russian language inflection)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0"])
  end
end
