require 'spec_helper'

describe 'cdap::user' do
  context 'using default cdap version' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.6) do |node|
        node.automatic['domain'] = 'example.com'
        # node.default['hadoop']['hdfs_site']['dfs.datanode.max.transfer.threads'] = '4096'
        # stub_command(/update-alternatives --display /).and_return(false)
        # stub_command(/test -L /).and_return(false)
        stub_command(/getent/).and_return(false)
      end.converge(described_recipe)
    end

    it 'creates cdap group' do
      expect(chef_run).to create_group('cdap')
    end

    it 'creates cdap user' do
      expect(chef_run).to create_user('cdap')
    end
  end
end
