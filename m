Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 239C0195881
	for <lists+dm-devel@lfdr.de>; Fri, 27 Mar 2020 15:05:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585317923;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K4Rfh3owZ570qdLisPfQBIuwyAd297Z9JDSAdU0Orqo=;
	b=CPhoXL+TzYvAIQUwj2uJ17zfekgddOyMWKyefX/eWfFuDWq1ym6czoViwqlcQ3dQeUvxTa
	jVrFHFpYKpXp2WMmKQ2q7cyvx3olX1TGwbJKv19SG098zUO4DwNPPz6jcK90oWzccfnmnC
	jxMkufMpPT93UdJa7z0H5bWbExhxgpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-D5O-ranSMWWzAnYofHZHxg-1; Fri, 27 Mar 2020 10:05:18 -0400
X-MC-Unique: D5O-ranSMWWzAnYofHZHxg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED275DBA6;
	Fri, 27 Mar 2020 14:05:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39D767E303;
	Fri, 27 Mar 2020 14:05:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31EDC8A055;
	Fri, 27 Mar 2020 14:04:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02RE2csm007358 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 10:02:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E5B982166B2C; Fri, 27 Mar 2020 14:02:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCFB52166B2D
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 14:02:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DAEE101A55F
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 14:02:35 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-139-r4pdUgmaOhWDTZYEm-E6KA-1; Fri, 27 Mar 2020 10:02:32 -0400
X-MC-Unique: r4pdUgmaOhWDTZYEm-E6KA-1
Received: by mail-pj1-f67.google.com with SMTP id l36so3894770pjb.3
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 07:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4xF9pC5rFDYlSc3Jz/RqWebmMskCP81MtAnOQU143cw=;
	b=rSjMPPGJyJs20Z4I2D58V1zKZyOWxgBy3n961ZyouZD5EMr3l52WquKBuFZUnTNUD0
	D46QfXHHPVkQ983DzJKnZwZyvYmyXZsndIpzKL6Hg2m4vDoi9DQa831b/GMgrYNvJ5W1
	cdPCW4fentMrWclzjNbhYUZprLkiKUivxeXpLWApqE5uoqvJ5RxpBBGFKLuo0AFUBhu4
	O8h43yaN6fVJRM6wf1AD8eQyy1NcR+YCVqPLZDDtvQmHW5divq0nSsJY+w5fnFWJ9SIV
	HPfRc/5gio1aF8ROZewmiknAUXT3clP8P2k9N8uwcS8BH71AvXdtr6g2r6LnVo7oLFrW
	xfeA==
X-Gm-Message-State: ANhLgQ1X6UTaf5bwVkl34BjJrb6TGRWttQCqoc1M+SaJ5mcv3tSPRF11
	nLJjAITf/GVncYDfGVpS9XURGA==
X-Google-Smtp-Source: ADFU+vtWCWzrS42Z9HSocQZN/zRp8WCES6NjRSIcuaV9F/Y3XzH93SFLNLYHrp30dOhkZWU2crN/NA==
X-Received: by 2002:a17:90a:ad87:: with SMTP id
	s7mr6141798pjq.52.1585317750773; 
	Fri, 27 Mar 2020 07:02:30 -0700 (PDT)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id l5sm3963399pgt.10.2020.03.27.07.02.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Mar 2020 07:02:30 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com
Date: Fri, 27 Mar 2020 16:01:07 +0200
Message-Id: <20200327140111.7798-1-ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02RE2csm007358
X-loop: dm-devel@redhat.com
Cc: ntsironis@arrikto.com
Subject: [dm-devel] [PATCH 0/4] dm clone: Fix discard handling and overflow
	bugs which could cause data corruption
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is a bug in the way dm-clone handles partial region discards,
which can lead to discarding the wrong blocks or trying to discard
blocks beyond the end of the device.

This could lead to data corruption, if the destination device indeed
discards the underlying blocks, i.e., if the discard operation results
in the original contents of a block to be lost.

The bug manifests when we try to discard part of a single region, i.e.,
when we try to discard a block with size < region_size, and the discard
request both starts at an offset with respect to the beginning of that
region and ends before the end of the region.

The root of the bug is the code that calculates the range of regions
covered by a discard request and decides which regions to discard.

For more information, please see the relevant commit.

As part of fixing this bug, I also audited dm-clone for other
arithmetic/overflow related bugs and found the following:

1. Missing overflow check for the total number of regions
2. Missing casts when converting from regions to sectors
3. Wrong return type of dm_clone_nr_of_hydrated_regions(), which caused
   an unwanted sign extension to occur.

Again, more information can be found in the relevant commits.

Nikos Tsironis (4):
  dm clone: Fix handling of partial region discards
  dm clone: Add overflow check for number of regions
  dm clone: Add missing casts to prevent overflows and data corruption
  dm clone metadata: Fix return type of
    dm_clone_nr_of_hydrated_regions()

 drivers/md/dm-clone-metadata.c | 15 +++++++++-
 drivers/md/dm-clone-metadata.h |  2 +-
 drivers/md/dm-clone-target.c   | 66 ++++++++++++++++++++++++++++++------------
 3 files changed, 62 insertions(+), 21 deletions(-)

-- 
2.11.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

