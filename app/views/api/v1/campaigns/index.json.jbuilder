#json.array! ->creates array-> []
#[ {title: "..."}, {title: "..."} ]

json.array! @campaigns do |campaign|

  json.title campaigns.title
  json.details campaign.details
end
