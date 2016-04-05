#
# PerfectQueue
#
# Copyright (C) 2012-2013 Sadayuki Furuhashi
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#

module PerfectQueue
  module Backend
    def self.new_backend(client, config)
      raise ConfigError, "'type' must be 'rdb_compat'" if config[:type] != 'rdb_compat'
      RDBCompatBackend.new(client, config)
    end
  end

  module BackendHelper
    def initialize(client, config)
      @client = client
      @config = config
    end

    attr_reader :client

    def close
      # do nothing by default
    end
  end
end
