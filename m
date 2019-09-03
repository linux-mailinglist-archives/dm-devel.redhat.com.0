Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 31176A692D
	for <lists+dm-devel@lfdr.de>; Tue,  3 Sep 2019 15:02:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77BEE8980F6;
	Tue,  3 Sep 2019 13:02:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7B106012C;
	Tue,  3 Sep 2019 13:02:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 543D624F30;
	Tue,  3 Sep 2019 13:02:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83D22uL006630 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 09:02:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 44D141001B13; Tue,  3 Sep 2019 13:02:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from 10.255.255.10 (ovpn-204-73.brq.redhat.com [10.40.204.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A07B21001B1A;
	Tue,  3 Sep 2019 13:01:53 +0000 (UTC)
Date: Tue, 3 Sep 2019 15:01:50 +0200
From: Karel Zak <kzak@redhat.com>
To: Anatoly Pugachev <matorola@gmail.com>
Message-ID: <20190903130150.iatqincnxf4re7ce@10.255.255.10>
References: <alpine.LRH.2.02.1908291142470.17653@file01.intranet.prod.int.rdu2.redhat.com>
	<20190902105909.ah4pi4nwjefygskd@10.255.255.10>
	<CADxRZqwURQJMCCAkY8TvjBaQnCL9j1AHN3mY6b1q3bN-VCZRyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADxRZqwURQJMCCAkY8TvjBaQnCL9j1AHN3mY6b1q3bN-VCZRyA@mail.gmail.com>
User-Agent: NeoMutt/20180716-1584-710bcd
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: util-linux <util-linux@vger.kernel.org>,
	Heinz Mauelshagen <heinzm@redhat.com>,
	Mike Snitzer <msnitzer@redhat.com>, lvm-devel@redhat.com,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Tue, 03 Sep 2019 13:02:29 +0000 (UTC)

On Tue, Sep 03, 2019 at 03:36:46PM +0300, Anatoly Pugachev wrote:
> On Mon, Sep 2, 2019 at 1:59 PM Karel Zak <kzak@redhat.com> wrote:
> > Applied (with two small fixes), thanks!
> 
> Karel, Mikulas,
> 
> ts/blkid/low-probe started to fail on sparc64 with this patch:
> 
>         blkid: superblocks probing: [97] xfs-log             ... OK
>         blkid: superblocks probing: [98] xfs                 ...
> FAILED (blkid/low-probe-xfs)
> 
> but is "OK" on x86_64.
> 
> $ diff -u expected/blkid/low-probe-xfs output/blkid/low-probe-xfs
> --- expected/blkid/low-probe-xfs        2019-09-03 12:45:18.779505561 +0300
> +++ output/blkid/low-probe-xfs  2019-09-03 14:35:41.569815684 +0300
> @@ -1,4 +1,4 @@
> -ID_FS_BLOCK_SIZE=512
> +ID_FS_BLOCK_SIZE=131072

  blkid_probe_set_block_size(pr, xs->sb_sectsize * 256);

be16_to_cpu() is missing here :-) I'll fix it.

    Karel


>  ID_FS_LABEL=test-xfs
>  ID_FS_LABEL_ENC=test-xfs
>  ID_FS_TYPE=xfs
> 
> $ md5sum output/blkid/images-fs/xfs.img
> c4a59d4039b5ed5557e8502ca2906373  output/blkid/images-fs/xfs.img
> 
> (md5 is the same as on x86_64 test machine)
> 
> You can use gcc202 sparc64 machine from gcc compile farm for the test.
> 
> PS: can someone regenerate xfs.img(xz) with more recent XFS filesystem version?
> 
> $ xfs_info output/blkid/images-fs/xfs.img
> xfs_info: V1 inodes unsupported. Please try an older xfsprogs.

or we need to add another xfs image. I guess we want to support all
versions.

    Karel

-- 
 Karel Zak  <kzak@redhat.com>
 http://karelzak.blogspot.com

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
