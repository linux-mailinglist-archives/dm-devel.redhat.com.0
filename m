Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3E90E1147CE
	for <lists+dm-devel@lfdr.de>; Thu,  5 Dec 2019 20:45:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575575100;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=j3QpJZE1qq9f3pIHcT7s8573A+7w27jDbRUAMRA7ThQ=;
	b=XvKLRMaqa7/dXeXUrEcUOO6PJPP8r+RGw0DYlWfXT7txiQ7/Us1BxT5A0asCRqOVY7nARq
	zoIEYtvQWPcBk1nHAhUZ+0pafmV7WVYHe3ZAINtLkIOw1jWZ4xC2Et7YfMw2fyNVkncD8S
	koxwMuuiwiMqaNwcIaCfdzScnyqpoYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-3ywJ95PJPLKkbxM0yrgyFg-1; Thu, 05 Dec 2019 14:44:58 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F355D8017DF;
	Thu,  5 Dec 2019 19:44:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61B175DA32;
	Thu,  5 Dec 2019 19:44:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 499685EC65;
	Thu,  5 Dec 2019 19:44:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB5JhtEg009769 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Dec 2019 14:43:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 02E811008AC5; Thu,  5 Dec 2019 19:43:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE4FE1013EE9
	for <dm-devel@redhat.com>; Thu,  5 Dec 2019 19:43:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57B56185B0D7
	for <dm-devel@redhat.com>; Thu,  5 Dec 2019 19:43:52 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-39-ek1YY0-DMuKi1Rn4hqOdbg-1; Thu, 05 Dec 2019 14:43:48 -0500
Received: by mail-qv1-f65.google.com with SMTP id t9so1735234qvh.13;
	Thu, 05 Dec 2019 11:43:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=SneFGqS/b+BChIUAMOuBcZWaOT4A5IjwI8a6p3DChP8=;
	b=VM7fsNjqftBdngA9X7K2VwEoHuTEIn9ojCn6WY9SpOqI1UMJLSMabyXI016jQj6Ckq
	V0EC/FVPrJR73Ir4HmT3n0Yff18bW9ow6IW7AW5dbYYg6CEiBSMxoaGyVQf6DomSujk6
	sVSt8c2KpPJ0HJaAjai2Q90sSMH6AvY5cn0U17edbSAv9yqXAv+Vyurod7yRSC5XTY3B
	7zXre5gF1cJZ4wVUL1eLsX0G4OyNCw94hvDzRvDoKIpyWsYMo0mfewiCCJN6DXLfLL2e
	2sk0VK96IAiEcmdlEHALw9pwBgl0/6nJeCWvdwU3MQr6T+xUsfyrDZzUKf87epVuBLN+
	57WA==
X-Gm-Message-State: APjAAAXV39hshrRcvlP21da+AlmGLESrOUyQfQhaXxjhrZxjnCp9LRb9
	F4lmRnyxmsakkrLqOpJbROM=
X-Google-Smtp-Source: APXvYqyfRxDVQNPAAuEMzGxRfrRiNjaxSnIOP2KoZpSvUl8vCCOHKVbFpiv4CIh58OX2m5nIb6ZB+w==
X-Received: by 2002:ad4:4c42:: with SMTP id cs2mr9174491qvb.198.1575575027828; 
	Thu, 05 Dec 2019 11:43:47 -0800 (PST)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
	by smtp.gmail.com with ESMTPSA id
	u58sm5676826qtc.15.2019.12.05.11.43.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 11:43:47 -0800 (PST)
Date: Thu, 5 Dec 2019 14:43:46 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20191205194346.GB95063@lobo>
References: <20191204170638.28163-1-ntsironis@arrikto.com>
MIME-Version: 1.0
In-Reply-To: <20191204170638.28163-1-ntsironis@arrikto.com>
X-MC-Unique: ek1YY0-DMuKi1Rn4hqOdbg-1
X-MC-Unique: 3ywJ95PJPLKkbxM0yrgyFg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB5JhtEg009769
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, thornber@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] dm thin: Avoid flushing the data device twice
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Dec 04 2019 at 12:06P -0500,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> Since we flush the data device as part of a metadata commit, it's
> redundant to then submit any deferred REQ_PREFLUSH bios.
> 
> Add a check in process_deferred_bios() for deferred REQ_PREFLUSH bios
> and complete them immediately.
> 
> Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
> ---
>  drivers/md/dm-thin.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
> index e0be545080d0..40d8a255dbc3 100644
> --- a/drivers/md/dm-thin.c
> +++ b/drivers/md/dm-thin.c
> @@ -2383,8 +2383,18 @@ static void process_deferred_bios(struct pool *pool)
>  	while ((bio = bio_list_pop(&bio_completions)))
>  		bio_endio(bio);
>  
> -	while ((bio = bio_list_pop(&bios)))
> -		generic_make_request(bio);
> +	while ((bio = bio_list_pop(&bios))) {
> +		if (bio->bi_opf & REQ_PREFLUSH) {
> +			/*
> +			 * We just flushed the data device as part of the
> +			 * metadata commit, so there is no reason to send
> +			 * another flush.
> +			 */
> +			bio_endio(bio);
> +		} else {
> +			generic_make_request(bio);
> +		}
> +	}
>  }
>  
>  static void do_worker(struct work_struct *ws)
> -- 
> 2.11.0
> 

Don't we need to check if the the bio is an empty flush?  I have this incremental:

---
 drivers/md/dm-thin.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 40d8a255dbc3..9c9a323c0c30 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -2384,16 +2384,15 @@ static void process_deferred_bios(struct pool *pool)
 		bio_endio(bio);
 
 	while ((bio = bio_list_pop(&bios))) {
-		if (bio->bi_opf & REQ_PREFLUSH) {
-			/*
-			 * We just flushed the data device as part of the
-			 * metadata commit, so there is no reason to send
-			 * another flush.
-			 */
+		/*
+		 * The data device was flushed as part of metadata commit,
+		 * so complete additional deferred empty REQ_PREFLUSH bios
+		 * immediately.
+		 */
+		if ((bio->bi_opf & REQ_PREFLUSH) && !bio_has_data(bio))
 			bio_endio(bio);
-		} else {
+		else
 			generic_make_request(bio);
-		}
 	}
 }
 
-- 
2.15.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

