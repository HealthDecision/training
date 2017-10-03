desc "Build static site to build directory"
task :build do
  status = system("middleman build --clean")
  puts status ? "OK" : "FAILED"
end

desc "Build static site to build directory using URLs schemes that will work if browsing directly from file system."
task :build_for_filesystem_hosting do
  status = system("BUILD_FOR_FILESYSTEM=true middleman build --clean")
  puts status ? "OK" : "FAILED"
end

desc "Run the middleman server"
task :run do
  system("middleman server -p 2113")
end

desc "Watch and compress Sass"
task :sass do
  system("cd source/assets/css && sass --watch styles.scss:styles.css --style compressed")
end

desc "Run a simple web server within the build directory"
task :serve_static do
  system("cd build && python -m SimpleHTTPServer 8888")
end