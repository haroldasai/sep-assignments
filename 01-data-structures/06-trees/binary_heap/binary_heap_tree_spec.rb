include RSpec
require 'benchmark'

require_relative 'binary_heap_tree'

RSpec.describe BinaryHeapTree, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { BinaryHeapTree.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node as a left child" do
      tree.insert(root, pacific_rim)
      expect(root.left.title).to eq "The Matrix"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      expect(root.left.title).to eq "The Matrix"
      expect(root.right.title).to eq "Braveheart"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      tree.insert(root, donnie)
      expect(root.left.left.title).to eq "The Matrix"
      expect(root.left.title).to eq "Donnie Darko"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      tree.insert(root, donnie)
      tree.insert(root, inception)
      expect(root.left.left.title).to eq "The Matrix"
      expect(root.left.right.title).to eq "Inception"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      tree.insert(root, donnie)
      tree.insert(root, inception)
      tree.insert(root, martian)
      expect(root.right.left.title).to eq "The Martian"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      tree.insert(root, donnie)
      tree.insert(root, inception)
      tree.insert(root, martian)
      tree.insert(root, hope)
      expect(root.right.right.title).to eq "Star Wars: A New Hope"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      expect(tree.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(root, pacific_rim)
      expect(tree.find(root, "The Matrix").title).to eq "The Matrix"
    end

    it "properly finds a right node" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      expect(tree.find(root, "Braveheart").title).to eq "Braveheart"
    end

    it "properly finds a left-left node" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      tree.insert(root, donnie)
      expect(tree.find(root, "The Matrix").title).to eq "The Matrix"
    end

    it "properly finds a left-right node" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      tree.insert(root, donnie)
      tree.insert(root, inception)
      expect(tree.find(root, "Inception").title).to eq "Inception"
    end

    it "properly finds a left-right node" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      tree.insert(root, donnie)
      tree.insert(root, inception)
      tree.insert(root, martian)
      expect(tree.find(root, "The Martian").title).to eq "The Martian"
    end

    it "properly finds a left-right node" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      tree.insert(root, donnie)
      tree.insert(root, inception)
      tree.insert(root, martian)
      tree.insert(root, hope)
      expect(tree.find(root, "Star Wars: A New Hope").title).to eq "Star Wars: A New Hope"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(root, hope)
      tree.delete(root, "Star Wars: A New Hope")
      expect(tree.find(root, "Star Wars: A New Hope")).to be_nil
    end

    it "properly deletes a right node" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      tree.delete(root, "Braveheart")
      expect(tree.find(root, "Braveheart")).to be_nil
      expect(root.title).to eq "Pacific Rim"
      expect(root.left.title).to eq "The Matrix"
    end

    it "properly deletes a root node" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      tree.insert(root, donnie)
      expect(tree.last_node.title).to eq "The Matrix"
      tree.delete(root, "Pacific Rim")
      expect(tree.last_node.title).to eq "The Matrix"
      expect(tree.find(root, "Pacific Rim")).to be_nil
      expect(root.left.title).to eq "Donnie Darko"
      expect(root.right.title).to eq "The Matrix"
      expect(root.title).to eq "Braveheart"
    end

    it "properly deletes a left-right node" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      tree.insert(root, donnie)
      tree.insert(root, inception)
      tree.insert(root, jedi)
      expect(tree.last_node.title).to eq "Star Wars: Return of the Jedi"
      tree.delete(root, "Inception")
      expect(tree.last_node.title).to eq "Donnie Darko"
      expect(tree.find(root, "Inception")).to be_nil
      expect(root.left.title).to eq "Star Wars: Return of the Jedi"
      expect(root.left.right.title).to eq "Donnie Darko"
      tree.delete(root, "The Matrix")
      expect(tree.last_node.title).to eq "Donnie Darko"
      expect(tree.find(root, "The Matrix")).to be_nil
      expect(root.left.title).to eq "Star Wars: Return of the Jedi"
      expect(root.left.left.title).to eq "Donnie Darko"
    end
  end

  describe "#printf" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nThe Matrix: 87\nDistrict 9: 90\nStar Wars: The Empire Strikes Back: 94\nInception: 86\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nThe Martian: 92\nMad Max 2: The Road Warrior: 98\n"
       tree.insert(root, hope)
       tree.insert(root, empire)
       tree.insert(root, jedi)
       tree.insert(root, martian)
       tree.insert(root, pacific_rim)
       tree.insert(root, inception)
       tree.insert(root, braveheart)
       tree.insert(root, shawshank)
       tree.insert(root, district)
       tree.insert(root, mad_max_2)
       expect { tree.printf }.to output(expected_output).to_stdout
     }

#     specify {
#       expected_output = "The Matrix: 87\nBraveheart: 78\nMad Max 2: The Road Warrior: 98\nPacific Rim: 72\nInception: 86\nDistrict 9: 90\nStar Wars: Return of the Jedi: 80\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\n"
#       tree.insert(root, mad_max_2)
#       tree.insert(root, district)
#       tree.insert(root, shawshank)
#       tree.insert(root, braveheart)
#       tree.insert(root, inception)
#       tree.insert(root, pacific_rim)
#       tree.insert(root, martian)
#       tree.insert(root, jedi)
#       tree.insert(root, empire)
#       tree.insert(root, hope)
#       expect { tree.printf }.to output(expected_output).to_stdout
#     }
  end
end

n = 127
array = []
n.times do |num|
  array << num + 1
end

ind = rand(array.length)
root = Node.new(array[ind], array[ind])
tree = BinaryHeapTree.new(root)
array.delete_at(ind)

until array.length == 0 do
  ind = rand(array.length)
  node = Node.new(array[ind], array[ind])
  tree.insert(root, node)
  array.delete_at(ind)
end

#Smallest node always becomes the root 
tree.printtree  
tree.delete(root, 1)
tree.printtree  
tree.delete(root, 2)
tree.printtree  
tree.delete(root, 3)
tree.printtree  
tree.delete(root, 4)
tree.printtree  
tree.delete(root, 5)
tree.printtree  


n = 100000
array = []
n.times do |num|
  array << num + 1
end
ind = rand(array.length)
root = Node.new(array[ind], array[ind])
tree = BinaryHeapTree.new(root)
array.delete_at(ind)

Benchmark.bm(30) do |x|
  x.report("binary heap tree create:") do
    until array.length == 0 do
      ind = rand(array.length)
      node = Node.new(array[ind], array[ind])
      tree.insert(root, node)
      array.delete_at(ind)
    end
  end

  x.report("find depth first search:") do
    tree.find(root, 50000)
  end

  x.report("delete node:") do
    tree.delete(root, 50000)
  end
end  