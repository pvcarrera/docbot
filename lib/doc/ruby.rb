require 'rdoc'

# Namespace for classes and modules that handle language documentation
# @since 0.0.1
module Doc
  # Decorator for the standard library RDoc::RI::Driver.
  # This class is in charge of retrieving and parsing Ruby documentation
  # @see RDoc::RI::Driver
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

    # Retrieves and returns the documentation in Markdown format
    # @param (see Ruby#initialize)
    # @example Retrieve Array#first documentation
    #   ruby_doc = Doc::Ruby.new('Array#first')
    #   ruby_doc.to_markdown #=> String with method documentation in Markdown format
    # @return [String] the content of the documentation in Markdown
    def to_markdown
      ri_output = ''
      $stdout = StringIO.new(ri_output)
      parser.display_names([query])
      $stdout = STDOUT

      ri_output
    rescue RDoc::RI::Driver::NotFoundError => e
      e.message
    end

    # Builds a Doc::Ruby instance
    # @param query [String]
    def self.for(query)
      new(query)
    end
  end
end
