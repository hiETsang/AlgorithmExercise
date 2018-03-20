//: # 算法练习：数组部分

import UIKit


/*:
 ### 1.给定一个有序数组，你需要原地删除其中的重复内容，使每个元素只出现一次,并返回新的长度。
 不要另外定义一个数组，您必须通过用 O(1) 额外内存原地修改输入的数组来做到这一点。
 
 **示例：**
 给定数组: nums = [1,1,2],
 你的函数应该返回新长度 2, 并且原数组nums的前两个元素必须是1和2
 不需要理会新的数组长度后面的元素
 */

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        for index in 0 ..< nums.count {
            while index + 1 < nums.count  && nums[index] == nums[index + 1] {
                nums.remove(at: index)
            }
        }
        return nums.count
    }
}

let solution = Solution()
var array = [1,1,2,3,4]
solution.removeDuplicates(&array)


/*:
 ### 2.将包含 n 个元素的数组向右旋转 k 步。
 例如，如果  n = 7 ,  k = 3，给定数组  [1,2,3,4,5,6,7]  ，向右旋转后的结果为 [5,6,7,1,2,3,4]。
 */
class Solution2 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if k == 0 {
            return
        }
        for _ in 1...k {
            nums.insert(nums.last!, at: 0)
            nums.removeLast()
        }
        print(nums)
    }
}

let solution2 = Solution2()
var array2 = [1]
solution2.rotate(&array2, 0)


/*:
 ### 3.判断是否有重复元素
 */
class Solution3 {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        let tempArray = nums.sorted(){$0 < $1}
        print(tempArray)
        var result = false
        for num in tempArray.enumerated(){
            if num.offset + 1 < tempArray.count && tempArray[num.offset] == tempArray[num.offset + 1] {
                result = true
            }
        }
        return result
    }
}
var array3 = [1,2,3,1,4,2]
Solution3().containsDuplicate(array3)

/*:
 ### 4.找出没有重复的元素
 **要求线性时间复杂度，并且不开创新的空间
 */
class Solution4 {
    func singleNumber(_ nums: [Int]) -> Int {
        
        if nums.count == 1 {return nums.first!}
        
        let temp = nums.sorted(){$0 < $1}
        var index = 0;
        while temp[index] == temp[index + 1] {
            index += 2;
            if index == temp.count - 1{
                break;
            }
        }
        return temp[index];
    }
}

var array4 = [1,2,2,1,3,4,4,5,3]
Solution4().singleNumber(array4)

/*:
 ### 5.给定两个数组，写一个方法来计算它们的交集。
 **例如:**
 给定 nums1 = [1, 2, 2, 1], nums2 = [2, 2], 返回 [2, 2].
 
 **注意：**
 * 输出结果中每个元素出现的次数，应与元素在两个数组中出现的次数一致。
 * 我们可以不考虑输出结果的顺序。
 
 **跟进:**
 * 如果给定的数组已经排好序呢？你将如何优化你的算法？
 * 如果 nums1 的大小比 nums2 小很多，哪种方法更优？
 * 如果nums2的元素存储在磁盘上，内存是有限的，你不能一次加载所有的元素到内存中，你该怎么办？
 */

class Solution5 {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nums1 = nums1
        var arrayTemp = [Int]()
        for index in 0 ..< nums2.count
        {
            for index2 in 0 ..< nums1.count
            {
                if nums2[index] == nums1[index2] {
                    arrayTemp.append(nums1[index2])
                    nums1.remove(at: index2)
                    break
                }
            }
        }
        return arrayTemp
    }
}

Solution5().intersect([1,2,3,4,5], [4,5,6,7])

/*:
 ### 6.给定一个非负整数组成的非空数组，给整数加一。
 * 可以假设整数不包含任何前导零，除了数字0本身。
 * 最高位数字存放在列表的首位。
 */

class Solution6 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result: [Int] = digits
        var i = digits.count - 1
        
        while i >= 0 {
            if result[i] != 9 {
                result[i] += 1
                return result
            } else {
                result[i] = 0
                i -= 1
            }
        }
        
        result.insert(1, at: 0)
        
        return result
    }
}

Solution6().plusOne([1,5])

/*:
 ### 7.给定一个数组 nums, 编写一个函数将所有 0 移动到它的末尾，同时保持非零元素的相对顺序。
 
 例如， 定义 nums = [0, 1, 0, 3, 12]，调用函数之后， nums 应为 [1, 3, 12, 0, 0]。
 
 **注意事项:**
 
 * 必须在原数组上操作，不要为一个新数组分配额外空间。
 * 尽量减少操作总数。
 */

class Solution7 {
    func moveZeroes(_ nums: inout [Int]) {
        if nums.count == 0 {
            return
        }
        for (i,item) in nums.enumerated() {
            if item == 0 || i == 0 {continue}
            
            var j = i - 1
            var index = i
            while j >= 0 {
                if nums[j] == 0 {
                    index = j
                }
                j -= 1
            }
            if index != i
            {
                nums.swapAt(index, i)
            }
        }
        print(nums)
    }
}

var array7 = [1,0,0,0,9]

Solution7().moveZeroes(&array7)

/*:
 ### 8.给定一个整数数列，找出其中和为特定值的那两个数。
 
 你可以假设每个输入都只会有一种答案，同样的元素不能被重用。
 
 示例:
 ```
 给定 nums = [2, 7, 11, 15], target = 9
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 ```
 */

class Solution8 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for index in 0 ..< nums.count - 1
        {
            
            for j in index + 1 ..< nums.count
            {
                if nums[index] + nums[j] == target {
                    return [index,j]
                }
            }
        }
        return []
    }
}

Solution8().twoSum([2,3,4,5,6], 6)

//: [Next](@next)








