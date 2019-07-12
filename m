Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CC62C6706E
	for <lists+dm-devel@lfdr.de>; Fri, 12 Jul 2019 15:45:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B4D8308219E;
	Fri, 12 Jul 2019 13:45:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A9D35DDA2;
	Fri, 12 Jul 2019 13:45:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60287206D2;
	Fri, 12 Jul 2019 13:45:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6CDjPK7017886 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 12 Jul 2019 09:45:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2AD5D10002B9; Fri, 12 Jul 2019 13:45:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2495B1001281
	for <dm-devel@redhat.com>; Fri, 12 Jul 2019 13:45:22 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DEEDB307D935
	for <dm-devel@redhat.com>; Fri, 12 Jul 2019 13:45:21 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n4so10077857wrs.3
	for <dm-devel@redhat.com>; Fri, 12 Jul 2019 06:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:from:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=ZJXMb7ROH3Icncc+yqpVX/ECkEZ9xyjuDfL+wcc8mnA=;
	b=MVWsYirrMyeOTHikWoePTa7GAh5BMbPauxdvdAME51+OjnSc6rejroLxXatNQwc5zn
	EtETk/GN15R8tpG+VmPLTwJwN1fYja1GYGgtf/cbYJNGzg6TaDAzu43tEStHNZGkEaOL
	X5LTU+KkXuPtcgitQE9Yp8hzcOQSWFNa4rO+XIgbenpvWgo84S30UeTbUQJHEjg0tycQ
	nN86wCHPxocx+Um93Bg0xnfTtEAU0cZE7GJTvUQAq6l1W7bd49DG+Wn7ZTeBPG2sHzxf
	GAUPqrTeOuYIP9LU9ixZUNWgrJT0ObWjbx49S7L0uYmYx627kHMLsh8Qx9AwwQsXBAN9
	WBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZJXMb7ROH3Icncc+yqpVX/ECkEZ9xyjuDfL+wcc8mnA=;
	b=hoApUHyXlCg19L+ACxmah2M3pdGE20rF0MTaY82Mm3C39SMe6qrWAIGPL9Nm/SRRGN
	WEn3FZHmsIGOz+bUtFBkNmODaxuyhqrfgwYPHvaTvWbVsZCVpb5zWtE3yAvRr2QVWY93
	ZWO7yipjYaB4Ubh6716jQfso+Qz7N9VpBAWHXDnZ4vPk1WhVi3T8tb/hqzVgjuGPX6eI
	nWJh3SIXHGSibdp3VKWsmJppG+VRrefCvpqhU86RJ45yLWifGIFUZVxdhlN3U4oQNgZY
	IFODVIAwNN8gtwwr+ZH8s2hrJKkBuD7DjjlLG3G0EwPavBiySuASY+M8yM+a03u10k9Y
	BmLg==
X-Gm-Message-State: APjAAAU+tVKXDRuSLBHMJ7kuJF5V9WGepC/pW0YiLDEzDslzkqENEW84
	yjgq3A62UTpunw11H4ZLJ1mQowGqtLw=
X-Google-Smtp-Source: APXvYqxpgIIVXRQQFEfbcKY52pCK5qmGJ1I4kuALk8PZtx1cSci10lsvc/oTOusVLRiZxJTKymR1vA==
X-Received: by 2002:a05:6000:1186:: with SMTP id
	g6mr12322188wrx.17.1562939120580; 
	Fri, 12 Jul 2019 06:45:20 -0700 (PDT)
Received: from [10.94.250.118] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	z1sm10000991wrv.90.2019.07.12.06.45.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jul 2019 06:45:20 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
References: <20190603134017.9323-1-ntsironis@arrikto.com>
Message-ID: <b6cdb071-f8d3-7c09-c938-71689ceb1c95@arrikto.com>
Date: Fri, 12 Jul 2019 16:45:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190603134017.9323-1-ntsironis@arrikto.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 12 Jul 2019 13:45:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Fri, 12 Jul 2019 13:45:22 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: 1.293 * (DKIM_SIGNED, DKIM_VALID, PDS_NO_HELO_DNS,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm kcopyd: Increase sub-job size to 512KiB
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 12 Jul 2019 13:45:54 +0000 (UTC)

Hi Mike,

A kind reminder about this patch. Do you require any changes or will you
merge it as is?

Thanks,
Nikos

On 6/3/19 4:40 PM, Nikos Tsironis wrote:
> Currently, kcopyd has a sub-job size of 64KiB and a maximum number of 8
> sub-jobs. As a result, for any kcopyd job, we have a maximum of 512KiB
> of I/O in flight.
> 
> This upper limit to the amount of in-flight I/O under-utilizes fast
> devices and results in decreased throughput, e.g., when writing to a
> snapshotted thin LV with I/O size less than the pool's block size (so
> COW is performed using kcopyd).
> 
> Increase kcopyd's sub-job size to 512KiB, so we have a maximum of 4MiB
> of I/O in flight for each kcopyd job. This results in an up to 96%
> improvement of bandwidth when writing to a snapshotted thin LV, with I/O
> sizes less than the pool's block size.
> 
> We evaluate the performance impact of the change by running the
> snap_breaking_throughput benchmark, from the device mapper test suite
> [1].
> 
> The benchmark:
> 
>   1. Creates a 1G thin LV
>   2. Provisions the thin LV
>   3. Takes a snapshot of the thin LV
>   4. Writes to the thin LV with:
> 
>       dd if=/dev/zero of=/dev/vg/thin_lv oflag=direct bs=<I/O size>
> 
> Running this benchmark with various thin pool block sizes and dd I/O
> sizes (all combinations triggering the use of kcopyd) we get the
> following results:
> 
> +-----------------+-------------+------------------+-----------------+
> | Pool block size | dd I/O size | BW before (MB/s) | BW after (MB/s) |
> +-----------------+-------------+------------------+-----------------+
> |       1 MB      |      256 KB |       242        |       280       |
> |       1 MB      |      512 KB |       238        |       295       |
> |                 |             |                  |                 |
> |       2 MB      |      256 KB |       238        |       354       |
> |       2 MB      |      512 KB |       241        |       380       |
> |       2 MB      |        1 MB |       245        |       394       |
> |                 |             |                  |                 |
> |       4 MB      |      256 KB |       248        |       412       |
> |       4 MB      |      512 KB |       234        |       432       |
> |       4 MB      |        1 MB |       251        |       474       |
> |       4 MB      |        2 MB |       257        |       504       |
> |                 |             |                  |                 |
> |       8 MB      |      256 KB |       239        |       420       |
> |       8 MB      |      512 KB |       256        |       431       |
> |       8 MB      |        1 MB |       264        |       467       |
> |       8 MB      |        2 MB |       264        |       502       |
> |       8 MB      |        4 MB |       281        |       537       |
> +-----------------+-------------+------------------+-----------------+
> 
> [1] https://github.com/jthornber/device-mapper-test-suite
> 
> Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
> ---
>  drivers/md/dm-kcopyd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-kcopyd.c b/drivers/md/dm-kcopyd.c
> index 671c24332802..db0a7d1e33b7 100644
> --- a/drivers/md/dm-kcopyd.c
> +++ b/drivers/md/dm-kcopyd.c
> @@ -28,7 +28,7 @@
>  
>  #include "dm-core.h"
>  
> -#define SUB_JOB_SIZE	128
> +#define SUB_JOB_SIZE	1024
>  #define SPLIT_COUNT	8
>  #define MIN_JOBS	8
>  #define RESERVE_PAGES	(DIV_ROUND_UP(SUB_JOB_SIZE << SECTOR_SHIFT, PAGE_SIZE))
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
