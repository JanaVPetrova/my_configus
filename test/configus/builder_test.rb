require "test_helper"

describe Configus::Builder do
  it "should have blocks" do
    c = Configus.build :production do
      env :production do
        website_url 'http://example.com'
      end
      env :development do
        email 'some@mail.com'
      end
    end
    c.website_url.must_equal "http://example.com"
  end

  it "should have many parametres" do
    c = Configus.build :production do
      env :production do
        website_url 'http://example.com'
        email 'some@mail.com'
      end
    end
    c.website_url.must_equal "http://example.com"
    c.email.must_equal 'some@mail.com'
  end

  it "should have nested parametres" do
    c = Configus.build :production do # set current environment
      env :production do
        website_url 'http://example.com'
        email 'some@mail.com'
        pagination do
          admin_per_page 50
          audits_per_page 20
        end
      end
    end
    c.website_url.must_equal 'http://example.com'
    c.email.must_equal 'some@mail.com'
    c.pagination.admin_per_page.must_equal 50
  end

  it "should have parent params" do
    c = Configus.build :development do # set current environment
      env :production do
        website_url 'http://example.com'
        email do
          address 'pop.example.com'
          one_more "thing"
        end
        smtp do
          address 'smtp.example.com'
          port    25
        end
      end

      env :development, :parent => :production do
        website_url 'http://text.example.com'
        email do
          address 'smpt.text.example.com'
        end
        some_new_param "new param"
      end
    end
    c.email.address.must_equal 'smpt.text.example.com'
    c.smtp.port.must_equal 25
  end
end