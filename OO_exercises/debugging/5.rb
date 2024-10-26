class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{self.class::FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('11') # playing with the alias_method keyword
puts blog_post.read

blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post

# You have to change the custom `to_s` method defined in the `File` class from `FORMAT` to `self.class::FORMAT`.
# This is because constants defined in custom classes are lexically scoped. That is, their scope is based on where they
# are defined. In this case, several different `FORMAT` constants are defined in the subclasses for `FILE`. However,
# when the `to_s` method is called with the `puts` invocation on line 45 on the custom `File` object,
# Ruby does not look in the subclasses for a `FORMAT` constant, instead looking inside `File`, then up the method lookup path
# finally going to the top level scope before returning an error.

# This can be resolved with the `::` namespace resolution operator, which, when provided with the class or module,
# accesses the constant in the given location.