Prepare a service that will implement a simple Course enrollment feature

### Data Model
There are two entities:
- User (id, email)
- Course (id, name)

A User can be enrolled to many Courses

### API
The service should expose a public REST JSON API with the following endpoints for:
- creating a User
- creating a Course
- deleting a User
- deleting a Course
- enrolling a User in a Course
- withdraw a User's enrollment from a Course
- fetching the Courses that a User is enrolled to
- fetching list of Courses with the number of enrollments for each Course

### Delivery
The solution should be:
- delivered using Docker, i. e. the service should have a Dockerfile and should use Docker Compose if any third-party resources are required (for example, a DB)
- pushed to a Github Repository
