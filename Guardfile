guard 'bundler' do
  watch('Gemfile')
  watch(%r|^.*\.gemspec|)
end

guard 'minitest' do
  watch(%r|^test/unit/(.*)_test\.rb|)
  watch(%r|^lib/*\.rb|){'test'}
  watch(%r{^lib/.*/([^/]+)\.rb$}){|m| "test/unit/#{m[1]}_test.rb"}
  watch(%r|^test/helper\.rb|){'test'}
end
