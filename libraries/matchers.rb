if defined?(ChefSpec)
  ChefSpec.define_matcher :tar_extract

  def install_tar_package(source)
    ChefSpec::Matchers::ResourceMatcher.new(:tar_package, :install, source)
  end

  def extract_tar_extract(source)
    ChefSpec::Matchers::ResourceMatcher.new(:tar_extract, :extract, source)
  end

  def extract_local_tar_extract(source)
    ChefSpec::Matchers::ResourceMatcher.new(:tar_extract, :extract_local, source)
  end
end
