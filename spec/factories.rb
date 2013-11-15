FactoryGirl.define do
  factory :invoice_item do
    price 123
    name "abc"
    invoice
  end
  
  factory :invoice_note do
    content "Xyz"
  end

  # user factory without associated posts
  factory :invoice do
    payment_period "12.11.2013 - 12.12.2013"
    invoice_number 1234567
    invoice_note 

    # user_with_posts will create post data after the user has been created
    factory :ivoice_with_invoice_items do
      # posts_count is declared as an ignored attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      ignore do
        invoice_items_count 5
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including ignored
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |invoice, evaluator|
        FactoryGirl.create_list(:invoice_item, evaluator.invoice_items_count, invoice: invoice)
      end
    end
  end
end