require 'rdoc'

module Doc
  class Ruby
    attr_reader :query, :parser
    protected :query, :parser

    def initialize(query)
      @query = query
      @parser = RDoc::RI::Driver.new(
        use_stdout: true,
        width: 1000,
        formatter: RDoc::Markup::ToMarkdown
      )
    end

    def to_markdown
      ri_output = ''
      $stdout = StringIO.new(ri_output)
      parser.display_names([query])
      $stdout = STDOUT

      ri_output
    rescue RDoc::RI::Driver::NotFoundError => e
      e.message
    end

    def self.for(query)
      new(query)
    end
  end
end
