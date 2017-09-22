include RSpec

require_relative 'kevin_baconator'

RSpec.describe KevinBaconator, type: Class do  
  let (:actor_a) { Node.new("actor_a", {}) }
  let (:actor_b) { Node.new("actor_b", {}) }
  let (:actor_c) { Node.new("actor_c", {}) }
  let (:actor_d) { Node.new("actor_d", {}) }
  let (:actor_e) { Node.new("actor_e", {}) }
  let (:actor_f) { Node.new("actor_f", {}) }
  let (:actor_g) { Node.new("actor_g", {}) }
  let (:actor_h) { Node.new("actor_h", {}) }
  let (:actor_i) { Node.new("actor_i", {}) }
  let (:actor_j) { Node.new("actor_j", {}) }
  let (:actor_k) { Node.new("actor_k", {}) }
  let (:actor_l) { Node.new("actor_l", {}) }
  let (:actor_m) { Node.new("actor_m", {}) }
  let (:actor_n) { Node.new("actor_n", {}) }
  let (:actor_o) { Node.new("actor_o", {}) }
  let (:actor_p) { Node.new("actor_p", {}) }
  let (:actor_q) { Node.new("actor_q", {}) }
  let (:kevin_bacon) { Node.new("Kevin Bacon", {}) }
  let (:graph) { KevinBaconator.new(actor_a) }

  before do
  	actor_a.film_actor_hash = {"movie_a"=>[actor_b, actor_h, actor_i], "movie_c"=>[actor_b, actor_c, actor_d], "movie_d"=>[actor_e, actor_f, actor_g]}
  	actor_b.film_actor_hash = {"movie_a"=>[actor_a, actor_h, actor_i], "movie_b"=>[actor_c, actor_k, actor_j], "movie_c"=>[actor_a, actor_c, actor_d]}
  	actor_c.film_actor_hash = {"movie_b"=>[actor_b, actor_j, actor_k], "movie_c"=>[actor_a, actor_b, actor_d]}
  	actor_d.film_actor_hash = {"movie_c"=>[actor_a, actor_b, actor_c], "movie_f"=>[actor_g, actor_l]}
  	actor_e.film_actor_hash = {"movie_d"=>[actor_a, actor_f, actor_g], "movie_g"=>[actor_f, actor_m, actor_n]}
  	actor_f.film_actor_hash = {"movie_d"=>[actor_a, actor_e, actor_g], "movie_g"=>[actor_e, actor_m, actor_n]}
  	actor_g.film_actor_hash = {"movie_d"=>[actor_a, actor_e, actor_f], "movie_f"=>[actor_d, actor_l]}
  	actor_h.film_actor_hash = {"movie_a"=>[actor_a, actor_b, actor_i]}
  	actor_i.film_actor_hash = {"movie_a"=>[actor_a, actor_b, actor_h]}
  	actor_j.film_actor_hash = {"movie_b"=>[actor_b, actor_c, actor_k]}
  	actor_k.film_actor_hash = {"movie_b"=>[actor_b, actor_c, actor_j], "movie_e"=>[actor_l, kevin_bacon]}
  	actor_l.film_actor_hash = {"movie_e"=>[actor_k, kevin_bacon], "movie_f"=>[actor_d, actor_g], "movie_h"=>[actor_m, actor_q]}
  	actor_m.film_actor_hash = {"movie_g"=>[actor_e, actor_f, actor_n], "movie_h"=>[actor_l, actor_q]}
  	actor_n.film_actor_hash = {"movie_g"=>[actor_e, actor_f, actor_m], "movie_i"=>[actor_o]}
  	actor_o.film_actor_hash = {"movie_i"=>[actor_n], "movie_j"=>[actor_p]}
  	actor_p.film_actor_hash = {"movie_j"=>[actor_o], "movie_k"=>[actor_q]}
  	actor_q.film_actor_hash = {"movie_k"=>[actor_p], "movie_h"=>[actor_m, actor_l]}
  	kevin_bacon.film_actor_hash = {"movie_e"=>[actor_k, actor_l]}
  end

  describe "graph variables" do
    it "returns Kevin Bacon" do
      expect(actor_k.film_actor_hash["movie_e"][1].name).to eq "Kevin Bacon"
    end
  end

  describe "graph methods" do
    it "finds proper path to Kevin Bacon" do
      expect(graph.find_kevin_bacon(actor_a).length).to eq 5
    end
  end	
end