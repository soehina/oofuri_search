class Result < ApplicationRecord
    validates:number,{presence:true}
    validates:word,{presence:true,uniqueness: true}
    def self.search(search)
        search ? where('word LIKE ?', "%#{search}%") : all
    end
end
