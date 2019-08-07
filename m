Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E214185680
	for <lists+dm-devel@lfdr.de>; Thu,  8 Aug 2019 01:33:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4295B307D88C;
	Wed,  7 Aug 2019 23:33:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2399860852;
	Wed,  7 Aug 2019 23:33:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1108618005B9;
	Wed,  7 Aug 2019 23:33:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x77NWnPo029619 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 7 Aug 2019 19:32:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 65CB6166BB; Wed,  7 Aug 2019 23:32:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF57B19C7F;
	Wed,  7 Aug 2019 23:32:42 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E14203002953;
	Wed,  7 Aug 2019 23:32:41 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p13so18424409wru.10;
	Wed, 07 Aug 2019 16:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=d9pVbIpLJvYHpW51yLVzRoQLiv107x9ELi8HQ3TSd7g=;
	b=nIrYsSA3nPN1wHjF5rjTY4bWCaUPRftz1QKySm1Ov2giKzvoKNJ+OY8RqOEGX6m1y3
	M8gnhSm+hO/g5l6KBBvUzCENROH09mk8YDGCcuFDViTP8FSysKLVdj7EymmHbmUAkCIH
	fk4Qm1eM33fFaHywCfXlYO7RhA4McjuVM8wOZFD1pFY8mEzGtIiLW97KjvgSz1iE4cqb
	EQYEtQjbch2N8MvmRrlWVI3KDbcOqEYoPQLHEjEGFWj7YfMrYd27F+KBvn01KzpElFNc
	e+w62LitUTP8quCKbnlUzWRN9iGhPZs4Qz7Kw/R7ZIjNLE7NCOA2fc8eDWJyoytPiB4W
	cI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=d9pVbIpLJvYHpW51yLVzRoQLiv107x9ELi8HQ3TSd7g=;
	b=runnVESkoxy/06+BxqAAl3FxE2TFxJSfruUB6AzKPZ3dQR96RbnzlE/0PL0AknLqrA
	RRP+euzMVKJTkb4t514W7jAtJeIIrvxMnoEV9w1reBQvLpp8k24lEkQpBGymYSMbk+Sk
	uyf/9QspbAkNgZisXaiB6K7Jhvb7pQnLdBwbXaxH3Kf9lCshiGuXZ600UEXy6tNDq58c
	2EcW8nIe5+d4pYhGh1vzPkaWTzrrprsQ/H7bj2NQjlpUH/sHjezUrfVaAen64ZmkKk7q
	Bi4PpIzzph5faCI+GzKrdx7DCV/rXacog/NZIYiHp9MbDmgwH4+trLPtYuK3CzxlBepF
	89SQ==
X-Gm-Message-State: APjAAAVNJmtNYU60l+1uElvHEsaofL6eNtIbGatJ9DP/JA8TSl5AiBCD
	gEK2IZIUah8HEHBPOY7u448eoSXNZCXNgBriht8=
X-Google-Smtp-Source: APXvYqxtF8Xvm+tm4IZuVjVZGBCJtz7+06a5/1hAvnnEAxC6bsAXdJ7lSoaNNZISpWZcktt+oPMXhYhpd+tpojMOPr8=
X-Received: by 2002:adf:f088:: with SMTP id n8mr13044701wro.58.1565220760576; 
	Wed, 07 Aug 2019 16:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190807144948.28265-1-maier@linux.ibm.com>
	<20190807144948.28265-2-maier@linux.ibm.com>
In-Reply-To: <20190807144948.28265-2-maier@linux.ibm.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Thu, 8 Aug 2019 07:32:29 +0800
Message-ID: <CACVXFVM0tFj8CmcHON04_KjxR=QErCbUx0abJgG2W9OBb7akZA@mail.gmail.com>
To: Steffen Maier <maier@linux.ibm.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 07 Aug 2019 23:32:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Wed, 07 Aug 2019 23:32:42 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'tom.leiming@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <tom.leiming@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390 <linux-s390@vger.kernel.org>,
	Benjamin Block <bblock@linux.ibm.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Linux SCSI List <linux-scsi@vger.kernel.org>,
	"James E . J . Bottomley" <jejb@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Hannes Reinecke <hare@suse.com>, "Ewan D . Milne" <emilne@redhat.com>,
	Ming Lei <ming.lei@redhat.com>, linux-block <linux-block@vger.kernel.org>,
	"open list:DEVICE-MAPPER \(LVM\)" <dm-devel@redhat.com>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Paolo Bonzini <pbonzini@redhat.com>, Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH 1/2] scsi: core: fix missing .cleanup_rq for
 SCSI hosts without request batching
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 07 Aug 2019 23:33:36 +0000 (UTC)

On Wed, Aug 7, 2019 at 10:55 PM Steffen Maier <maier@linux.ibm.com> wrote:
>
> This was missing from scsi_mq_ops_no_commit of linux-next commit
> 8930a6c20791 ("scsi: core: add support for request batching")
> from Martin's scsi/5.4/scsi-queue or James' scsi/misc.
>
> See also linux-next commit b7e9e1fb7a92 ("scsi: implement .cleanup_rq
> callback") from block/for-next.
>
> Signed-off-by: Steffen Maier <maier@linux.ibm.com>
> Fixes: 8930a6c20791 ("scsi: core: add support for request batching")
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Ming Lei <ming.lei@redhat.com>
> ---
>  drivers/scsi/scsi_lib.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
> index ae03d3e2600f..90c257622bb0 100644
> --- a/drivers/scsi/scsi_lib.c
> +++ b/drivers/scsi/scsi_lib.c
> @@ -1834,6 +1834,7 @@ static const struct blk_mq_ops scsi_mq_ops_no_commit = {
>         .init_request   = scsi_mq_init_request,
>         .exit_request   = scsi_mq_exit_request,
>         .initialize_rq_fn = scsi_initialize_rq,
> +       .cleanup_rq     = scsi_cleanup_rq,
>         .busy           = scsi_mq_lld_busy,
>         .map_queues     = scsi_map_queues,
>  };

This one is a cross-tree thing, either scsi/5.4/scsi-queue needs to
pull for-5.4/block, or
do it after both land linus tree.

Thanks,
Ming Lei

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
