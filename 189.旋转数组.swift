/*
 * @lc app=leetcode.cn id=189 lang=swift
 *
 * [189] 旋转数组
 *
 * https://leetcode-cn.com/problems/rotate-array/description/
 *
 * algorithms
 * Medium (43.74%)
 * Likes:    754
 * Dislikes: 0
 * Total Accepted:    186.1K
 * Total Submissions: 424.9K
 * Testcase Example:  '[1,2,3,4,5,6,7]\n3'
 *
 * 给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
 * 
 * 示例 1:
 * 
 * 输入: [1,2,3,4,5,6,7] 和 k = 3
 * 输出: [5,6,7,1,2,3,4]
 * 解释:
 * 向右旋转 1 步: [7,1,2,3,4,5,6]
 * 向右旋转 2 步: [6,7,1,2,3,4,5]
 * 向右旋转 3 步: [5,6,7,1,2,3,4]
 * 
 * 
 * 示例 2:
 * 
 * 输入: [-1,-100,3,99] 和 k = 2
 * 输出: [3,99,-1,-100]
 * 解释: 
 * 向右旋转 1 步: [99,-1,-100,3]
 * 向右旋转 2 步: [3,99,-1,-100]
 * 
 * 说明:
 * 
 * 
 * 尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
 * 要求使用空间复杂度为 O(1) 的 原地 算法。
 * 
 * 
 */

// @lc code=start
class Solution {
    func reverse(_ nums: inout [Int], start: Int, stop: Int) {
        guard start < stop, stop < nums.count else { return }
        var i = start
        var j = stop
        var tmp = nums[i]
        while i < j {
            nums[i] = nums[j]
            nums[j] = tmp
            i += 1
            j -= 1
            tmp = nums[i]
        }
    }
    func rotate(_ nums: inout [Int], _ k: Int) {
        let count = nums.count
        guard count != k else { return }
        let move = k % count
        reverse(&nums, start: 0, stop: count - 1)
        reverse(&nums, start: 0, stop: move - 1)
        reverse(&nums, start: move, stop: count - 1)
    }
}
// @lc code=end

struct Solution1 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        // array left move 1
        func left(_ nums: inout [Int]) {
            let count = nums.count
            guard count > 1 else { return }
            let tmp = nums[count - 1]
            for i in stride(from: count - 1, to: 0, by: -1) {
                nums[i] = nums[i - 1]
            }
            nums[0] = tmp
            print(nums)
        }
        // loop left k time
        for _ in 0..<k {
            left(&nums)
        }
    }
}

var nums1 = [1, 2, 3, 4, 5, 6, 7]
var nums2 = [-1, -100, 3, 99]
var nums3 = [1, 2, 3] // [3,1,2]

let solution = Solution()
print(solution.rotate(&nums1, 3))
print(nums1)
print(solution.rotate(&nums2, 2))
print(nums2)
print(solution.rotate(&nums3, 4))
print(nums3)
