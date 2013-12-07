require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    # it { should have_content('Sample App') }
    # it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }

    # it "should have the h1 'Sample App'" do
    #   expect(page).to have_content('Sample App')
    # end

    # it "should have the right title" do
    #   expect(page).to have_title("#{base_title}")
    # end

    # it "should not have a custom page title" do
    #   expect(page).not_to have_title('| Home')
    # end
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading) { 'Help' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Help') }
  end

  describe "About page" do
    before { visit about_path }
    let(:heading) { 'About Us' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title(" About") }
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading) { 'Contact' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Contact') }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_content('About Us')
    click_link "Help"
    expect(page).to have_content('Help')
    click_link "Contact"
    expect(page).to have_content('Contact')
    click_link "Home"
    expect(page).to have_content('Home')
    click_link "Sign up now!"
    expect(page).to have_content('Sign up')
    click_link "sample app"
    expect(page).to have_content('sample app')
  end
end

