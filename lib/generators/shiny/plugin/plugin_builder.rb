# frozen_string_literal: true

# ShinyCMS ~ https://shinycms.org
#
# Copyright 2009-2025 Denny de la Haye ~ https://denny.me
#
# ShinyCMS is free software; you can redistribute it and/or modify it under the terms of the GPL (version 2 or later)

module Shiny
  module Plugin
    # Supporting code for the ShinyCMS plugin generator
    class PluginBuilder
      def rakefile
        template 'Rakefile'
      end

      def app
        directory 'app'
      end

      def readme
        template 'README.md'
      end

      def gemfile
        template 'Gemfile'
      end

      def license
        template 'LICENSE'
      end

      def gemspec
        template '%name%.gemspec'
      end

      def lib
        template 'lib/%namespaced_name%.rb'
        template 'lib/%namespaced_name%/engine.rb'
        template 'lib/%namespaced_name%/version.rb'
        template 'lib/tasks/%namespaced_name%_tasks.rake'
      end

      def config
        template 'config/routes.rb'
        template 'config/locales/en.yml'
      end

      def bin( force: false )
        bin_file = 'bin/rails.tt'
        template bin_file, force: force do |content|
          "#{shebang}\n" + content
        end
        chmod 'bin', 0o755, verbose: false
      end

      def gemfile_entry
        return unless inside_application?

        gemfile_in_app_path = File.join( rails_app_path, 'Gemfile' )
        return unless File.exist? gemfile_in_app_path

        entry = "\ngem '#{name}', path: '#{relative_path}'"
        append_file gemfile_in_app_path, entry
      end
    end
  end
end
