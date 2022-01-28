Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE0949F23E
	for <lists+dm-devel@lfdr.de>; Fri, 28 Jan 2022 05:08:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643342927;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MybhjE/QOsCVlRTR7PikBC3OIoFEnyeZM57W4YwZuzA=;
	b=Z5NWsmZ/5WAcXVNh9RLningRGuM6AJfZGNdeEFVOsvLL9TpTxOJmTRIsANc6eb5qTqJqkA
	1YzgGEsXoLY84hh/rSW6QfGt6rHDi0xeMhG4H+fpcDVBvB7qLFIMSvG9fi2lPVwfMCqcv1
	XzDocqHWgxdPQRICK0R3rkFkXFmD7VY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-MU_ANJ5lO2a5XsFBz_c36g-1; Thu, 27 Jan 2022 23:08:45 -0500
X-MC-Unique: MU_ANJ5lO2a5XsFBz_c36g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D3A080D680;
	Fri, 28 Jan 2022 04:08:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E404E10D1537;
	Fri, 28 Jan 2022 04:08:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F3BD41809CB8;
	Fri, 28 Jan 2022 04:08:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20S4844X007926 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Jan 2022 23:08:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9629C40CFD39; Fri, 28 Jan 2022 04:08:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9247840CFD0D
	for <dm-devel@redhat.com>; Fri, 28 Jan 2022 04:08:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7843485A5A8
	for <dm-devel@redhat.com>; Fri, 28 Jan 2022 04:08:04 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
	[209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-517-P9-7Gkt5NfuAlBOmCWOCOA-1; Thu, 27 Jan 2022 23:08:03 -0500
X-MC-Unique: P9-7Gkt5NfuAlBOmCWOCOA-1
Received: by mail-qt1-f200.google.com with SMTP id
	g18-20020ac84b72000000b002cf274754c5so3698224qts.14
	for <dm-devel@redhat.com>; Thu, 27 Jan 2022 20:08:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=6xI2q4JRMwbUUKNVQY8ddDYbQMyZc0rJHfSmrjO/C2I=;
	b=VT9LoXGI9j/UtMNrL4aZuIh1OY53wPQuekujuVpb+QKAEUYZk81Q2X5DU1ktn8zi5p
	qzjU+dHx1nYMbsP2mv1KYXmFORqaJcOjmgN3p33OoAPbutMnhTfhHrAX2HRPFFkEH6YU
	hPH7P4uMBLVP9KtK3iHePelYmeiQGwVzcYycaNBksLVElXyeKfQY7qVa3iqx1oA2BY7b
	xz1wyR4ziNC4+/W9oLCwGAWK0zwTQ4IIHC5hKQmwrPD7VsMtS+AqXLD6JQAJ76SSdq1k
	vzDYaGyaII9shDhPvCOfrdD3oKo4J9B4JgDvyZbNPlIg5YHVagoZ6nxGTz/p77lXzwan
	CSRw==
X-Gm-Message-State: AOAM530RuwT+tZ3+SF7fn60h1on427jpecjtfg15/zEyGIIdSCkRbI5I
	zGnJN5fqI0nuvAGsrOekSrpuyrWsIRyN1+Reo5WDEYnUltq38QP9NuspcU6kpYE3ogVdVKiyDBe
	02EPKLM7pfJgiFw==
X-Received: by 2002:a37:a50d:: with SMTP id o13mr4690898qke.43.1643342882445; 
	Thu, 27 Jan 2022 20:08:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykB8s96fGvjnatQ4aYNG5YSnGZIPhh0tuM1T9LxfK+uT5UmElHRNJ9xxbe0ii1C52PKL03Bg==
X-Received: by 2002:a37:a50d:: with SMTP id o13mr4690893qke.43.1643342882227; 
	Thu, 27 Jan 2022 20:08:02 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	t13sm2307026qti.47.2022.01.27.20.08.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Jan 2022 20:08:01 -0800 (PST)
Date: Thu, 27 Jan 2022 23:08:00 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: axboe@kernel.dk
Message-ID: <YfNsIP/iUX/xywO2@redhat.com>
References: <20220127225648.28729-1-snitzer@redhat.com>
	<20220127225648.28729-4-snitzer@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220127225648.28729-4-snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com, hch@lst.de
Subject: Re: [dm-devel] [PATCH v2 3/3] dm: properly fix redundant bio-based
	IO accounting
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 27 2022 at  5:56P -0500,
Mike Snitzer <snitzer@redhat.com> wrote:

> Record the start_time for a bio but defer the starting block core's IO
> accounting until after IO is submitted using bio_start_io_acct_time().
> 
> This approach avoids the need to mess around with any of the
> individual IO stats in response to a bio_split() that follows bio
> submission.
> 
> Reported-by: Bud Brown <bubrown@redhat.com>
> Cc: stable@vger.kernel.org
> Depends-on: f9893e1da2e3 ("block: add bio_start_io_acct_time() to control start_time")
> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> ---
>  drivers/md/dm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 9849114b3c08..144436301a57 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -489,7 +489,7 @@ static void start_io_acct(struct dm_io *io)
>  	struct mapped_device *md = io->md;
>  	struct bio *bio = io->orig_bio;
>  
> -	io->start_time = bio_start_io_acct(bio);
> +	__bio_start_io_acct(bio, io->start_time);
>  	if (unlikely(dm_stats_used(&md->stats)))
>  		dm_stats_account_io(&md->stats, bio_data_dir(bio),
>  				    bio->bi_iter.bi_sector, bio_sectors(bio),

This should be calling bio_start_io_acct_time().
I updated the header but somehow dropped the code change before
sending.

Mike

> @@ -535,7 +535,7 @@ static struct dm_io *alloc_io(struct mapped_device *md, struct bio *bio)
>  	io->md = md;
>  	spin_lock_init(&io->endio_lock);
>  
> -	start_io_acct(io);
> +	io->start_time = READ_ONCE(jiffies);
>  
>  	return io;
>  }
> @@ -1482,6 +1482,7 @@ static void __split_and_process_bio(struct mapped_device *md,
>  			submit_bio_noacct(bio);
>  		}
>  	}
> +	start_io_acct(ci.io);
>  
>  	/* drop the extra reference count */
>  	dm_io_dec_pending(ci.io, errno_to_blk_status(error));
> -- 
> 2.15.0
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

