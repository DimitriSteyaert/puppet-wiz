require 'spec_helper'

describe 'wiz' do
  it { should compile.with_all_deps }
  it { should contain_class('wiz') }
  it { should contain_exec('clone-wiz').that_requires('Package[git]') }
end
