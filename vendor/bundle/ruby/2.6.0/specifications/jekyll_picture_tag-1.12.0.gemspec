# -*- encoding: utf-8 -*-
# stub: jekyll_picture_tag 1.12.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll_picture_tag".freeze
  s.version = "1.12.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Robert Wierzbowski".freeze, "Brendan Tobolaski".freeze, "Robert Buchberger".freeze]
  s.date = "2020-07-29"
  s.description = "    Jekyll Picture Tag is a liquid tag that adds responsive images to your\n    Jekyll static site.Jekyll Picture Tag automatically creates resized source\n    images, is fully configurable, and covers all use cases \u2014 including art\n    direction and resolution switching \u2014 with a little YAML configuration and a\n    simple template tag.\n".freeze
  s.email = ["robert@buchberger.cc".freeze]
  s.homepage = "https://github.com/rbuchberger/jekyll_picture_tag".freeze
  s.licenses = ["BSD-3-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new([">= 2.5".freeze, "< 3".freeze])
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Easy responsive images for Jekyll.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.11"])
      s.add_development_dependency(%q<mocha>.freeze, ["~> 1.9"])
      s.add_development_dependency(%q<nokogiri>.freeze, ["~> 1.10"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 12.3"])
      s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<solargraph>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.6"])
      s.add_runtime_dependency(%q<mime-types>.freeze, ["~> 3"])
      s.add_runtime_dependency(%q<mini_magick>.freeze, ["~> 4"])
      s.add_runtime_dependency(%q<objective_elements>.freeze, ["~> 1.1.2"])
      s.add_runtime_dependency(%q<jekyll>.freeze, ["< 5"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.11"])
      s.add_dependency(%q<mocha>.freeze, ["~> 1.9"])
      s.add_dependency(%q<nokogiri>.freeze, ["~> 1.10"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, ["~> 12.3"])
      s.add_dependency(%q<rubocop>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<solargraph>.freeze, [">= 0"])
      s.add_dependency(%q<addressable>.freeze, ["~> 2.6"])
      s.add_dependency(%q<mime-types>.freeze, ["~> 3"])
      s.add_dependency(%q<mini_magick>.freeze, ["~> 4"])
      s.add_dependency(%q<objective_elements>.freeze, ["~> 1.1.2"])
      s.add_dependency(%q<jekyll>.freeze, ["< 5"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.11"])
    s.add_dependency(%q<mocha>.freeze, ["~> 1.9"])
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.10"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.3"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<solargraph>.freeze, [">= 0"])
    s.add_dependency(%q<addressable>.freeze, ["~> 2.6"])
    s.add_dependency(%q<mime-types>.freeze, ["~> 3"])
    s.add_dependency(%q<mini_magick>.freeze, ["~> 4"])
    s.add_dependency(%q<objective_elements>.freeze, ["~> 1.1.2"])
    s.add_dependency(%q<jekyll>.freeze, ["< 5"])
  end
end
