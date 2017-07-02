uuid=`grep UUID -A1 -a main.mobileprovision | grep -io "[-A-Z0-9]\{36\}"`
cp main.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/$uuid.mobileprovision

uuid=`grep UUID -A1 -a watchkit.mobileprovision | grep -io "[-A-Z0-9]\{36\}"`
cp watchkit.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/$uuid.mobileprovision

uuid=`grep UUID -A1 -a watchkitext.mobileprovision | grep -io "[-A-Z0-9]\{36\}"`
cp watchkitext.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/$uuid.mobileprovision

uuid=`grep UUID -A1 -a today.mobileprovision | grep -io "[-A-Z0-9]\{36\}"`
cp today.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/$uuid.mobileprovision