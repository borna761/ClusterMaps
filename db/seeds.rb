# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActivityType.delete_all
ActivityType.create(:name => 'Children\'s Class', :icon => 'childrenClasses')
ActivityType.create(:name => 'Devotional Meeting', :icon => 'devotionalMeetings')
ActivityType.create(:name => 'Junior Youth Group', :icon => 'juniorYouthGroups')
ActivityType.create(:name => 'Study Circle', :icon => 'studyCircles')
Cluster.delete_all
Cluster.create(:name => 'Test Cluster');
