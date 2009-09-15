Feature: Use step definitions generated by factories

  Scenario: create a post and verify its attributes
    Given the following post exists:
      | Title       | Body                |
      | a fun title | here is the content |
    Then I should find the following for the last post:
      | title       | body                |
      | a fun title | here is the content |

  Scenario: create several posts
    Given the following posts exist:
      | Title | Body   |
      | one   | first  |
      | two   | second |
      | three | third  |
    Then I should find the following for the last post:
      | title | body  |
      | three | third |
    And there should be 3 posts

  Scenario: create a post with a new author
    Given the following post exists:
      | Title   | Author   |
      | a title | ID: 123  |
    Then I should find the following for the last post:
      | title   | author_id |
      | a title | 123       |
    And I should find the following for the last user:
      | id  |
      | 123 |

  Scenario: create a post with an existing author
    Given the following user exists:
      | ID  | Name |
      | 123 | Joe  |
    And the following post exists:
      | Title   | Author    |
      | a title | Name: Joe |
    Then I should find the following for the last post:
      | title   | author_id |
      | a title | 123       |
    And there should be 1 user