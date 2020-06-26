Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C7BD420B94F
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 21:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593199774;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lshMbjDBVBZxLEwCur7xNSNEDm/rYM0kuh29fw9dAsk=;
	b=gGisOqbd6WHK1iUPsx1MBqy9F/e3wzXLnAI083VYfHMs7jT8IHt10l/XoxXEZOsXHwJsFM
	5sckmldApIYILU8ajRyev1Cw5zP0zEs88OoVBLncCWftFk/IaMlZZqaRk89exHnISE0iAx
	g7agAxXCWokSmLIdidWnHqW+5sZ6v/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-UWudMif9OA-Mk4hhxegKPQ-1; Fri, 26 Jun 2020 15:29:32 -0400
X-MC-Unique: UWudMif9OA-Mk4hhxegKPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8220D800C60;
	Fri, 26 Jun 2020 19:29:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B47A719C58;
	Fri, 26 Jun 2020 19:29:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF33B875AF;
	Fri, 26 Jun 2020 19:29:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05QJSpuO030729 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jun 2020 15:28:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5D3FD7933C; Fri, 26 Jun 2020 19:28:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AF578202D;
	Fri, 26 Jun 2020 19:28:48 +0000 (UTC)
Date: Fri, 26 Jun 2020 15:28:47 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200626192847.GA11459@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Huaisheng Ye <yehs1@lenovo.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, Hou Tao <houtao1@huawei.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper fixes for 5.8-rc3
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Linus,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.8/dm-fixes

for you to fetch changes up to d35bd764e6899a7bea71958f08d16cea5bfa1919:

  dm writecache: add cond_resched to loop in persistent_memory_claim() (2020-06-19 12:32:24 -0400)

Please pull, thanks!
Mike

----------------------------------------------------------------
- Quite a few DM zoned target fixes and a Zone append fix in DM core.
  Considering the amount of dm-zoned changes that went in during the
  5.8 merge window these fixes are not that surprising.

- A few DM writecache target fixes.

- A fix to Documentation index to include DM ebs target docs.

- Small cleanup to use struct_size() in DM core's retrieve_deps().

----------------------------------------------------------------
Damien Le Moal (2):
      dm zoned: fix uninitialized pointer dereference
      dm zoned: Fix random zone reclaim selection

Gustavo A. R. Silva (1):
      dm ioctl: use struct_size() helper in retrieve_deps()

Hou Tao (1):
      dm zoned: assign max_io_len correctly

Huaisheng Ye (2):
      dm writecache: correct uncommitted_block when discarding uncommitted entry
      dm writecache: skip writecache_wait when using pmem mode

Johannes Thumshirn (1):
      dm: update original bio sector on Zone Append

Mauro Carvalho Chehab (1):
      docs: device-mapper: add dm-ebs.rst to an index file

Mikulas Patocka (1):
      dm writecache: add cond_resched to loop in persistent_memory_claim()

Shin'ichiro Kawasaki (2):
      dm zoned: Fix metadata zone size check
      dm zoned: Fix reclaim zone selection

 Documentation/admin-guide/device-mapper/index.rst |  1 +
 drivers/md/dm-ioctl.c                             |  2 +-
 drivers/md/dm-writecache.c                        | 10 ++++--
 drivers/md/dm-zoned-metadata.c                    | 42 +++++++++++++++++------
 drivers/md/dm-zoned-reclaim.c                     |  4 +--
 drivers/md/dm-zoned-target.c                      |  2 +-
 drivers/md/dm.c                                   | 13 +++++++
 7 files changed, 56 insertions(+), 18 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

