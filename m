Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C95471D0992
	for <lists+dm-devel@lfdr.de>; Wed, 13 May 2020 09:08:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589353725;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=40AtQeSCgWAoSj+dLNaIzRM2pLAOL/tCP0g+qqtCmRs=;
	b=UYwrF6iSR/1X9RATqs7pyZqUG3BrUjo2p/8oQgAmzWzsMjjlHKPuBWuGOothEeq8gDx1mI
	jP5sTsDV6H9et3OEtodI+hJxENG6cGdMOLeWBexMNU9gnNK+Th5qBKY6+AlxUzzJ1atD+0
	s44G1SM5+TZem+w4VZYOqn5zLSnvNqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-xFtXYSODOZ-7hCN2_nfysA-1; Wed, 13 May 2020 03:08:43 -0400
X-MC-Unique: xFtXYSODOZ-7hCN2_nfysA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EA4A18FE866;
	Wed, 13 May 2020 07:08:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E7445C3E7;
	Wed, 13 May 2020 07:08:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C1414CAA0;
	Wed, 13 May 2020 07:08:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04D77gdM025856 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 03:07:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 51C1C112314; Wed, 13 May 2020 07:07:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E006115DFA
	for <dm-devel@redhat.com>; Wed, 13 May 2020 07:07:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 988C1185A78B
	for <dm-devel@redhat.com>; Wed, 13 May 2020 07:07:39 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-459-f6m6dJbJPPa5s-qbmEmhWA-1;
	Wed, 13 May 2020 03:07:35 -0400
X-MC-Unique: f6m6dJbJPPa5s-qbmEmhWA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 42524B077;
	Wed, 13 May 2020 07:07:36 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Wed, 13 May 2020 09:07:27 +0200
Message-Id: <20200513070729.71461-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 0/2] dm-zoned: improve cache performance
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

here are two patches to improve performance when a regular device
is specified for dm-zoned.
Damien noted that we have a performance drop after the zones on the
regular device are used up, as then the random zones on the zoned
device are being used, _and_ reclaim is running on the same disk.
This slows down I/O whle using random zones, increasing again after
the random zones are used up.
This patchset fixes this by not allowing random zones for caching
if a regular device is present.

Patch is relative to the dm-5.8 branch from
git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git

As usual, comments and reviews are welcome.


Hannes Reinecke (2):
  dm-zoned: invert zone check in dmz_reset_zone()
  dm-zoned: split off random and cache zones

 .../admin-guide/device-mapper/dm-zoned.rst    |  17 +-
 drivers/md/dm-zoned-metadata.c                | 157 +++++++++++++-----
 drivers/md/dm-zoned-reclaim.c                 |  70 ++++----
 drivers/md/dm-zoned-target.c                  |  19 ++-
 drivers/md/dm-zoned.h                         |   7 +-
 5 files changed, 189 insertions(+), 81 deletions(-)

-- 
2.25.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

