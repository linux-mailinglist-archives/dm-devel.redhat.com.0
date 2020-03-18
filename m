Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id D8DC6189FE5
	for <lists+dm-devel@lfdr.de>; Wed, 18 Mar 2020 16:45:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584546325;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s7EDVxVOd0fG5R8zY5Y4/5mzNroGeYwvcGSeU8Y5EAg=;
	b=ImY9/z+gM0vW7xx1YULFgU21Fe+pVjxD8g64hlp6kXxywEU6TrB/Sjoxl013U72qMpSrtM
	oxlsWBom/YT4RE7wFi94BecPsx9s4D/RF2IXZ/+0JLSeMnJbqrLkGTgSQAjWRgGylQ8HCZ
	1bpdAaYRepKDJQN1mx+GfpJY+ooq1gU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-8F8kAgOZPkq17mbRWEkuoA-1; Wed, 18 Mar 2020 11:45:23 -0400
X-MC-Unique: 8F8kAgOZPkq17mbRWEkuoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A9331005513;
	Wed, 18 Mar 2020 15:45:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D059360C18;
	Wed, 18 Mar 2020 15:45:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFD3518034EA;
	Wed, 18 Mar 2020 15:44:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02IFieCP022732 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 18 Mar 2020 11:44:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2ED4C5C1A8; Wed, 18 Mar 2020 15:44:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [192.168.1.10] (unknown [10.40.192.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25CEC5C1A0;
	Wed, 18 Mar 2020 15:44:28 +0000 (UTC)
To: "Shetty, Harshini X (EXT-Sony Mobile)" <Harshini.X.Shetty@sony.com>,
	"agk@redhat.com" <agk@redhat.com>, "snitzer@redhat.com"
	<snitzer@redhat.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
References: <20200317091212.GA18241@harshini.x.shetty@sony.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <a96e4bee-598f-a565-e9c6-10883d723c9d@redhat.com>
Date: Wed, 18 Mar 2020 16:44:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200317091212.GA18241@harshini.x.shetty@sony.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: "Takeuchi, Shingo \(SOMC\)" <Shingo.Takeuchi@sony.com>, "Khasnis,
	Soumya X \(EXT-Sony Mobile\)" <Soumya.Khasnis@sony.com>,
	"Nagaraju, Srinavasa \(SOMC\)" <Srinavasa.Nagaraju@sony.com>,
	"Takahashi, Masaya \(SOMC\)" <Masaya.Takahashi@sony.com>
Subject: Re: [dm-devel] [PATCH] dm verity fec: Fix memory leak in
 verity_fec_ctr
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Once we are on this, we should put conditionals on those mempool_exit 
and kmem_cache_destroy
calls in the fec dtr, because the target calls that destructor at any 
time on its error path thus part
of the pools or even the cache won't be defined.

Heinz

On 3/17/20 10:15 AM, Shetty, Harshini X (EXT-Sony Mobile) wrote:
> Fix below kmemleak detected in verity_fec_ctr.
> output_pool is allocated for each dm-target device.
> But it is not freed when dm-table for the target
> is removed.Hence Free the output buffer in destructor
> function verity_fec_dtr
>
> unreferenced object 0xffffffffa574d000 (size 4096):
>    comm "init", pid 1667, jiffies 4294894890 (age 307.168s)
>    hex dump (first 32 bytes):
>      8e 36 00 98 66 a8 0b 9b 00 00 00 00 00 00 00 00  .6..f...........
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>    backtrace:
>      [<0000000060e82407>] __kmalloc+0x2b4/0x340
>      [<00000000dd99488f>] mempool_kmalloc+0x18/0x20
>      [<000000002560172b>] mempool_init_node+0x98/0x118
>      [<000000006c3574d2>] mempool_init+0x14/0x20
>      [<0000000008cb266e>] verity_fec_ctr+0x388/0x3b0
>      [<000000000887261b>] verity_ctr+0x87c/0x8d0
>      [<000000002b1e1c62>] dm_table_add_target+0x174/0x348
>      [<000000002ad89eda>] table_load+0xe4/0x328
>      [<000000001f06f5e9>] dm_ctl_ioctl+0x3b4/0x5a0
>      [<00000000bee5fbb7>] do_vfs_ioctl+0x5dc/0x928
>      [<00000000b475b8f5>] __arm64_sys_ioctl+0x70/0x98
>      [<000000005361e2e8>] el0_svc_common+0xa0/0x158
>      [<000000001374818f>] el0_svc_handler+0x6c/0x88
>      [<000000003364e9f4>] el0_svc+0x8/0xc
>      [<000000009d84cec9>] 0xffffffffffffffff
>
> Signed-off-by: Harshini Shetty <harshini.x.shetty@sony.com>
> ---
>   drivers/md/dm-verity-fec.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/md/dm-verity-fec.c b/drivers/md/dm-verity-fec.c
> index 3ceeb6b..49147e6 100644
> --- a/drivers/md/dm-verity-fec.c
> +++ b/drivers/md/dm-verity-fec.c
> @@ -551,6 +551,7 @@ void verity_fec_dtr(struct dm_verity *v)
>   	mempool_exit(&f->rs_pool);
>   	mempool_exit(&f->prealloc_pool);
>   	mempool_exit(&f->extra_pool);
> +	mempool_exit(&f->output_pool);
>   	kmem_cache_destroy(f->cache);
>   
>   	if (f->data_bufio)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

