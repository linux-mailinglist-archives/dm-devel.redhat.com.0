Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 452711DEC3C
	for <lists+dm-devel@lfdr.de>; Fri, 22 May 2020 17:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590162011;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nMHNpNBvFAUqsavB4wxS7aiOIFs1Pm9p51osjtcHLJI=;
	b=XNv7d9smLYoX8JG3qu5CUCuWfM8t0c1xq2+N7MA+VjMs/YtYFDDJCAqnKI0VC9yrsuHG9s
	6WFIcBEdABwrvszktl0bOnUIMDFakuVXChCU9BU8Va17mLQOvX0emIn53zmXy64Zon3Xkb
	vsK1Bsa0dfEnGL7+19OZXmcVAzeo9po=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-xJy573rsPOKZgnpLQuo9pA-1; Fri, 22 May 2020 11:40:08 -0400
X-MC-Unique: xJy573rsPOKZgnpLQuo9pA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C2698D8115;
	Fri, 22 May 2020 15:39:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9DFD1059593;
	Fri, 22 May 2020 15:39:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 812C9180954D;
	Fri, 22 May 2020 15:39:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04MFdJfm012638 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 May 2020 11:39:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 185102029F61; Fri, 22 May 2020 15:39:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 127532014DFA
	for <dm-devel@redhat.com>; Fri, 22 May 2020 15:39:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 330FD804026
	for <dm-devel@redhat.com>; Fri, 22 May 2020 15:39:15 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-505-gAkxIBY9P_ayqz_87-ADqQ-1;
	Fri, 22 May 2020 11:39:11 -0400
X-MC-Unique: gAkxIBY9P_ayqz_87-ADqQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 74C4DB20D;
	Fri, 22 May 2020 15:39:12 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Damien LeMoal <damien.lemoal@wdc.com>
Date: Fri, 22 May 2020 17:38:49 +0200
Message-Id: <20200522153901.133375-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH RFC 00/12] dm-zoned: multi-device support
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

on the risk of boring you to death, here's yet another RFC to update
dm-zoned. As it has seen only light testing and has some areas which
need to be improved I'd consider it RFC material.
I'm just putting it out now to get some feedback and get it ready for
the next merge window.

So, this patchset:
- Converts the zone array to using xarray for better scalability
- Separate out shared structures into per-device structure
- Lift the restriction of 2 devices to handle an arbitrary number
  of drives.

With this patchset I'm seeing a performance increase for writes from
an average of 150MB/s (with 2 drives) to 200MB/s (with 3 drives).

Hannes Reinecke (12):
  dm-zoned: add debugging message for reading superblocks
  dm-zoned: convert to xarray
  dm-zoned: use on-stack superblock for tertiary devices
  dm-zoned: secondary superblock must reside on the same devices than
    primary superblock
  dm-zoned: add device pointer to struct dm_zone
  dm-zoned: add metadata pointer to struct dmz_dev
  dm-zoned: add a 'reserved' zone flag
  dm-zoned: move random and sequential zones into struct dmz_dev
  dm-zoned: improve logging messages for reclaim
  dm-zoned: support arbitrary number of devices
  dm-zoned: round-robin load balancer for reclaiming zones
  dm-zoned: per-device reclaim

 drivers/md/dm-zoned-metadata.c | 430 ++++++++++++++++++++++++-----------------
 drivers/md/dm-zoned-reclaim.c  |  85 ++++----
 drivers/md/dm-zoned-target.c   | 172 ++++++++++-------
 drivers/md/dm-zoned.h          |  70 ++++---
 4 files changed, 454 insertions(+), 303 deletions(-)

-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

