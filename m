Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED0281506
	for <lists+dm-devel@lfdr.de>; Mon,  5 Aug 2019 11:13:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CCF030224E1;
	Mon,  5 Aug 2019 09:13:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84EF460C47;
	Mon,  5 Aug 2019 09:13:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5361118089C8;
	Mon,  5 Aug 2019 09:13:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x753gW9X028468 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 4 Aug 2019 23:42:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C2A52608A5; Mon,  5 Aug 2019 03:42:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB89060856
	for <dm-devel@redhat.com>; Mon,  5 Aug 2019 03:42:30 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28EC6309DF07
	for <dm-devel@redhat.com>; Mon,  5 Aug 2019 03:42:29 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id c2so35875111plz.13
	for <dm-devel@redhat.com>; Sun, 04 Aug 2019 20:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TyxUsFy0g0AoyoXbyHa8cG3SKeSFUmzhTiNZ1jvQoMY=;
	b=b94eJbBllBeKjACUA7ZSo9nWNoeamDyyUJLzT5V6v2JKv/tL0pgq/kK9PjSqL7kVdG
	NRyIUFYJD9QLfNkDvHAKSWO4GdpQqnzN2cVDZvRKuPzztSkAmUQquyQ6GllHwmIzkm+u
	mdoRQiDfAdpO1Nb6kouGlS5XcrVWJ+Rg6l3PZJeBxvrBiJpwRVAJ8ps46Kv8ww45//Fj
	RTQhPKHbmhlRJEfz0d8Vvcr35cQoymlOc6gj7yKoS3vLu90eSPOVGu8fHrdKg0dmXOQf
	gu0Tekg9SDldJlVdFqtOyeiFy0/CAjRAysgOaYSgOnmvRC4AKJNKeb2GMEuN59RJm4xF
	HfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TyxUsFy0g0AoyoXbyHa8cG3SKeSFUmzhTiNZ1jvQoMY=;
	b=A83ee7ZN6/6fzJFPlmfH6OoGOQz5aKdvPsuq/IaT1ST/I6BQwo2BEE/wb4Y3QSlTDx
	ONoxNhs3zHxvTHFamNak8GI/Hy+3fQXsHHiyMK1OJVETU+U7Nmz2K3NPr4eP+zV++b1m
	mEVpF7wAl1U9cZYGdmurShNLEPqQn9EXaXGHFolgiFcE2wpD+9bX+stv5Kj+X5ArjrL0
	O20+KyS455ZShIK3GLvBv9CQhDhtOF7HjDqVwqLsxnPQHvrI1SIyReJ8YFNYFVlbHhmr
	qb0ntmKxRZKQ2aUalHZbh8xiBFJje9vA1ftDVYBjyxtDVOAB0K7KA9S964y4b/UgTYpW
	tYGg==
X-Gm-Message-State: APjAAAXX7wtEAuXBsEKA3sxWRgq8dlSQmXqWOAr5l8lnhsOtkUanzsCJ
	4JClUSwDCYwuTUZZ75BeHgwvTSN6XeI=
X-Google-Smtp-Source: APXvYqwLmx/zPu6DfQ6/dzDHZTfJz/tMSWimusqin+r7kDygU7dS7M/pjBgVPVIyhYb8fBZ8W3K+7Q==
X-Received: by 2002:a17:902:ac87:: with SMTP id
	h7mr21880581plr.36.1564976548565; 
	Sun, 04 Aug 2019 20:42:28 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:83a1:61e6:1197:7c18:827e?
	([2605:e000:100e:83a1:61e6:1197:7c18:827e])
	by smtp.gmail.com with ESMTPSA id o3sm14505866pje.1.2019.08.04.20.42.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Aug 2019 20:42:27 -0700 (PDT)
To: Ming Lei <ming.lei@redhat.com>
References: <20190725020500.4317-1-ming.lei@redhat.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <c7bd89e5-6fa9-2b3c-94f5-ca7ff9004e6a@kernel.dk>
Date: Sun, 4 Aug 2019 20:42:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725020500.4317-1-ming.lei@redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 05 Aug 2019 03:42:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Mon, 05 Aug 2019 03:42:29 +0000 (UTC) for IP:'209.85.214.193'
	DOMAIN:'mail-pl1-f193.google.com'
	HELO:'mail-pl1-f193.google.com' FROM:'axboe@kernel.dk' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.214.193 mail-pl1-f193.google.com 209.85.214.193
	mail-pl1-f193.google.com <axboe@kernel.dk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 05 Aug 2019 05:12:55 -0400
Cc: Hannes Reinecke <hare@suse.com>, Bart Van Assche <bvanassche@acm.org>,
	Mike Snitzer <snitzer@redhat.com>, "Ewan D . Milne" <emilne@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	stable@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH V4 0/2] block/scsi/dm-rq: fix leak of request
 private data in dm-mpath
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 05 Aug 2019 09:13:40 +0000 (UTC)

On 7/24/19 7:04 PM, Ming Lei wrote:
> Hi,
> 
> When one request is dispatched to LLD via dm-rq, if the result is
> BLK_STS_*RESOURCE, dm-rq will free the request. However, LLD may allocate
> private data for this request, so this way will cause memory leak.
> 
> Add .cleanup_rq() callback and implement it in SCSI for fixing the issue,
> since SCSI is the only driver which allocates private requst data in
> .queue_rq() path.
> 
> Another use case of this callback is to free the request and re-submit
> bios during cpu hotplug when the hctx is dead, see the following link:
> 
> https://lore.kernel.org/linux-block/f122e8f2-5ede-2d83-9ca0-bc713ce66d01@huawei.com/T/#t

Applied for 5.4, thanks.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
