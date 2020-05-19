Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F059A1D91DF
	for <lists+dm-devel@lfdr.de>; Tue, 19 May 2020 10:15:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589876119;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H+NMoKg6IompKthYqwaD+cIGylgYacyOpPnmHafI6kA=;
	b=CkElcT8/MT680UP1ZknC/z9JoC4pczwwT4JGyz01Ur9x76oehllGZ1uDN03dALOdFKwu0Z
	xFURucd4UadN+YOmw7UkguS4AqTnAdS8k0Gql4cn+fmtyl4kgK3i6UrmYAVYTrQGXWLL6u
	rK15nHGUdqgILnzMJ+mKskwe2F0GMIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500--HJhF9ARNbmvvqheQVcyXw-1; Tue, 19 May 2020 04:15:16 -0400
X-MC-Unique: -HJhF9ARNbmvvqheQVcyXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CCE4107ACF6;
	Tue, 19 May 2020 08:15:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDD955C1BB;
	Tue, 19 May 2020 08:15:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 906E41809543;
	Tue, 19 May 2020 08:15:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04J8EmkJ030940 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 04:14:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D920942ACB; Tue, 19 May 2020 08:14:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D54AF5AB89
	for <dm-devel@redhat.com>; Tue, 19 May 2020 08:14:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8D698007C8
	for <dm-devel@redhat.com>; Tue, 19 May 2020 08:14:46 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-191-y7na1AYTPhijKROgV1CB7Q-1;
	Tue, 19 May 2020 04:14:42 -0400
X-MC-Unique: y7na1AYTPhijKROgV1CB7Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 91854AFD4;
	Tue, 19 May 2020 08:14:43 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Tue, 19 May 2020 10:14:18 +0200
Message-Id: <20200519081424.103318-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCHv2 0/6] dm-zoned: improve cache performance
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

here's an update to dm-zoned to separate out cache zones.
In the update to metadata version 2 the regular drive was split
in emulated zones, which were handled just like 'normal' random
write zones.
This causes a performance drop once these emulated zones have
been mapped, as typicall the random zones from the zoned drive
will perform noticeably slower than those from the regular drive.
(After all, that was kinda the idea of using a regular disk in
the first place ...)

So in this patchset I've introduced a separate 'cache' zone type,
allowing us to differentiate between emulated and real zones.
With that we can switch the allocation mode to use only cache
zones, and use random zones similar to sequential write zones.
That avoids the performance issue noted above.

I've also found that the sequential write zones perform noticeably
better on writes (which is all we're caching anyway), so I've
added another patch switching the allocation routine from preferring
sequential write zones for reclaim.

This patchset also contains some minor fixes like remving an unused
variable etc.

As usual, comments and reviews are welcome.

Changes to v1:
- Include reviews from Damien
- Introduce allocation flags
- Terminate reclaim on contention
- Rework original patch series

Hannes Reinecke (6):
  dm-zoned: return NULL if dmz_get_zone_for_reclaim() fails to find a
    zone
  dm-zoned: separate random and cache zones
  dm-zoned: reclaim random zones when idle
  dm-zoned: start reclaim with sequential zones
  dm-zoned: terminate reclaim on congestion
  dm-zoned: remove unused variable in dmz_do_reclaim()

 drivers/md/dm-zoned-metadata.c | 140 ++++++++++++++++++++++++++++++-----------
 drivers/md/dm-zoned-reclaim.c  | 109 ++++++++++++++++++++------------
 drivers/md/dm-zoned-target.c   |  19 ++++--
 drivers/md/dm-zoned.h          |  13 +++-
 4 files changed, 196 insertions(+), 85 deletions(-)

-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

