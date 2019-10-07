Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EDFCE35C
	for <lists+dm-devel@lfdr.de>; Mon,  7 Oct 2019 15:25:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1D3A315C01F;
	Mon,  7 Oct 2019 13:25:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 024A65C223;
	Mon,  7 Oct 2019 13:25:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5286180B536;
	Mon,  7 Oct 2019 13:25:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x97DPMkF015290 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 7 Oct 2019 09:25:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3DA641001DC2; Mon,  7 Oct 2019 13:25:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 376B110002A2
	for <dm-devel@redhat.com>; Mon,  7 Oct 2019 13:25:18 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F9B55AFF8
	for <dm-devel@redhat.com>; Mon,  7 Oct 2019 13:25:17 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f22so12335662wmc.2
	for <dm-devel@redhat.com>; Mon, 07 Oct 2019 06:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=59tB8yh48IArVOee/Rd8DntbOjEdn6LDsRe56pr4r/8=;
	b=HbV24jpivYzqDjlbXz1WMukXgBj8rd5VCVdiHrQS65tRtcuK7HarP5r7Z28EC8juUn
	xwRiQ/jI7pthSLnEKV+yaI1dM5mSPqxoME2N/CDsVhOMsHoYyUIjdsevFxwPIZbbIGHh
	9moPm5L2FuoTtLTdcHmjJ611umWl+lsWQ1rywhttU6pVXL8XG54sSRyqpl7/nXfwteDr
	G9WlO0+Ir8e5k2DEZtHswLQO80tjjLbu6pqj+SAHT9DBQspxBzXShe9jf3kAFro4c1Uw
	ynyNKm++fD/1vDtAiSlb8BH+Zgdud+lOLqD905LbfA/dWCEo5fRB7e14rQYeFViKeGAC
	tO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=59tB8yh48IArVOee/Rd8DntbOjEdn6LDsRe56pr4r/8=;
	b=cb/begT+4eLG2cETtc2z6VigXSqyMKCwCOBdtIWdvktWdu6UfSTk7k115GUzvwI4lt
	3qHmSCDN7LanIX+HFRoo9V0jQ82cStV1OGIgTL0ksK3F0Mqnn5aUWPBIZUqBycDC8LKA
	JDVxH4QwMgUD7wX6Yf6dn+FcFwoyHCejLiTtrV5hMSeWKR/FuHs7oxHmjjo2WNfyKKtH
	npGMvTpT+LgMNZjHbztXLfAwJUO5gLjTQKDdhM90VJDAd59YHlJIhO5g3cDWcy0mosmc
	TN7eSTI37u6EXbfwNJjOeerGfnn7PmCrR/CZo0SWlqn22CP8Q44aDIlblhnY+Ri9WvXg
	uurQ==
X-Gm-Message-State: APjAAAVWGOrZ+UST36q46NZkOtI3WySU1bFuK3lbIcqvZUUbgH0qy+8+
	QLOpWifMvqvGiGU9LqMOXdaLdYg7F3U=
X-Google-Smtp-Source: APXvYqw85wfYUBMg0+TI3vz1ewkIZJtoYoo6ruHVPJahNQ6P88i0ZUEMyvQrqlsM0xSF0wLruDrhMQ==
X-Received: by 2002:a7b:c10b:: with SMTP id w11mr19638837wmi.108.1570454715947;
	Mon, 07 Oct 2019 06:25:15 -0700 (PDT)
Received: from [192.168.1.111] (130.43.24.211.dsl.dyn.forthnet.gr.
	[130.43.24.211]) by smtp.gmail.com with ESMTPSA id
	a2sm21196729wrt.45.2019.10.07.06.25.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Oct 2019 06:25:15 -0700 (PDT)
To: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <msnitzer@redhat.com>
References: <alpine.LRH.2.02.1910041015330.11863@file01.intranet.prod.int.rdu2.redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <00196cf3-e98e-e9ff-7494-e097182c80cf@arrikto.com>
Date: Mon, 7 Oct 2019 16:25:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1910041015330.11863@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 07 Oct 2019 13:25:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Mon, 07 Oct 2019 13:25:17 +0000 (UTC) for IP:'209.85.128.66'
	DOMAIN:'mail-wm1-f66.google.com' HELO:'mail-wm1-f66.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.66 mail-wm1-f66.google.com 209.85.128.66
	mail-wm1-f66.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Vangelis Koukis <vkoukis@arrikto.com>, dm-devel@redhat.com,
	Ilias Tsitsimpis <iliastsi@arrikto.com>
Subject: Re: [dm-devel] [PATCH] dm-clone: replace spin_lock_irqsave with
	spin_lock_irq
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 07 Oct 2019 13:25:54 +0000 (UTC)

On 10/4/19 5:17 PM, Mikulas Patocka wrote:
> If we are in a place where it is known that interrupts are enabled,
> functions spin_lock_irq/spin_unlock_irq should be used instead of
> spin_lock_irqsave/spin_unlock_irqrestore.
> 
> spin_lock_irq and spin_unlock_irq are faster because the don't need to
> push and pop the flags register.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> 

I reviewed the patch and it looks good. As a minor addition, I attach a
patch which updates the dm_clone_cond_set_range() comment.

Moreover, I will send a complementary patch converting a few more uses
of spin_lock_irqsave/spin_unlock_irqrestore to
spin_lock_irq/spin_unlock_irq.

Thanks,
Nikos


>From 097517d594cc127d2f21ca976f1e7df304e1ed10 Mon Sep 17 00:00:00 2001
From: Nikos Tsironis <ntsironis@arrikto.com>
Date: Mon, 7 Oct 2019 14:07:19 +0300
Subject: [PATCH] dm clone: Fix dm_clone_cond_set_range() comment

Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
---
 drivers/md/dm-clone-metadata.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-clone-metadata.h b/drivers/md/dm-clone-metadata.h
index 434bff08508b..9d3d29e6a838 100644
--- a/drivers/md/dm-clone-metadata.h
+++ b/drivers/md/dm-clone-metadata.h
@@ -44,7 +44,9 @@ int dm_clone_set_region_hydrated(struct dm_clone_metadata *cmd, unsigned long re
  * @start: Starting region number
  * @nr_regions: Number of regions in the range
  *
- * This function doesn't block, so it's safe to call it from interrupt context.
+ * This function doesn't block, but since it uses
+ * spin_lock_irq()/spin_unlock_irq() it's NOT safe to call it from any context
+ * where interrupts are disabled, e.g., from interrupt context.
  */
 int dm_clone_cond_set_range(struct dm_clone_metadata *cmd, unsigned long start,
 			    unsigned long nr_regions);
-- 
2.11.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
