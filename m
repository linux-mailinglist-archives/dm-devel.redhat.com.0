Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id AC4E418F820
	for <lists+dm-devel@lfdr.de>; Mon, 23 Mar 2020 16:04:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584975871;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C7lYmdKsUIbonnv/OwSKwwZu9bTPD67U1FTLB2FK7WI=;
	b=cDWpUVYuEqLQP4h/A0yNEP+XPfmsmZcGTKPJqwzRWEVp7Ug/gmwHgDO3LYRNcn3WUhcCMF
	N1gBXOFaPmzxWnc7YomDQ9cWt8tboDhE4b6PRKUhXrQGZMjavYblsXqC4+/RwYA74um/Z6
	SQPvMegoiF1Xn/9f65Nahnedwyd8JHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-bIcx9DPQNFiYDngTrYbglg-1; Mon, 23 Mar 2020 11:04:27 -0400
X-MC-Unique: bIcx9DPQNFiYDngTrYbglg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E340149C0;
	Mon, 23 Mar 2020 15:04:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B13E45C1B2;
	Mon, 23 Mar 2020 15:04:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0896918089CE;
	Mon, 23 Mar 2020 15:04:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02NF46ol001636 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Mar 2020 11:04:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D75692026D68; Mon, 23 Mar 2020 15:04:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D391D2037E43
	for <dm-devel@redhat.com>; Mon, 23 Mar 2020 15:04:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E63080029B
	for <dm-devel@redhat.com>; Mon, 23 Mar 2020 15:04:04 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-223-L1hRlb4aMKyyg_wZrSTKMA-1;
	Mon, 23 Mar 2020 11:04:01 -0400
X-MC-Unique: L1hRlb4aMKyyg_wZrSTKMA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 061BCAD12;
	Mon, 23 Mar 2020 15:03:59 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Damien LeMoal <damien.lemoal@wdc.com>
Date: Mon, 23 Mar 2020 16:03:50 +0100
Message-Id: <20200323150352.107826-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02NF46ol001636
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Johannes Thumshirn <jth@kernel.org>,
	Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH RFC 0/2] dm-zoned: add cache device
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

Hi Damien,

as my original plan to upgrade bcache to work for SMR devices
turned out to be more complex than anticipated I went for the
simpler approach and added a 'cache' device for dm-zoned.
It is using a normal device (eg '/dev/pmem0' :-), split it
into zones of the same size of the original SMR device, and
makes those 'virtual' zones avialable to dm-zoned in a similar
manner than the existing 'random write' zoned.

The implementation is still a bit rough (one would need to add
metadata to the cache device, too), but so far it seems to work
quite well; still running after copying 300GB of data back and forth.

As usual, comments and reviews are welcome.

Hannes Reinecke (2):
  dm-zoned: cache device for zones
  dm-zoned: add 'status' and 'message' callbacks

 drivers/md/dm-zoned-metadata.c | 189 +++++++++++++++++++++++++++++----
 drivers/md/dm-zoned-reclaim.c  |  76 ++++++++++---
 drivers/md/dm-zoned-target.c   | 159 ++++++++++++++++++++++++---
 drivers/md/dm-zoned.h          |  34 +++++-
 4 files changed, 407 insertions(+), 51 deletions(-)

-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

