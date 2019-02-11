class CreateQuestions < Mongoid::Migration
  # Upsert => flag for dont create any new documents
  # multi => update all matching documents
  # safe => safe =)
  MultiUpdate = {:upsert => false, :multi => true, :safe=>true}
  Collection = db.collection("tests")
  def self.up

  end
end

class MergeUsersFirstAndLastName < Mongoid::Migration
  def self.up
    #get the mongo database instance from the Mongoid::Document
    mongo_db = User.db

    #query the collection for the fields needed for the migration
    user_hashes = mongo_db.collection("users").find({}, :fields => ["first_name", "last_name"])

    user_hashes.each do |user_hash|
      new_name = "#{user_hash['first_name']} #{user_hash['last_name']}"

      #update the new field
      mongo_db.collection("users").update({"_id" => user_hash["_id"]}, {"$set" => {"name" => new_name}})

      #remove old fields from collection
      mongo_db.collection("users").update({"_id" => user_hash["_id"]}, {"$unset" => { "last_name" => 1, "first_name" => 1}})
    end
  end
end