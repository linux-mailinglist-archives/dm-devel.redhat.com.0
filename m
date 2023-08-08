Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7240E775335
	for <lists+dm-devel@lfdr.de>; Wed,  9 Aug 2023 08:50:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691563812;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+r2rdC6olrcSoOIRDix5NNNPn9TBgtZsy0BwkX0JxGw=;
	b=DMsQnfrBTMiqZZ3FNpsxp03dh9oSKfILKrX8KFigzg/XFRHbCRJM2FYNSXZst/nSsude0e
	DexqDmAaBuDI1oyypBuwjrJJJJgGLxfiQ1wWC01rS/N/vUb/PCHqThtdgRKii4+DSufXJr
	p8AT98sNUFQ2HFeIYLxLoKL70TZXv4k=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-QeghkJXROgCMVKWTDMWQPw-1; Wed, 09 Aug 2023 02:50:10 -0400
X-MC-Unique: QeghkJXROgCMVKWTDMWQPw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 514461C04181;
	Wed,  9 Aug 2023 06:50:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 17B2440C2076;
	Wed,  9 Aug 2023 06:50:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2A9A619465A4;
	Wed,  9 Aug 2023 06:50:02 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4AC4A1946586
 for <dm-devel@listman.corp.redhat.com>; Tue,  8 Aug 2023 17:41:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3C6322166B27; Tue,  8 Aug 2023 17:41:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34E262166B25
 for <dm-devel@redhat.com>; Tue,  8 Aug 2023 17:41:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1664A8DC666
 for <dm-devel@redhat.com>; Tue,  8 Aug 2023 17:41:20 +0000 (UTC)
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-523-RgVEypBgMpmnj0YNQQaxLQ-1; Tue,
 08 Aug 2023 13:41:18 -0400
X-MC-Unique: RgVEypBgMpmnj0YNQQaxLQ-1
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:49596
 helo=pettiford) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1qTQ7J-0000iN-Ns; Tue, 08 Aug 2023 13:03:34 -0400
Date: Tue, 8 Aug 2023 13:03:33 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Yue Haibing <yuehaibing@huawei.com>
Message-Id: <20230808130333.2207c675d008fa6c808a472f@hugovil.com>
In-Reply-To: <20230808150301.45196-1-yuehaibing@huawei.com>
References: <20230808150301.45196-1-yuehaibing@huawei.com>
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
 *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
 *      blocked.  See
 *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 *      for more information. *      [URIs: huawei.com]
 * -4.1 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-7.0 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,URIBL_BLOCKED autolearn=ham autolearn_force=no
 version=3.4.2
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Wed, 09 Aug 2023 06:49:58 +0000
Subject: Re: [dm-devel] [PATCH -next] dm: Remove unused declaration
 dm_get_rq_mapinfo()
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: heinzm@redhat.com, dm-devel@redhat.com, snitzer@kernel.org,
 linux-kernel@vger.kernel.org, agk@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hugovil.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 8 Aug 2023 23:03:01 +0800
Yue Haibing <yuehaibing@huawei.com> wrote:

Hi,

> Commit ae6ad75e5c3c ("dm: remove unused dm_get_rq_mapinfo()")
> removed the implementation but leave declaration.

Maybe change to "removed the implementation but not the declaration."

Hugo Villeneuve.


> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  include/linux/device-mapper.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
> index 69d0435c7ebb..5bc69c6a64e0 100644
> --- a/include/linux/device-mapper.h
> +++ b/include/linux/device-mapper.h
> @@ -502,7 +502,6 @@ int dm_post_suspending(struct dm_target *ti);
>  int dm_noflush_suspending(struct dm_target *ti);
>  void dm_accept_partial_bio(struct bio *bio, unsigned int n_sectors);
>  void dm_submit_bio_remap(struct bio *clone, struct bio *tgt_clone);
> -union map_info *dm_get_rq_mapinfo(struct request *rq);
>  
>  #ifdef CONFIG_BLK_DEV_ZONED
>  struct dm_report_zones_args {
> -- 
> 2.34.1
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

