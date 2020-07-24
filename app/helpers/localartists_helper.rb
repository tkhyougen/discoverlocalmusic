module LocalartistsHelper
  def choose_new_or_edit_localartists
    if action_name == 'new' || action_name == "create"
      confirm_localartists_path
    elsif action_name == 'edit'
      localartist_path
    end
  end
end

require 'google/apis/youtube_v3'
require 'active_support/all'

GOOGLE_API_KEY="AIzaSyABBXApRG3M_9A9j4txhZ2yJAdqgpcJWwk"

def find_videos(keyword) #検索キーワードと検索範囲を変えれるように引数に値を取る
  service = Google::Apis::YoutubeV3::YouTubeService.new
  service.key = GOOGLE_API_KEY
  next_page_token = nil
  opt = {
    q: keyword,
    type: 'video',
    max_results: 1,
    order: :viewCount,
    page_token: next_page_token,
    # published_after: after.iso8601,
    # published_before: before.iso8601
  }
  results = service.list_searches(:snippet, opt)
  results.items.each do |item|
    id = item.id
    snippet = item.snippet
    puts "\"#{snippet.title}\" by #{snippet.channel_title} (id: #{id.video_id}) (#{snippet.published_at})"
  end
end
