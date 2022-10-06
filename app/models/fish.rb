class Fish < ApplicationRecord

  ### associations ###
  # Traditional has_many through: join table association
  has_many :fish_candies
  has_many :candies, through: :fish_candies
  has_many :trinkets

  ### joins ###
  scope :with_candy, -> { joins(:candies).distinct }
  scope :with_trinket, -> { joins(:trinkets).distinct }
  scope :with_trinket_with_member, -> { joins(trinkets: [:members]) } # This loads extra because no distinct ;)

  # Fish has many trinkets has many members. Give me the fish that have trinkets named Tony and members named Bart.
  scope :with_some_qualification_on_trinket_and_member, -> do
    joins(trinkets: [:members]).where(members: { name: 'Bart' }, trinkets: { name: 'Tony' })
  end

  scope :same_as_above_but_different, -> do
    joins(trinkets: [:members]).where("members.name = 'Bart' AND trinkets.name = 'Tony'")
  end

  def self.scoping_just_as_easily_with_a_method
    joins(:candies).distinct
  end

  ### includes ###
  # Use this particularly to avoid N+1 when we're grabbing at associations in views.
  # > Depending on what your query is, :includes will use either the ActiveRecord method :preload or :eager_load.
  # > :eager_load is used if the association is referenced in a later chained where clause
  # def all_the_different_includes_you_can_do
    # this is failing because we're trying to eager load a has_many through association
    # includes(trinkets: [:members], :candies)
  # end


  ### baller where queries ###

  # not, or

  ### misc ###

  # stabby with arg is -> (arg) { ... }
  scope :using_a_lambda_and_an_arg, lambda { |some_arg| where(fins: some_arg) }

  ### Extra credit on joins ###

  ## Inner Join ##
  # Inner join is the default join type. It returns only the rows that have matching values in both tables.
  # In this example, owners that have a cat. (Reversed would be cats that have an owner.)
  # SELECT * FROM pet_owners INNER JOIN cats ON pet_owners.id = cats.pet_owner_id;

  ## Left Outer Join ##
  # Left outer join returns all rows from the left table (table1), with the matching rows in the right table (table2).
  # The result is NULL from the right side, if there is no match. So like, if person with ID 4 didn't have a cat, you'd
  # get an id 4, and all the returned rows and attributes would be null because there's nothing matching. Kind of handy
  # if you want to render the null stuff
  # SELECT * FROM pet_owners LEFT OUTER JOIN cats ON pet_owners.id = cats.pet_owner_id;

  ## Right Outer Join ##
  # Same as the last, but we give all rows in the *second* table specified, even if there's no match in the first table.
  # SELECT pet_owners.id, cats.name, cats.fur_color
  # FROM pet_owners
  # RIGHT OUTER JOIN cats
  # ON pet_owners.id = cats.pet_owner_id

  ## Full Outer Join ##
  # Full outer join returns all rows when there is a match in either left or right table.
  # MySQL does not support this but Postgres does
  # SELECT
  # pet_owners.id AS pet_owner_id,
  # pet_owners.name AS pet_owner_name,
  # cats.id AS cat_id,
  # cats.name AS cat_name
  # FROM pet_owners
  # FULL OUTER JOIN cats
  # ON pet_owners.id = cats.pet_owner_id

  ### But I wanna take this to the next level ###
  # Okay, okay. Check out this concept of database views in rails with scenic: https://github.com/scenic-views/scenic

  ### further reading ###
  # https://guides.rubyonrails.org/active_record_querying.html *
  # https://guides.rubyonrails.org/active_record_basics.html *
  # https://guides.rubyonrails.org/active_record_migrations.html *
  # https://guides.rubyonrails.org/active_record_validations.html *
  # https://guides.rubyonrails.org/active_record_callbacks.html
  # https://medium.com/swlh/getting-really-good-at-rails-joins-93fd5b33fa8e
  # https://medium.com/gusto-engineering/a-visual-guide-to-using-includes-in-rails-700a91cd3095
  # https://medium.com/swlh/learn-sql-joins-once-and-for-all-d5d9078eee7c

end
