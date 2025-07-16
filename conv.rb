Dir.glob("log/*.mjson").each do |mjson_file|
  html_file = mjson_file.sub(/\.mjson$/, ".html")
  system("ruby ./mjai/bin/mjai convert #{mjson_file} #{html_file}")
end