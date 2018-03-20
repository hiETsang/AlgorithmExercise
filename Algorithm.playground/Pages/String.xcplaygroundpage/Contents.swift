//: [Previous](@previous)

//: # 算法练习：字符串部分

import UIKit

/*:
 ### 1.请编写一个函数，其功能是将输入的字符串反转过来。
 
 ```
 输入：s = "hello"
 返回："olleh"
 ```
 */

class Solution1 {
    func reverseString(_ s: String) -> String {
        var str = String()
        for char in s.reversed() {
            str.append(char)
        }
        return str
    }
}

Solution1().reverseString("abcdefg")


/*:
 ### 2.给定一个范围为 32 位 int 的整数，将其颠倒。
 
 ```
 输入: 123
 输出:  321
 
 输入: -123
 输出: -321
 
 输入: 120
 输出: 21
 ```
 
 > 假设我们的环境只能处理 32 位 int 范围内的整数。根据这个假设，如果颠倒后的结果超过这个范围，则返回 0。
 */

class Solution2 {
    func reverse(_ x: Int) -> Int {
        var negative = false
        var number = x
        
        if number < 0{
            negative = true
            number = -number
        }
        
        var str = String()
        for char in String(number).reversed() {
            str.append(char)
        }
        if Int(str)! > 2147483648 {
            return 0
        }
        return negative == true ? -Int(str)! : Int(str)!
    }
}

Solution2().reverse(-1390000)


/*:
 ### 3.给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。
 ```
 s = "leetcode"
 返回 0.
 
 s = "loveleetcode",
 返回 2.
 ```
 
 > 您可以假定该字符串只包含小写字母。
 */
class Solution3 {
    //超出时间限制
    func firstUniqChar(_ s: String) -> Int {
        var i = -1
        for c in s.enumerated() {
            var hasSame = false
            
            for f in s.enumerated() {
                if f.offset == c.offset {continue}
                if s[s.index(s.startIndex, offsetBy: c.offset)] == s[s.index(s.startIndex, offsetBy: f.offset)] {
                    hasSame = true
                    break
                }
            }

            if hasSame == false {
                i = c.offset
                break
            }
            
        }
        return i
    }
    //超出时间限制
    func firstUniqChar2(_ s: String) -> Int {
        var str = s
        var i = -1
        for c in str.enumerated() {
            let char = str.remove(at: str.index(str.startIndex, offsetBy: c.offset))
            if str.contains(char) {
                str.insert(char, at: str.index(str.startIndex, offsetBy: c.offset))
            }else
            {
                i = c.offset
                break
            }
        }
        return i
    }
}

Solution3().firstUniqChar2("leelo")

/*:
 ### 4.给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的一个字母异位词。
 ```
 s = "anagram"，t = "nagaram"，返回 true
 s = "rat"，t = "car"，返回 false
 ```
 
 > 假定字符串只包含小写字母。
 > 输入的字符串包含 unicode 字符怎么办？你能能否调整你的解法来适应这种情况？
 */
class Solution4 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var array1 = [Character]()
        var array2 = [Character]()
        s.forEach { (c) in
            array1.append(c)
        }
        t.forEach { (k) in
            array2.append(k)
        }
        
        return array1.sorted(){$0 < $1} == array2.sorted(){$0 < $1}
    }
}

Solution4().isAnagram("asdfgh", "sdfghaa")


/*:
 ### 5.给定一个字符串，确定它是否是回文，只考虑字母数字字符和忽略大小写。
 ```
 "A man, a plan, a canal: Panama" 是回文字符串。
 "race a car" 不是回文字符串。
 ```
 
 > 针对此题目，我们将空字符串定义为有效的回文字符串。
 */

/*:
 思路：
 1. 去除其他字符，只留大小写
 2. 全部转换成小写
 3. 循环判断是否是回文
 */
class Solution5 {
    func isPalindrome(_ s: String) -> Bool {
        var str = s
        for char in s.utf8.enumerated() {
            guard (char > 64 && char < 91) || (char > 96 && char < 123) else {
                str.remove(at: str.index(<#T##i: String.Index##String.Index#>, offsetBy: <#T##String.IndexDistance#>))
            }
        }
    }
}





//: [Next](@next)
