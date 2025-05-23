# frozen_string_literal: true

# ShinyBlog plugin for ShinyCMS ~ https://shinycms.org
#
# Copyright 2009-2025 Denny de la Haye ~ https://denny.me
#
# ShinyCMS is free software; you can redistribute it and/or modify it under the terms of the GPL (version 2 or later)

module ShinyBlog
  # Base class for view components - part of the ShinyBlog plugin for ShinyCMS
  class ApplicationComponent < ViewComponent::Base
    include ShinyCMS::ViewComponentBase
  end
end
