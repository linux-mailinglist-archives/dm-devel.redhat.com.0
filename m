Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0422F256923
	for <lists+dm-devel@lfdr.de>; Sat, 29 Aug 2020 18:48:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-1VTQVl97O66Dm-OteWE-Xg-1; Sat, 29 Aug 2020 12:48:17 -0400
X-MC-Unique: 1VTQVl97O66Dm-OteWE-Xg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79C151074656;
	Sat, 29 Aug 2020 16:48:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45E344212;
	Sat, 29 Aug 2020 16:48:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BDDD183D020;
	Sat, 29 Aug 2020 16:47:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07TGlKvA008372 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 29 Aug 2020 12:47:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 049F52028CCE; Sat, 29 Aug 2020 16:47:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F23852018033
	for <dm-devel@redhat.com>; Sat, 29 Aug 2020 16:47:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB14F800962
	for <dm-devel@redhat.com>; Sat, 29 Aug 2020 16:47:17 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
	[209.85.216.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-124-RA91fTdGNumsi5dAsS39gw-1; Sat, 29 Aug 2020 12:47:15 -0400
X-MC-Unique: RA91fTdGNumsi5dAsS39gw-1
Received: by mail-pj1-f41.google.com with SMTP id 2so963004pjx.5
	for <dm-devel@redhat.com>; Sat, 29 Aug 2020 09:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5Rt5+Gjo0UGdPCISf5CydG1I/Z+wq56+kU1eC124qs0=;
	b=HC+qsnVH/9tqPXDyTOkO6oMm7q93QdnFKbfbIFAkibJVNkPonhQc34Y4opJwlJZJph
	VTs1ujeuBw4Z2r1FpEorvjJoKIQ+t0CGcTPFw2mM+tBAUh2aJtiFFgmobePDIKs626mw
	V09pKm2UWJTMdYbxc6s3//uz9LOKCExklfgsyQrn5Hbi0GMXZMbZh3xU9kbYI3aqceXq
	XJ6yAQGqJOpCxgDYEc7COm5LKn+qOEdQfOPARwe7Y1X8dOiXpRCzNnRFW4S3C8gqaz+g
	xxjWn8zPB0+D/1OYyFz9gLJx2MgLqx0vyqpTRNphd5KXRAzz9EvkLID6EkAXoIB+MteI
	VxzQ==
X-Gm-Message-State: AOAM532/0Ix5o6GAEJDY3sIMYBmDT6kG83BsefwxRyNCAWuLnA3g+3sZ
	7pJdEWvLZKOBJBt8VDfMLy7e8w==
X-Google-Smtp-Source: ABdhPJwh/IaT8sjJze0JR0UOlWwMhEHIvT0ikyEXE/ycXPb0JRTnRL4uDSst200BKNS1envrwdz+3g==
X-Received: by 2002:a17:90a:c917:: with SMTP id
	v23mr3622499pjt.97.1598719634004; 
	Sat, 29 Aug 2020 09:47:14 -0700 (PDT)
Received: from [192.168.1.182] ([66.219.217.173])
	by smtp.gmail.com with ESMTPSA id
	w82sm3114901pfc.183.2020.08.29.09.47.12
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 29 Aug 2020 09:47:13 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200823091043.2600261-1-hch@lst.de>
	<20200827074758.GA8009@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <b1960016-c265-1e1d-cfd7-de2330bc5eac@kernel.dk>
Date: Sat, 29 Aug 2020 10:47:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200827074758.GA8009@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-s390@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
	Justin Sanders <justin@coraid.com>, linux-nvme@lists.infradead.org,
	Josef Bacik <josef@toxicpanda.com>, Xianting Tian <xianting_tian@126.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Stefan Haberland <sth@linux.ibm.com>,
	nbd@other.debian.org
Subject: Re: [dm-devel] fix block device size update serialization v2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 8/27/20 1:47 AM, Christoph Hellwig wrote:
> Jens, can you consider this for 5.9?  It reliably fixes the reported
> hangs with nvme hotremoval that we've had for a few releases.

I've queued this up for 5.10. I think it's too late for 5.9 at this
point, and it's not a regression in this release.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

