Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 811AC1B65D4
	for <lists+dm-devel@lfdr.de>; Thu, 23 Apr 2020 23:00:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587675650;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hcN20KOrcHaX3K0TKzrYyV9EjG/AjNuUcgS3qoJuNHU=;
	b=LV2Yti9dPLjdUrmMSctt8cfFPOm0lSuupHzTPcrRrw7GHdp8QBK5EXSJA64bbgfd/XB3XL
	7Gy6x+cnToEfFsEs5c2SKV/vD3QsFpZUrQQ8zCEC9Ysuxpq39OiI7+1/gCklC7mAVKIZSf
	+z/xukFMEx+Xldjf3Gx405/uPxp8Mrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-G7KWQoBzMMadGP0qxuliuQ-1; Thu, 23 Apr 2020 17:00:42 -0400
X-MC-Unique: G7KWQoBzMMadGP0qxuliuQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C14BE45F;
	Thu, 23 Apr 2020 21:00:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BF4A5C1D2;
	Thu, 23 Apr 2020 21:00:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1CF284CAA0;
	Thu, 23 Apr 2020 21:00:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03NKxvFF006077 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Apr 2020 16:59:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3B25B202696B; Thu, 23 Apr 2020 20:59:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3737F2026D5D
	for <dm-devel@redhat.com>; Thu, 23 Apr 2020 20:59:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80512811E77
	for <dm-devel@redhat.com>; Thu, 23 Apr 2020 20:59:54 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-467-62WLBm-mMM6jH_Z0Wynaig-1; Thu, 23 Apr 2020 16:59:49 -0400
X-MC-Unique: 62WLBm-mMM6jH_Z0Wynaig-1
Received: by mail-qv1-f65.google.com with SMTP id q31so3629829qvf.11;
	Thu, 23 Apr 2020 13:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=ihVUWvH7naN45tEl+tGyxd0ZwoDtNc3umBeh695OPSw=;
	b=CVgVgINCCRl2a57kgGU7Itco8hWyYLwhzsdTVs3/Cd+VeeF7Bwz8evblt0WyWiq6vA
	BDUEX4gvnAvv85a6v/6MY/onBUzC159kqtKgzj59uHKzC8hPRSkOQo3MjHqUgzxQ3G+l
	2orP00KXmOmQOknzDSSlCQw73FxF0SYtl6g8RLXdMtaL4xDxUqloZSpez0ci3lo5gI9H
	jySSFpjY/DoYbG93KBaZIq3utYQM3lr4yzzteBipWRTb4emB6uz5o1NxVCXwYCVfuCLY
	TZxDBXqKljQvz7zyptToLSrPPZ9rCtj7RTj3sPRGMonJ9NwvusKjK4p65Z3iC2ex2qaA
	vkDA==
X-Gm-Message-State: AGi0PuZqNMHuufgrTvtlGVIc3QCqQA6QigmKRtvv4Z/LG0+GRSQ2o0Cq
	2Zey+/wuwvWcxzpdXVS2ijI=
X-Google-Smtp-Source: APiQypJHXpYYUR5/MDUJvrbaDeEG58t7M2St+MPpPFseuRWjUAvumM40T/5oREyhgFfDS1/o90AOwA==
X-Received: by 2002:a0c:8222:: with SMTP id h31mr6142237qva.106.1587675588472; 
	Thu, 23 Apr 2020 13:59:48 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	h25sm2586381qte.37.2020.04.23.13.59.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Apr 2020 13:59:47 -0700 (PDT)
Date: Thu, 23 Apr 2020 16:59:47 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20200423205947.GA13657@lobo>
References: <20200416211336.2423618-1-krisman@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20200416211336.2423618-1-krisman@collabora.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03NKxvFF006077
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, khazhy@google.com, kernel@collabora.com,
	linux-kernel@vger.kernel.org, agk@redhat.com
Subject: Re: [dm-devel] [PATCH 0/2] Historical Service Time Path Selector
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Apr 16 2020 at  5:13P -0400,
Gabriel Krisman Bertazi <krisman@collabora.com> wrote:

> Hello,
> 
> This small series implements a new path selector that leverages
> historical path IO time in order to estimate future path performance.
> Implementation details can be found on Patch 2.
> 
> This selector yields better path distribution, considering the mean
> deviation from the calculated optimal utilization, for small IO depths
> when compared to the Service Time selector with fio benchmarks.  For
> instance, on a multipath setup with 4 paths, where one path is 4 times
> slower than the rest, issuing 500MB of randwrites, we have the following
> path utilization rates:
> 
>       |    depth=1    |    depth=64   |       |
>       |   ST  |   HST |   ST  |   HST |  Best |
> |-----+-------+-------+-------+-------+-------|
> | sda | 0.250 | 0.294 | 0.297 | 0.294 | 0.307 |
> | sdb | 0.250 | 0.297 | 0.296 | 0.297 | 0.307 |
> | sdc | 0.250 | 0.296 | 0.298 | 0.296 | 0.307 |
> | sdd | 0.250 | 0.112 | 0.106 | 0.112 | 0.076 |
> 
> For small depths, HST is much quicker in detecting slow paths and has a
> better selection than ST.  As the iodepth increases, ST gets close to
> HST, which still behaves steadily.
> 
> The raw performance data for different depths types of IO can be found
> at:
> 
>   <https://people.collabora.com/~krisman/GOO0012/hst-vs-st-bench.html>
> 
> This was tested primarily on a Google cloud SAN with real data and usage
> patterns and with artificial benchmarks using fio.
> 
> Khazhismel Kumykov (2):
>   md: Expose struct request to path selector
>   md: Add Historical Service Time Path Selector

Looks like you've put a lot of time to this and I'd be happy to help
you get this to land upstream.

But... (you knew there'd be at least one "but" right? ;) I'm not
liking making this path selector request-based specific.  All other
selectors up to this point are request-based vs bio-based agnostic.

Would you be open to dropping patch 1/2 and replacing it with
something like the following patch?

Then you'd pass 'u64 start_time_ns' into the path_selector_type's
.end_io (and possibly .start_io).

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index df13fdebe21f..50121513227b 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -674,6 +674,16 @@ static bool md_in_flight(struct mapped_device *md)
 		return md_in_flight_bios(md);
 }
 
+u64 dm_start_time_ns_from_clone(struct bio *bio)
+{
+	struct dm_target_io *tio = container_of(bio, struct dm_target_io, clone);
+	struct dm_io *io = tio->io;
+
+	/* FIXME: convert io->start_time from jiffies to nanoseconds */
+	return (u64)jiffies_to_msec(io->start_time) * NSEC_PER_MSEC;
+}
+EXPORT_SYMBOL_GPL(dm_start_time_ns_from_clone);
+
 static void start_io_acct(struct dm_io *io)
 {
 	struct mapped_device *md = io->md;
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index 475668c69dbc..e2d506dd805e 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -329,6 +329,8 @@ void *dm_per_bio_data(struct bio *bio, size_t data_size);
 struct bio *dm_bio_from_per_bio_data(void *data, size_t data_size);
 unsigned dm_bio_get_target_bio_nr(const struct bio *bio);
 
+u64 dm_start_time_ns_from_clone(struct bio *bio);
+
 int dm_register_target(struct target_type *t);
 void dm_unregister_target(struct target_type *t);
 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

