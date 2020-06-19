Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B6DBF201847
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 18:56:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592585774;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MUgRlVdOWggjOKRjFEPokUjZh8A4PcB/iIxbCjadh6I=;
	b=Jt297gSPLRcqpP4vBnU1Gr+9t8rXfYaBrjjV3UXf+zEbP9pNZM7Q4J+4GuZWaN+xYDBEp+
	mdsDmjXpSaS3EXVHg+KSlp5zIZq4YlEQ/KubPrahrC8PyFuBqOwWdQK+H7aFqgRbuCZRtI
	3i/igXN368Zsr+bk9zVPZwL9aJN5NxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-NpwpienHOsOLeXhfWZcJbQ-1; Fri, 19 Jun 2020 12:56:08 -0400
X-MC-Unique: NpwpienHOsOLeXhfWZcJbQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C22E67BB0;
	Fri, 19 Jun 2020 16:56:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 554E819D9E;
	Fri, 19 Jun 2020 16:56:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BAEBD833C9;
	Fri, 19 Jun 2020 16:55:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JGtrVh032412 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 12:55:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 193B85D9EF; Fri, 19 Jun 2020 16:55:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11F445D9E5;
	Fri, 19 Jun 2020 16:55:50 +0000 (UTC)
Date: Fri, 19 Jun 2020 12:55:49 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Ignat Korchagin <ignat@cloudflare.com>,
	Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200619165548.GA24779@redhat.com>
References: <20200619164132.1648-1-ignat@cloudflare.com>
MIME-Version: 1.0
In-Reply-To: <20200619164132.1648-1-ignat@cloudflare.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-crypt@saout.de, dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	agk@redhat.com, kernel-team@cloudflare.com
Subject: Re: [dm-devel] [RFC PATCH 0/1] dm-crypt excessive overhead
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

On Fri, Jun 19 2020 at 12:41pm -0400,
Ignat Korchagin <ignat@cloudflare.com> wrote:

> This is a follow up from the long-forgotten [1], but with some more convincing
> evidence. Consider the following script:
> 
> #!/bin/bash -e
> 
> # create 4G ramdisk
> sudo modprobe brd rd_nr=1 rd_size=4194304
> 
> # create a dm-crypt device with NULL cipher on top of /dev/ram0
> echo '0 8388608 crypt capi:ecb(cipher_null) - 0 /dev/ram0 0' | sudo dmsetup create eram0
> 
> # create a dm-crypt device with NULL cipher and custom force_inline flag
> echo '0 8388608 crypt capi:ecb(cipher_null) - 0 /dev/ram0 0 1 force_inline' | sudo dmsetup create inline-eram0
> 
> # read all data from /dev/ram0
> sudo dd if=/dev/ram0 bs=4k iflag=direct | sha256sum
> 
> # read the same data from /dev/mapper/eram0
> sudo dd if=/dev/mapper/eram0 bs=4k iflag=direct | sha256sum
> 
> # read the same data from /dev/mapper/inline-eram0
> sudo dd if=/dev/mapper/inline-eram0 bs=4k iflag=direct | sha256sum
> 
> This script creates a ramdisk (to eliminate hardware bias in the benchmark) and
> two dm-crypt instances on top. Both dm-crypt instances use the NULL cipher
> to eliminate potentially expensive crypto bias (the NULL cipher just uses memcpy
> for "encyption"). The first instance is the current dm-crypt implementation from
> 5.8-rc1, the second is the dm-crypt instance with a custom new flag enabled from
> the patch attached to this thread. On my VM (Debian in VirtualBox with 4 cores
> on 2.8 GHz Quad-Core Intel Core i7) I get the following output (formatted for
> better readability):
> 
> # plain ram0
> 1048576+0 records in
> 1048576+0 records out
> 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 21.2305 s, 202 MB/s
> 8479e43911dc45e89f934fe48d01297e16f51d17aa561d4d1c216b1ae0fcddca  -
> 
> # eram0 (current dm-crypt)
> 1048576+0 records in
> 1048576+0 records out
> 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 53.2212 s, 80.7 MB/s
> 8479e43911dc45e89f934fe48d01297e16f51d17aa561d4d1c216b1ae0fcddca  -
> 
> # inline-eram0 (patched dm-crypt)
> 1048576+0 records in
> 1048576+0 records out
> 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 21.3472 s, 201 MB/s
> 8479e43911dc45e89f934fe48d01297e16f51d17aa561d4d1c216b1ae0fcddca  -
> 
> As we can see, current dm-crypt implementation creates a significant IO
> performance overhead (at least on small IO block sizes) for both latency and
> throughput. We suspect offloading IO request processing into workqueues and
> async threads is more harmful these days with the modern fast storage. I also
> did some digging into the dm-crypt git history and much of this async processing
> is not needed anymore, because the reasons it was added are mostly gone from the
> kernel. More details can be found in [2] (see "Git archeology" section).
> 
> We have been running the attached patch on different hardware generations in
> more than 200 datacentres on both SATA SSDs and NVME SSDs and so far were very
> happy with the performance benefits.
> 
> [1]: https://www.spinics.net/lists/dm-crypt/msg07516.html
> [2]: https://blog.cloudflare.com/speeding-up-linux-disk-encryption/
> 
> Ignat Korchagin (1):
>   Add DM_CRYPT_FORCE_INLINE flag to dm-crypt target
> 
>  drivers/md/dm-crypt.c | 55 +++++++++++++++++++++++++++++++++----------
>  1 file changed, 43 insertions(+), 12 deletions(-)
> 
> -- 
> 2.20.1
> 

Hi,

I saw [2] and have been expecting something from cloudflare ever since.
Nice to see this submission.

There is useful context in your 0th patch header.  I'll likely merge
parts of this patch header with the more terse 1/1 header (reality is
there only needed to be a single patch submission).

Will review and stage accordingly if all looks fine to me.  Mikulas,
please have a look too.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

