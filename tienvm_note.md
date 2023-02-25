## First thing first
### Ước lượng traffic(trong 5 năm)
- 1B request/tháng
- 10% write, 90% đọc => 100M write, 900M read
  + Số lượng request trong 1s = 1B / (30 * 24 * 3600) ~= 400(40: write, 360: read)
- Số lượng link rút gọn trong 5 năm: 100M * 12months * 5 = 6B URLS
  => Mỗi link rút gọn mất 500 bytes. Dung lượng ổ đĩa lưu trong 5 năm là: 6B * 500 bytes = 3TB
- Ví dụ trong 900M read, chỉ có


## Implementation

### Database
rails g migration AddTableLinks original_url:string short_url:string expiration_date:date
Table: #Links
t.string :original_url
t.string :short_url
t.date :expiration_date

###
- Hash: SecureRandom.base64(6)

encode
decode

def self.shorten(url, slug = '')
  # return short when URL with that slug was created before
  link = Link.where(url: url, slug: slug).first
  return link.short if link

  # create a new
  link = Link.new(url: url, slug: slug)
  return link.short if link.save

  # if slug is taken, try to add random characters
  Link.shorten(url, slug + SecureRandom.uuid[0..2])
end

##
