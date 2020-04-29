Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C54611BDBFE
	for <lists+dm-devel@lfdr.de>; Wed, 29 Apr 2020 14:24:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588163057;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G9hlNTkt6uBeyIwMkgW9cq4DMhSw10zlT4ul0cqYFfE=;
	b=DgYUxOWpvVS2gq1fajaAlH//OXru0+fjjnBDmT44bvI5UU8HptJu8ZbCQZAH3L1pZUCI8b
	zwnIokwk9R0rVCYwznE6Msm+U/2fU8XqocfJiqkkcmkh/KLPT7hH8wqGR7EZEH5T+/1ExJ
	VQ/Q8WtO7R9U+pRAUzJujQ7jqPDb1ns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-WjET2qeOOSGYnAWFUghmAQ-1; Wed, 29 Apr 2020 08:24:15 -0400
X-MC-Unique: WjET2qeOOSGYnAWFUghmAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73B0946B;
	Wed, 29 Apr 2020 12:24:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D569260C18;
	Wed, 29 Apr 2020 12:24:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 475304E561;
	Wed, 29 Apr 2020 12:23:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03TCNUwL032414 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 08:23:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C1C335D9F1; Wed, 29 Apr 2020 12:23:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [192.168.1.10] (unknown [10.40.193.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D9365D9E5;
	Wed, 29 Apr 2020 12:23:23 +0000 (UTC)
To: Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	dm-devel@redhat.com
References: <d33b3bfb-c38d-9770-e6a6-929519dc21d4@infradead.org>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <980b6b95-6e18-40ff-f71c-058917c5b6ee@redhat.com>
Date: Wed, 29 Apr 2020 14:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d33b3bfb-c38d-9770-e6a6-929519dc21d4@infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH -next] md: dm-ebs-target: fix build errors &
 Kconfig entry
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

On 4/28/20 5:03 PM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix build errors by selecting DM_BUFIO.
>
> Fix Kconfig entry formatting by using tabs instead of spaces,
> using "help" instead of "---help---", and
> indenting help text with one additional space.
>
> Fixes these build errors:
>
> ld: drivers/md/dm-ebs-target.o: in function `__ebs_forget_bio':
> dm-ebs-target.c:(.text+0x1bc): undefined reference to `dm_bufio_forget'
> ld: drivers/md/dm-ebs-target.o: in function `ebs_dtr':
> dm-ebs-target.c:(.text+0x2fe): undefined reference to `dm_bufio_client_destroy'
> ld: drivers/md/dm-ebs-target.o: in function `__ebs_rw_bio':
> dm-ebs-target.c:(.text+0x4c4): undefined reference to `dm_bufio_get_block_size'
> ld: dm-ebs-target.c:(.text+0x4f1): undefined reference to `dm_bufio_read'
> ld: dm-ebs-target.c:(.text+0x504): undefined reference to `dm_bufio_get_block_size'
> ld: dm-ebs-target.c:(.text+0x519): undefined reference to `dm_bufio_new'
> ld: dm-ebs-target.c:(.text+0x567): undefined reference to `dm_bufio_mark_partial_buffer_dirty'
> ld: dm-ebs-target.c:(.text+0x56f): undefined reference to `dm_bufio_release'
> ld: drivers/md/dm-ebs-target.o: in function `__ebs_process_bios':
> dm-ebs-target.c:(.text+0x6bf): undefined reference to `dm_bufio_prefetch'
> ld: dm-ebs-target.c:(.text+0x72d): undefined reference to `dm_bufio_prefetch'
> ld: dm-ebs-target.c:(.text+0x783): undefined reference to `dm_bufio_prefetch'
> ld: dm-ebs-target.c:(.text+0x7fe): undefined reference to `dm_bufio_write_dirty_buffers'
> ld: drivers/md/dm-ebs-target.o: in function `ebs_ctr':
> dm-ebs-target.c:(.text+0xa82): undefined reference to `dm_bufio_client_create'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Heinz Mauelshagen <dm-devel@redhat.com>
> Cc: Alasdair Kergon <agk@redhat.com>
> Cc: Mike Snitzer <snitzer@redhat.com>
> Cc: dm-devel@redhat.com
> ---
>   drivers/md/Kconfig |   12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> --- linux-next-20200428.orig/drivers/md/Kconfig
> +++ linux-next-20200428/drivers/md/Kconfig
> @@ -338,12 +338,12 @@ config DM_WRITECACHE
>   	   to be cached in standard RAM.
>   
>   config DM_EBS
> -       tristate "Emulated block size target (EXPERIMENTAL)"
> -       depends on BLK_DEV_DM
> -       default n
> -       ---help---
> -	 dm-ebs emulates smaller logical block size on backing devices
> -	 with larger ones (e.g. 512 byte sectors on 4K native disks).
> +	tristate "Emulated block size target (EXPERIMENTAL)"
> +	depends on BLK_DEV_DM
> +	select DM_BUFIO
> +	help
> +	  dm-ebs emulates smaller logical block size on backing devices
> +	  with larger ones (e.g. 512 byte sectors on 4K native disks).
>   
>   config DM_ERA
>          tristate "Era target (EXPERIMENTAL)"


Thanks, fine with me for the most part.

We mainly use '---help---' for dm/md though, so lets's keep it. Mike?

Heinz


>
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

