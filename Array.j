class Solution {
    public double findMedianSortedArrays(int[] nums1, int[] nums2) {
        // Ensure nums1 is the smaller array to minimize the binary search range
        if (nums1.length > nums2.length) {
            return findMedianSortedArrays(nums2, nums1);
        }
        
        int m = nums1.length;
        int n = nums2.length;
        int low = 0;
        int high = m;
        
        while (low <= high) {
            // Partition point for nums1
            int partitionX = (low + high) / 2;
            // Partition point for nums2 derived from total half length
            int partitionY = (m + n + 1) / 2 - partitionX;
            
            // If partitionX is 0, nothing is on the left side of nums1. Use -Infinity
            // If partitionX is m, nothing is on the right side of nums1. Use +Infinity
            int maxLeftX = (partitionX == 0) ? Integer.MIN_VALUE : nums1[partitionX - 1];
            int minRightX = (partitionX == m) ? Integer.MAX_VALUE : nums1[partitionX];
            
            int maxLeftY = (partitionY == 0) ? Integer.MIN_VALUE : nums2[partitionY - 1];
            int minRightY = (partitionY == n) ? Integer.MAX_VALUE : nums2[partitionY];
            
            // Check if we found the correct partition
            if (maxLeftX <= minRightY && maxLeftY <= minRightX) {
                // If total number of elements is odd
                if ((m + n) % 2 == 1) {
                    return Math.max(maxLeftX, maxLeftY);
                } 
                // If total number of elements is even
                else {
                    return (Math.max(maxLeftX, maxLeftY) + Math.min(minRightX, minRightY)) / 2.0;
                }
            } 
            // We are too far right in nums1, move left
            else if (maxLeftX > minRightY) {
                high = partitionX - 1;
            } 
            // We are too far left in nums1, move right
            else {
                low = partitionX + 1;
            }
        }
        
        throw new IllegalArgumentException("Input arrays are not sorted properly.");
    }
}
