import java.util.HashMap;
import java.util.Map;

class Solution {
    public int lengthOfLongestSubstring(String s) {
        // Map to store characters and their most recent index
        Map<Character, Integer> map = new HashMap<>();
        int maxLength = 0;
        int left = 0; // Left pointer of the window

        // Loop through the string with the right pointer
        for (int right = 0; right < s.length(); right++) {
            char currentChar = s.charAt(right);

            // If the character is already in the map, shrink the window from the left
            if (map.containsKey(currentChar)) {
                // Move left pointer to the right of the duplicate character's last seen index
                left = Math.max(left, map.get(currentChar) + 1);
            }

            // Update or add the character's current index in the map
            map.put(currentChar, right);

            // Calculate the max length of the window
            maxLength = Math.max(maxLength, right - left + 1);
        }

        return maxLength;
    }
}
