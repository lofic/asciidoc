require 'rubygems'
require 'nokogiri'
require 'fileutils'

desc "Default task : build html and index"
task :default do
    Rake::Task[:genhtml].invoke
    Rake::Task[:genindex].invoke
end

desc "Generate HTML files from .txt asciidoc files"
task :genhtml, [:theme] do |t, args|
    args.with_defaults(:theme => "pryz")
    puts "Building notes with the theme : #{args.theme}"

    if not File.directory? './html'
        puts "mkdir html"
        Dir.mkdir './html'
    end

    FileUtils.cp(Dir.glob('*.txt'),'html')

    FileUtils.cd('html')
    txtfilelist=Dir.glob('*.txt')

    if txtfilelist.empty?
        puts "No .txt files... exiting"
        exit
    end

    until txtfilelist.empty?
        Thread.new { 
            file=txtfilelist.pop
            %x[asciidoc  --theme=#{args.theme} #{file}] 
            puts "- #{file} done"
        } unless Thread.list.length > 32
    end
    loop do
        if Thread.list.length < 2
            FileUtils.rm(Dir.glob('*.txt')) if Thread.list.length < 2
            break
        end
        sleep 0.1
    end

end

desc "Generate Index file"
task :genindex, [:theme, :backend] do |t, args|
    args.with_defaults(:theme => "pryz", :backend => "index_list")
    puts "Building index with the theme : #{args.theme}"
    idx_file = 'index.txt'
    index = File.open(idx_file, 'w+')
    head_content = <<EOT
Notes 
===== 

link:https://github.com/pryz[github.com/Pryz] 

List
---- 
    
EOT
    index.write(head_content)
    txtfilelist=Dir.glob('html/*.html')
    until txtfilelist.empty?
        note_file = txtfilelist.pop
        page = Nokogiri::HTML(open(note_file))
        title = page.css('title').text
        tags = ""
        page.xpath('//div[@class="paragraph"]').each do | div |
            tags = div.content if div.content.match(/Additional tags :/)
        end
        index.write("* link:#{note_file}[#{title}] #{tags}\n")
    end
    index.close
    %x[asciidoc --theme=#{args.theme} --backend=#{args.backend} #{idx_file}]
    File.delete(idx_file)
end
