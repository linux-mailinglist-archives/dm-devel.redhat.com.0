Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 0D58B18A08D
	for <lists+dm-devel@lfdr.de>; Wed, 18 Mar 2020 17:34:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584549299;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jobW9Q09Q7mgMi7TKTeDXBESZmmxssz+voaZNP0qQhM=;
	b=f4WBzUNfJUeLVBXB1EhMeoRJqC/sgYsLXdgNNXwAgLY7Sd///uLyc+tzkjjAFYFLVFDOgx
	ZKwJ+f808W+QvuPl6Heb3NWX/C81htIksUpu55Y8OXqk/GZO74s+QsEE3Bm2bmOCx545yK
	705bDg/B1VyZdWbIhqeo58zhba2H7S0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-CpcsXHXMPH-LDqowZbme1A-1; Wed, 18 Mar 2020 12:34:56 -0400
X-MC-Unique: CpcsXHXMPH-LDqowZbme1A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1168107ACC7;
	Wed, 18 Mar 2020 16:34:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15C571001DC0;
	Wed, 18 Mar 2020 16:34:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2138387007;
	Wed, 18 Mar 2020 16:34:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02IGYN1S025672 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 18 Mar 2020 12:34:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9C310627D8; Wed, 18 Mar 2020 16:34:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9DDD17B91;
	Wed, 18 Mar 2020 16:34:20 +0000 (UTC)
Date: Wed, 18 Mar 2020 12:34:20 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <20200318163419.GA29449@redhat.com>
References: <20200317091212.GA18241@harshini.x.shetty@sony.com>
	<a96e4bee-598f-a565-e9c6-10883d723c9d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a96e4bee-598f-a565-e9c6-10883d723c9d@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: "Takeuchi, Shingo \(SOMC\)" <Shingo.Takeuchi@sony.com>, "Nagaraju,
	Srinavasa \(SOMC\)" <Srinavasa.Nagaraju@sony.com>, "Khasnis,
	Soumya X \(EXT-Sony Mobile\)" <Soumya.Khasnis@sony.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>, "Shetty,
	Harshini X \(EXT-Sony Mobile\)" <Harshini.X.Shetty@sony.com>,
	"Takahashi, Masaya \(SOMC\)" <Masaya.Takahashi@sony.com>,
	"agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] dm verity fec: Fix memory leak in verity_fec_ctr
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Mar 18 2020 at 11:44am -0400,
Heinz Mauelshagen <heinzm@redhat.com> wrote:

> Once we are on this, we should put conditionals on those
> mempool_exit and kmem_cache_destroy
> calls in the fec dtr, because the target calls that destructor at
> any time on its error path thus part
> of the pools or even the cache won't be defined.

Please don't top-post.
kmem_cache_destroy() has a negative check for NULL, so no worries there.

> On 3/17/20 10:15 AM, Shetty, Harshini X (EXT-Sony Mobile) wrote:
> >Fix below kmemleak detected in verity_fec_ctr.
> >output_pool is allocated for each dm-target device.
> >But it is not freed when dm-table for the target
> >is removed.Hence Free the output buffer in destructor
> >function verity_fec_dtr
> >
> >unreferenced object 0xffffffffa574d000 (size 4096):
> >   comm "init", pid 1667, jiffies 4294894890 (age 307.168s)
> >   hex dump (first 32 bytes):
> >     8e 36 00 98 66 a8 0b 9b 00 00 00 00 00 00 00 00  .6..f...........
> >     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >   backtrace:
> >     [<0000000060e82407>] __kmalloc+0x2b4/0x340
> >     [<00000000dd99488f>] mempool_kmalloc+0x18/0x20
> >     [<000000002560172b>] mempool_init_node+0x98/0x118
> >     [<000000006c3574d2>] mempool_init+0x14/0x20
> >     [<0000000008cb266e>] verity_fec_ctr+0x388/0x3b0
> >     [<000000000887261b>] verity_ctr+0x87c/0x8d0
> >     [<000000002b1e1c62>] dm_table_add_target+0x174/0x348
> >     [<000000002ad89eda>] table_load+0xe4/0x328
> >     [<000000001f06f5e9>] dm_ctl_ioctl+0x3b4/0x5a0
> >     [<00000000bee5fbb7>] do_vfs_ioctl+0x5dc/0x928
> >     [<00000000b475b8f5>] __arm64_sys_ioctl+0x70/0x98
> >     [<000000005361e2e8>] el0_svc_common+0xa0/0x158
> >     [<000000001374818f>] el0_svc_handler+0x6c/0x88
> >     [<000000003364e9f4>] el0_svc+0x8/0xc
> >     [<000000009d84cec9>] 0xffffffffffffffff
> >
> >Signed-off-by: Harshini Shetty <harshini.x.shetty@sony.com>
> >---
> >  drivers/md/dm-verity-fec.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> >diff --git a/drivers/md/dm-verity-fec.c b/drivers/md/dm-verity-fec.c
> >index 3ceeb6b..49147e6 100644
> >--- a/drivers/md/dm-verity-fec.c
> >+++ b/drivers/md/dm-verity-fec.c
> >@@ -551,6 +551,7 @@ void verity_fec_dtr(struct dm_verity *v)
> >  	mempool_exit(&f->rs_pool);
> >  	mempool_exit(&f->prealloc_pool);
> >  	mempool_exit(&f->extra_pool);
> >+	mempool_exit(&f->output_pool);
> >  	kmem_cache_destroy(f->cache);
> >  	if (f->data_bufio)
> 

For the benefit of others who might be reviewing:

Seems mempool_destroy() isn't being used because the mempools are members
of struct dm_verity_fec -- so those mempools will never be NULL.

Order of allocation is:
verity_ctr() calls verity_fec_ctr_alloc() to allocate v->fec
verity_parse_opt_arg() calls verity_fec_parse_opt_args() to allocate v->fec->dev
(from that point on verity_fec_is_enabled returnss true)
verity_ctr() calls verity_fec_ctr() which inits all mempools, etc.

destruction is:
verity_dtr() unconditionally calls verity_fec_dtr()
verity_fec_dtr() verifies v->fec->dev exists with verity_fec_is_enabled()

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

