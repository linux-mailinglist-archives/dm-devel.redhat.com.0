Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8201BE277
	for <lists+dm-devel@lfdr.de>; Wed, 29 Apr 2020 17:23:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588173804;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2IEJJ7pUnGotcTymK8anVE/zI+auSbwjK5YszRZzz2Q=;
	b=HFHDCl3ogoFJziuHRsEYa040/tHG1xLHsyM8eMz4ntZhPn70Vl+L471DSTKcJNxwon4Zb6
	2qGFM1uYazBIjKZ11Q2JqjB9oiYh3gvQfXS6/3PjzJxLYCVUMPdM+eRb/fCQVQ/V6DkkmG
	s3yJ5XTugf6b8OLmL6nC40lDB+buA24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-Yqmh2-wYMeqWe8OKDP5qug-1; Wed, 29 Apr 2020 11:23:21 -0400
X-MC-Unique: Yqmh2-wYMeqWe8OKDP5qug-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41A6A107ACF5;
	Wed, 29 Apr 2020 15:23:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 525BC66067;
	Wed, 29 Apr 2020 15:23:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57C214CAA0;
	Wed, 29 Apr 2020 15:23:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03TFN0UN016077 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 11:23:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D34A5C1BE; Wed, 29 Apr 2020 15:23:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B3315C220;
	Wed, 29 Apr 2020 15:22:54 +0000 (UTC)
Date: Wed, 29 Apr 2020 11:22:53 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: heinzm@redhat.com
Message-ID: <20200429152253.GA22958@redhat.com>
References: <dff475cd16489080bb229af9bb45c0d67480b8be.1588172814.git.heinzm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <dff475cd16489080bb229af9bb45c0d67480b8be.1588172814.git.heinzm@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] dm ebs: fix bio->bi_status assignment
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Apr 29 2020 at 11:07am -0400,
heinzm@redhat.com <heinzm@redhat.com> wrote:

> From: Heinz Mauelshagen <heinzm@redhat.com>
> 
> Assign blk_status_t to bi_status properly in __ebs_process_bios()
> on error (flaw found by static checker).
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Heinz Mauelshagen <heinzm@redhat.com>
> ---
>  drivers/md/dm-ebs-target.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-ebs-target.c b/drivers/md/dm-ebs-target.c
> index 97703c31771f..c9c66d6b1e56 100644
> --- a/drivers/md/dm-ebs-target.c
> +++ b/drivers/md/dm-ebs-target.c
> @@ -210,7 +210,8 @@ static void __ebs_process_bios(struct work_struct *ws)
>  			r = __ebs_discard_bio(ec, bio);
>  		}
>  
> -		bio->bi_status = r;
> +		if (r < 0)
> +			bio->bi_status = BLK_STS_IOERR;
>  	}
>  
>  	/*
> -- 
> 2.25.4
> 

Proper way is to use errno_to_blk_status().  I've folded in:

-		bio->bi_status = r;
+		if (r < 0)
+			bio->bi_status = errno_to_blk_status(r);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

