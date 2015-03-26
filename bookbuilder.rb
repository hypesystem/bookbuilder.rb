class BookBuilder
  def build!
    srcdir = Dir["src/*"]
    chapters = srcdir.sort
    chapterContents = chapters.map { |chapter|
        files = Dir[chapter+"/*"].sort
        fileContents = files.map { |filename| 
        file = File.open(filename, "rb")
        file.read
        }
        fileContents.reduce("", :+)
    }
    input = chapterContents.reduce("", :+)

    options = {
      space_after_headers: true,
      fenced_code_blocks: true,
      autolink: true,
      with_toc_data: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer)

    content = markdown.render(input)

    puts "<!DOCTYPE html><html><head><meta charset='utf8'><title>book</title><link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,800,400italic,700' rel='stylesheet' type='text/css'><link rel='stylesheet' type='text/css' href='style.css'></head><body><article>"
    puts content
    puts "</article></body></html>"
  end
end
