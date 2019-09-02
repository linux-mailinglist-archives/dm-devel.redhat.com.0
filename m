Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B89EA5490
	for <lists+dm-devel@lfdr.de>; Mon,  2 Sep 2019 12:59:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AB4B307D851;
	Mon,  2 Sep 2019 10:59:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A3EC608C1;
	Mon,  2 Sep 2019 10:59:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E0151802218;
	Mon,  2 Sep 2019 10:59:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x82AxIlX025338 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Sep 2019 06:59:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8AE4360600; Mon,  2 Sep 2019 10:59:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from 10.255.255.10 (ovpn-204-73.brq.redhat.com [10.40.204.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E90A8608C1;
	Mon,  2 Sep 2019 10:59:11 +0000 (UTC)
Date: Mon, 2 Sep 2019 12:59:09 +0200
From: Karel Zak <kzak@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20190902105909.ah4pi4nwjefygskd@10.255.255.10>
References: <alpine.LRH.2.02.1908291142470.17653@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.1908291142470.17653@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: NeoMutt/20180716-1584-710bcd
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, dm-devel@redhat.com,
	Heinz Mauelshagen <heinzm@redhat.com>,
	util-linux@vger.kernel.org, lvm-devel@redhat.com,
	Patrick Steinhardt <ps@pks.im>
Subject: Re: [dm-devel] [PATCH] blkid: retport block size of a filesystem
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Mon, 02 Sep 2019 10:59:46 +0000 (UTC)

On Thu, Aug 29, 2019 at 11:52:13AM -0400, Mikulas Patocka wrote:
>  libblkid/src/superblocks/apfs.c        |    2 
>  libblkid/src/superblocks/befs.c        |    3 +
>  libblkid/src/superblocks/btrfs.c       |    1 
>  libblkid/src/superblocks/exfat.c       |    2 
>  libblkid/src/superblocks/exfs.c        |    4 +
>  libblkid/src/superblocks/ext.c         |    3 +
>  libblkid/src/superblocks/f2fs.c        |    2 
>  libblkid/src/superblocks/gfs.c         |    1 
>  libblkid/src/superblocks/hfs.c         |    2 
>  libblkid/src/superblocks/hpfs.c        |    1 
>  libblkid/src/superblocks/iso9660.c     |    2 
>  libblkid/src/superblocks/jfs.c         |    1 
>  libblkid/src/superblocks/minix.c       |    5 ++
>  libblkid/src/superblocks/nilfs.c       |    3 +
>  libblkid/src/superblocks/ntfs.c        |    2 
>  libblkid/src/superblocks/ocfs.c        |    3 +
>  libblkid/src/superblocks/reiserfs.c    |   10 +++-
>  libblkid/src/superblocks/romfs.c       |    3 +
>  libblkid/src/superblocks/squashfs.c    |    2 
>  libblkid/src/superblocks/superblocks.c |    7 +++
>  libblkid/src/superblocks/superblocks.h |    2 
>  libblkid/src/superblocks/udf.c         |    2 
>  libblkid/src/superblocks/ufs.c         |    5 ++
>  libblkid/src/superblocks/vfat.c        |    2 
>  libblkid/src/superblocks/vxfs.c        |   18 +++++++
>  libblkid/src/superblocks/xfs.c         |    1 
>  libblkid/src/superblocks/zfs.c         |   76 ++++++++++++++++++++++++---------
>  27 files changed, 144 insertions(+), 21 deletions(-)

Applied (with two small fixes), thanks!

    Karel

-- 
 Karel Zak  <kzak@redhat.com>
 http://karelzak.blogspot.com

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
