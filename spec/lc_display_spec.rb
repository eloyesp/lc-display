require 'lc_display'

describe LcDisplay do

  it 'pass the sample' do
    output = described_class.process <<INPUT
2 12345
3 67890
0 0
INPUT
    expect(output).to eq <<LC
      --   --        --  
   |    |    | |  | |    
   |    |    | |  | |    
      --   --   --   --  
   | |       |    |    | 
   | |       |    |    | 
      --   --        --  

 ---   ---   ---   ---   ---  
|         | |   | |   | |   | 
|         | |   | |   | |   | 
|         | |   | |   | |   | 
 ---         ---   ---        
|   |     | |   |     | |   | 
|   |     | |   |     | |   | 
|   |     | |   |     | |   | 
 ---         ---   ---   ---  

LC
  end
end
