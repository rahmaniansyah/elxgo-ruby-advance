require './lib/library.rb'

describe 'Main' do
   let(:first_library) {Library.instance}
   
   context 'build_library' do
      it 'return build_library response' do
         input = 'build_library|1|1|2'
         command, *args = input.split("|")

         expect(first_library.send(:build, 1,1,2)).to eq ["Shelf 1 with 1 rows and 2 columns is added"]
      end
   end

   before(:each) do
      first_library.send(:build, 1,1,2)
   end

   context 'put_book' do
      input = 'put_book|9780747532743|Harry Potter 1|J. K. Rowling'
      command, *args = input.split("|")

      expect(first_library.send(:build, 1,1,2)).to eq ["Shelf 1 with 1 rows and 2 columns is added"]
   end

end