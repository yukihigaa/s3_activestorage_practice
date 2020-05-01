class Tweet < ApplicationRecord

    has_many_attached :images
    validate :chack_content_type

    def chack_content_type
        return '' unless images.attached?
        images.each do |image|
            if !image.content_type.in?(%('image/jpeg image/png'))
                image.purge
                errors.add(:images, '画像ファイルしかアップできません')
            end
        end
    end

end
