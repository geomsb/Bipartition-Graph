def possible_bipartition_helper(dislikes, src, colorArr)
  return true if dislikes.length == 0

  colorArr[src] = 1

  queue = []
  queue.append(src) 

  while queue.length > 0
    dog = queue.shift
    dislikes[dog].each do |disliked_dog|
      if colorArr[disliked_dog] == -1
        colorArr[disliked_dog] = 1 - colorArr[dog] 
        queue.append(disliked_dog) 
      elsif colorArr[disliked_dog] == colorArr[dog] 
        return false          
      end
    end
  end
  return true
end

def possible_bipartition(dislikes)
  colorArr = [-1] * dislikes.length
  i = 0
  while i < dislikes.length
    if colorArr[i] == -1 
      if possible_bipartition_helper(dislikes, i, colorArr) == false
        return false
      end
    end
  i += 1
  end
  return true
end