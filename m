Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 132F01BE227
	for <lists+dm-devel@lfdr.de>; Wed, 29 Apr 2020 17:11:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588173091;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VNO7nnxUpQwvgltLUm+TksaA+p7bG1+lb2B76Um3Nns=;
	b=W53SQhUPBd2jV/VzrtVXj5w6ld8uo0d9EkwDzPRQkP66UjJZhFlvF/7WQTasvEO/rWaybe
	RYfZ3w+piC3ff0WvYmqSKOx/BZT2TZMtQNAW2GajvQfp1PTGoAYiHev1mmZ9Fhl6p5dk7c
	VO/uArhVRNio4vK/rxg08saIvcXcQuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-lVSKkd-TOCyrkP9mwrBYSA-1; Wed, 29 Apr 2020 11:11:27 -0400
X-MC-Unique: lVSKkd-TOCyrkP9mwrBYSA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0270A100960F;
	Wed, 29 Apr 2020 15:11:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E5765D715;
	Wed, 29 Apr 2020 15:11:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89E261809541;
	Wed, 29 Apr 2020 15:11:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03TF9bKn014485 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 11:09:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 75513282E3; Wed, 29 Apr 2020 15:09:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [192.168.1.10] (unknown [10.40.193.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9812282E2;
	Wed, 29 Apr 2020 15:09:32 +0000 (UTC)
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20200429132140.GA815210@mwanda>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <0aca39de-3efb-e1ce-dfd5-6d3059799bd6@redhat.com>
Date: Wed, 29 Apr 2020 17:09:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429132140.GA815210@mwanda>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [bug report] dm: add emulated block size target
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Thanks for reporting this.

See patch to fix this submitted to dm-devel.

Heinz

On 4/29/20 3:21 PM, Dan Carpenter wrote:
> Hello Heinz Mauelshagen,
>
> The patch d3d11ad3d087: "dm: add emulated block size target" from Mar
> 9, 2020, leads to the following static checker warning:
>
> 	drivers/md/dm-ebs-target.c:190 __ebs_process_bios()
> 	warn: assigning signed to unsigned: 'bio->bi_status = r' '(-4095)-0'
>
> drivers/md/dm-ebs-target.c
>     173                          if (__block_mod(bio_end_sector(bio), ec->u_bs) && block2 != block1)
>     174                                  dm_bufio_prefetch(ec->bufio, block2, 1);
>     175                  }
>     176          }
>     177
>     178          bio_list_for_each(bio, &bios) {
>     179                  r = -EIO;
>     180                  if (bio_op(bio) == REQ_OP_READ)
>     181                          r = __ebs_rw_bio(ec, READ, bio);
>     182                  else if (bio_op(bio) == REQ_OP_WRITE) {
>     183                          write = true;
>     184                          r = __ebs_rw_bio(ec, WRITE, bio);
>     185                  } else if (bio_op(bio) == REQ_OP_DISCARD) {
>     186                          /* FIXME: (optionally) call dm_bufio_discard_buffers() once upstream. */
>     187                          r = __ebs_forget_bio(ec, bio);
>     188                  }
>     189
>     190                  bio->bi_status = r;
>                          ^^^^^^^^^^^^^^^^^^
> "r" is a negative error code and ->bi_status is a u8 so this won't work.
>
>     191          }
>     192
>     193          /*
>     194           * We write dirty buffers after processing I/O on them
>     195           * but before we endio thus addressing REQ_FUA/REQ_SYNC.
>     196           */
>     197          r = write ? dm_bufio_write_dirty_buffers(ec->bufio) : 0;
>
> regards,
> dan carpenter
>
>
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

